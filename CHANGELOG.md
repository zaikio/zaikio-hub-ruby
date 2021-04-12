# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.6.1] - 2020-04-12

* Fixed that `each_page` works correctly with client instance

## [0.6.0] - 2020-04-12

* Added pagination features for `Subscription` and `Connection`

## [0.5.0] - 2020-04-08

* Added `granted_oauth_scopes`, `requested_oauth_scopes`, and `requested_oauth_scopes_waiting_for_approval` to Person and Organization
* Added `requested_oauth_scopes`, and `requested_oauth_scopes_waiting_for_approval` to Connection

## [0.4.1] - 2020-03-04

* Add `state` property for `Zaikio::Hub::Address` model

## [0.4.0] - 2020-02-23

### Changed

* Only log Faraday req/response status lines, not headers
* Added nested attributes for `address_attributes` in `Site`

## [0.3.0] - 2020-02-12

### Changed

- BREAKING: Rename `Zaikio::Directory` to `Zaikio::Hub`

### Added

- `Zaikio::Hub::Client` as a wrapper that does not need block syntax for authorization

## [0.2.0] - 2020-01-21

### Added

- `Zaikio::Hub::TestAccount`

## [0.1.1] - 2020-09-02

### Fixed
- Thread-Safety on current access token

## [0.1.0] - 2020-08-24

### Added
- Added subscriptions (migration required)

[Unreleased]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.6.1..HEAD
[0.6.1]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.6.0..v0.6.1
[0.6.0]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.5.0..v0.6.0
[0.5.0]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.4.1..v0.5.0
[0.4.1]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.4.0...v0.4.1
[0.4.0]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.2.0...v.0.3.0
[0.2.0]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.1.1...v.0.2.0
[0.1.1]: https://github.com/zaikio/zaikio-hub-ruby/compare/5c6cb4dbcac316733560ddb2b1e13b53e55eb66e...v0.1.1
[0.1.0]: https://github.com/zaikio/zaikio-hub-ruby/compare/d149fb4c0abe6005f123def3952d2dd2ef6404bb...29889d8a6a496542a81e05688da2a46cf4c44188
