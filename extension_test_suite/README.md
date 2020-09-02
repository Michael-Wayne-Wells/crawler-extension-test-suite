# Tilig Extension Test Suite

## Goals and Overview

This test suite was built with the intenstion of testing the functionality of the Tilig extension across 3rd party websites. Because we cannot control or forsee changes across the many sites users will interact with daily, an automated test suite is necessary to track the success/failure rate to inform decisions in the futrue about changes.

## To run:

- In .env file of the extension, VUE_APP_APIROOT="http://tilig-api:3000"
- Create production build of extension on chrome://extensions
  - click package extension and save crx file in extension_test_suite
- in root of subs, run ./extension_test.sh
- Let run! This script will:
  - build docker files
  - login to tilig
  - Seed db
  - run testsuite
  - save images and html of failed tests
    \*shut itself down and clean up

## To-Do

- Write Tests!

  - Registration Modal
  - save account Modal
  - Autofill

- ~~programatically build crx file~~
- Integrate into Gitlab CI
- Build out more comprehensive login url list(connect with json sites list?)
- Build out sign-ups list
- speed up?
