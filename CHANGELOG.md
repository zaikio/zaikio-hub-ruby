# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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

[Unreleased]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.2.0...HEAD
[0.2.0]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.1.1...v.0.2.0
[0.1.1]: https://github.com/zaikio/zaikio-hub-ruby/compare/5c6cb4dbcac316733560ddb2b1e13b53e55eb66e...v0.1.1
[0.1.0]: https://github.com/zaikio/zaikio-hub-ruby/compare/d149fb4c0abe6005f123def3952d2dd2ef6404bb...29889d8a6a496542a81e05688da2a46cf4c44188
