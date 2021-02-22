# Chrome Extension Test Suite and Crawler

## Goals and Overview

This test suite was built with the intenstion of testing the functionality of
an extension across 3rd party websites. Because we cannot control or
forsee changes across the many sites users will interact with daily, an
automated test suite is necessary to track the success/failure rate to inform
decisions in the futrue about changes.

## To run:

- in root of subs, run `./extension_test.sh` for full build and test suite
  - `./extension_test.sh build` for build only
  - `./extension_test.sh login` for user flow test on login pages
  - `./extension_test.sh autofill` for autofill test
- Let run! This script will:
  - build docker files
  - login
  - Seed db
  - run testsuite
  - save images and html of failed tests \*shut itself down and clean up
