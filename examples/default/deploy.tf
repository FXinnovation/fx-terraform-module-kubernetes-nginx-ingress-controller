#####
# Providers
#####

provider "random" {
}

provider "kubernetes" {
  load_config_file = true
}

#####
# Randoms
#####

resource "random_string" "default" {
  upper   = false
  number  = false
  special = false
  length  = 8
}

#####
# MetalLB
#####
# NOTE: This is a shim, it's not purposely deployed to work, just give the impression that it works.
# you should NOT take this code as working example of MetalLB

resource "kubernetes_config_map" "config" {
  metadata {
    name      = "config"
    namespace = kubernetes_namespace.metallb_system.metadata.0.name
  }

  data = {
    config = "address-pools:\n- name: default\n  protocol: layer2\n  addresses:\n  - 192.168.1.240-192.168.1.250\n"
  }
}

resource "kubernetes_namespace" "metallb_system" {
  metadata {
    name = "metallb-system"

    labels = {
      app = "metallb"
    }
  }
}

resource "kubernetes_service_account" "controller" {
  metadata {
    name      = "controller"
    namespace = kubernetes_namespace.metallb_system.metadata.0.name

    labels = {
      app = "metallb"
    }
  }
}

resource "kubernetes_service_account" "speaker" {
  metadata {
    name      = "speaker"
    namespace = kubernetes_namespace.metallb_system.metadata.0.name

    labels = {
      app = "metallb"
    }
  }
}

resource "kubernetes_cluster_role" "metallb_system_controller" {
  metadata {
    name = "metallb-system:controller"

    labels = {
      app = "metallb"
    }
  }

  rule {
    verbs      = ["get", "list", "watch", "update"]
    api_groups = [""]
    resources  = ["services"]
  }

  rule {
    verbs      = ["update"]
    api_groups = [""]
    resources  = ["services/status"]
  }

  rule {
    verbs      = ["create", "patch"]
    api_groups = [""]
    resources  = ["events"]
  }

  rule {
    verbs          = ["use"]
    api_groups     = ["policy"]
    resources      = ["podsecuritypolicies"]
    resource_names = ["controller"]
  }
}

resource "kubernetes_cluster_role" "metallb_system_speaker" {
  metadata {
    name = "metallb-system:speaker"

    labels = {
      app = "metallb"
    }
  }

  rule {
    verbs      = ["get", "list", "watch"]
    api_groups = [""]
    resources  = ["services", "endpoints", "nodes"]
  }

  rule {
    verbs      = ["create", "patch"]
    api_groups = [""]
    resources  = ["events"]
  }

  rule {
    verbs          = ["use"]
    api_groups     = ["policy"]
    resources      = ["podsecuritypolicies"]
    resource_names = ["speaker"]
  }
}

resource "kubernetes_role" "config_watcher" {
  metadata {
    name      = "config-watcher"
    namespace = kubernetes_namespace.metallb_system.metadata.0.name

    labels = {
      app = "metallb"
    }
  }

  rule {
    verbs      = ["get", "list", "watch"]
    api_groups = [""]
    resources  = ["configmaps"]
  }
}

resource "kubernetes_role" "pod_lister" {
  metadata {
    name      = "pod-lister"
    namespace = kubernetes_namespace.metallb_system.metadata.0.name

    labels = {
      app = "metallb"
    }
  }

  rule {
    verbs      = ["list"]
    api_groups = [""]
    resources  = ["pods"]
  }
}

resource "kubernetes_cluster_role_binding" "metallb_system_controller" {
  metadata {
    name = "metallb-system:controller"

    labels = {
      app = "metallb"
    }
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.controller.metadata.0.name
    namespace = kubernetes_namespace.metallb_system.metadata.0.name
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = kubernetes_cluster_role.metallb_system_controller.metadata.0.name
  }
}

resource "kubernetes_cluster_role_binding" "metallb_system_speaker" {
  metadata {
    name = "metallb-system:speaker"

    labels = {
      app = "metallb"
    }
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.speaker.metadata.0.name
    namespace = kubernetes_namespace.metallb_system.metadata.0.name
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = kubernetes_cluster_role.metallb_system_speaker.metadata.0.name
  }
}

resource "kubernetes_role_binding" "config_watcher" {
  metadata {
    name      = "config-watcher"
    namespace = kubernetes_namespace.metallb_system.metadata.0.name

    labels = {
      app = "metallb"
    }
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.controller.metadata.0.name
    namespace = kubernetes_namespace.metallb_system.metadata.0.name
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.speaker.metadata.0.name
    namespace = kubernetes_namespace.metallb_system.metadata.0.name
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = "config-watcher"
  }
}

resource "kubernetes_role_binding" "pod_lister" {
  metadata {
    name      = "pod-lister"
    namespace = kubernetes_namespace.metallb_system.metadata.0.name

    labels = {
      app = "metallb"
    }
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.speaker.metadata.0.name
    namespace = kubernetes_namespace.metallb_system.metadata.0.name
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = "pod-lister"
  }
}

resource "kubernetes_daemonset" "speaker" {
  metadata {
    name      = "speaker"
    namespace = kubernetes_namespace.metallb_system.metadata.0.name

    labels = {
      app = "metallb"

      component = "speaker"
    }
  }

  spec {
    selector {
      match_labels = {
        app = "metallb"

        component = "speaker"
      }
    }

    template {
      metadata {
        labels = {
          app = "metallb"

          component = "speaker"
        }

        annotations = {
          "prometheus.io/port" = "7472"

          "prometheus.io/scrape" = "true"
        }
      }

      spec {
        container {
          name  = "speaker"
          image = "metallb/speaker:v0.9.3"
          args  = ["--port=7472", "--config=config"]

          port {
            name           = "monitoring"
            container_port = 7472
            host_port      = 7472
          }

          env {
            name = "METALLB_NODE_NAME"

            value_from {
              field_ref {
                field_path = "spec.nodeName"
              }
            }
          }

          env {
            name = "METALLB_HOST"

            value_from {
              field_ref {
                field_path = "status.hostIP"
              }
            }
          }

          env {
            name = "METALLB_ML_BIND_ADDR"

            value_from {
              field_ref {
                field_path = "status.podIP"
              }
            }
          }

          env {
            name  = "METALLB_ML_LABELS"
            value = "app=metallb,component=speaker"
          }

          env {
            name = "METALLB_ML_NAMESPACE"

            value_from {
              field_ref {
                field_path = "metadata.namespace"
              }
            }
          }

          env {
            name = "METALLB_ML_SECRET_KEY"

            value_from {
              secret_key_ref {
                name = kubernetes_secret.memberlist.metadata.0.name
                key  = "secretkey"
              }
            }
          }

          resources {
            limits {
              cpu    = "100m"
              memory = "100Mi"
            }
          }

          image_pull_policy = "Always"

          security_context {
            read_only_root_filesystem = true
          }
        }

        termination_grace_period_seconds = 2

        node_selector = {
          "beta.kubernetes.io/os" = "linux"
        }

        service_account_name            = kubernetes_service_account.speaker.metadata.0.name
        automount_service_account_token = true
        host_network                    = true

        toleration {
          key    = "node-role.kubernetes.io/master"
          effect = "NoSchedule"
        }
      }
    }
  }
}

resource "kubernetes_deployment" "controller" {
  metadata {
    name      = "controller"
    namespace = kubernetes_namespace.metallb_system.metadata.0.name

    labels = {
      app = "metallb"

      component = "controller"
    }
  }

  spec {
    selector {
      match_labels = {
        app = "metallb"

        component = "controller"
      }
    }

    template {
      metadata {
        labels = {
          app = "metallb"

          component = "controller"
        }

        annotations = {
          "prometheus.io/port" = "7472"

          "prometheus.io/scrape" = "true"
        }
      }

      spec {
        container {
          name  = "controller"
          image = "metallb/controller:v0.9.3"
          args  = ["--port=7472", "--config=config"]

          port {
            name           = "monitoring"
            container_port = 7472
          }

          resources {
            limits {
              cpu    = "100m"
              memory = "100Mi"
            }
          }

          image_pull_policy = "Always"

          security_context {
            read_only_root_filesystem = true
          }
        }

        node_selector = {
          "beta.kubernetes.io/os" = "linux"
        }

        service_account_name            = kubernetes_service_account.controller.metadata.0.name
        automount_service_account_token = true

        security_context {
          run_as_user     = 65534
          run_as_non_root = true
        }
      }
    }

    revision_history_limit = 3
  }
}

resource "kubernetes_secret" "memberlist" {
  metadata {
    name      = "memberlist"
    namespace = kubernetes_namespace.metallb_system.metadata.0.name
  }

  data = {
    secretkey = "nIOzcIkOFkNg2eSx5GE/q3LP2JNWezfvcQu8TQqsUPLUztkBsQDYbtJoHMJRW49N\nn8TEG4Z24uSF+90Z+Yvgiq96g0F//QPfx134Hl3NBD1J3uAWzVrZ9QDTSVsTrFih\n7VB9FxtRZfUvowdDNWXhekqLwk+v8QSYdcFnEhD5tsI="
  }

  type = "Opaque"
}

#####
# default example
#####

module "default" {
  source = "../.."

  namespace_name = random_string.default.result
}
