# Test

[![Build Status](https://travis-ci.org/vegatest-preprod/vegatest-preprod.github.com.png)](https://travis-ci.org/vegatest-preprod/vegatest-preprod.github.com)

## Running the tests

### Setting up testing environment

Install gems:

  - gem install rake
  - gem install jekyll
  - gem install cucumber
  - gem install rspec
  - gem install capybara
  - gem install poltergeist

Install [PhantomJS] (http://phantomjs.org/)

### Running the tests

Run tests:

    rake test

Run unit tests only:

    rake test:unit

Run acceptance tests only:

    rake test:acceptance

Run acceptance tests against remote deployment:

    rake remote test:acceptance