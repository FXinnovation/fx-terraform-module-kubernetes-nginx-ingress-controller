2.0.0
=====

* (BREAKING) chore: pins `pre-commit-hooks` to `v4.0.1`.
* (BREAKING) chore: pins `kubernetes` provider to `2.x+`.
* (BREAKING) chore: pins `random` provider to `3.x+`.
* feat: add `pre-commit-afcmf` (`v0.1.2`).
* chore: pins `pre-commit-terraform` to `v1.50.0`.
* refactor: default example
  * add providers.tf file
  * add versions.tf file
  * add README.md file
  * lint code
* fix: `LICENSE` file.

1.3.0
=====

  * feat (BREAKING): Update to version 2.x for kubernetes provider
  * chore: Update pre-commit config

1.2.1
=====

  * chore: Update pre-commit config
  * fix: warning on interpolated syntax

1.2.0
=====

  * chore: Update pre-commit config
  * feat: Add outputs for better dependency management

1.1.0
=====

  * feat: Allowing user to actually passing configuration as variables

1.0.0 / 2020-04-21
==================

  * tech: Change labels
  * breaking: Change outputs, add more outputs, outputs
  * feat: Change selector to match new pattern
  * feat: Add metrics port to be able to scrape metrics

0.3.0 / 2020-03-30
==================

  * tech: fix example replay
  * tech: Make tests pass by using MetalLb Shim
  * tech: Use KinD to run tests
  * feat: Add output for load_balancer_ingress

0.2.0 / 2020-02-05
==================

  * feat: Add load balancer ip and source ranges

0.1.1 / 2020-02-18
==================

  * fix: Add versions.tf file
  * tech: Define license correctly
  * fix: Remove useless files in example
  * fix: Examples were not working
  * fix: remove kubernetes provider definition

0.1.0 / 2019-12-02
==================

  * feature: initial import of files
  * Initial commit
