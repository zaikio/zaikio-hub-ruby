# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

- Add `Zaikio::Hub::AccessToken`

## [0.18.0]

- Add `reference` attribute to `Availability`

## [0.17.0]

- Add `reference` attribute to `Machine` and `Specialist`

## [0.16.0]

- Support `availabilities` for `Machine` and `Specialist`

## [0.15.3]

- Improve german and english translations

## [0.15.2]

- Add class method `kinds` to `Machine` and `Specialist`

## [0.15.1]

* Add translations for `kind` attribute for `Machine` and `Specialist`

## [0.15.0] - 2023-04-12

* Add `capabilities` attribute to `Machine` and `Specialist`
* Add `Zaikio::Hub::Asset.capabilities` method for a list of all capabilities

## [0.14.0] - 2023-04-03

* **BREAKING** Remove `Software` asset type
* **BREAKING** Remove `Asset#specification`

## [0.13.0] - 2023-03-24

* Add `Zaikio::Hub::SubscriptionInvitation`

## [0.12.0] - 2023-02-09

* Update client-helpers and introduce default timeouts

## [0.11.2] - 2022-10-13

* Fixed `subscription_url` attribute typo in `Subscription`

## [0.11.1] - 2022-10-13

* Added `subscription_url` attribute in `Subscription`

## [0.11.0] - 2022-08-30

* Extract token data logic into its own `Zaikio::Hub::TokenData` class
  This also exposes the `sub` attribute of the token as `TokenData#subject`.
* Support newer versions of `jwt` and `spyke`

## [0.10.0] - 2022-08-15

* Update `zaikio-client-helpers` and reuse logic to use `Zaikio::Client.with_token`

## [0.9.1] - 2022-01-05

* Fix warning about redefined methods in BasicAuthMiddleware
* Permit newer versions of Spyke & JWT gems

## [0.9.0] - 2021-08-31

* Added `.connections` and `.apps` for `CurrentOrganization`s that are vendors

## [0.8.0] - 2021-08-25

* Added `CurrentOrganization#create_subscription`

## [0.7.0] - 2021-06-18

* **BREAKING** `Relation#all` now fetches all following paginated resources by default
  (endpoints which don't support pagination are unaffected).
* **BREAKING** Removed `Relation#each_page` method. You should just use the `all` method now
  instead:

```diff
-Model.all.each_page.flat_map(&:to_a)
+Model.all.to_a
```

## [0.6.2] - 2021-04-27

* Include `id` property in `CurrentPerson#attributes` and `CurrentOrganization#attributes`

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

[Unreleased]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.17.0..HEAD
[0.17.0]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.16.0..v0.17.0
[0.16.0]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.15.3..v0.16.0
[0.15.3]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.15.2..v0.15.3
[0.15.2]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.15.1..v0.15.2
[0.15.1]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.15.0..v0.15.1
[0.15.0]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.14.0..v0.15.0
[0.14.0]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.13.0..v0.14.0
[0.13.0]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.12.0..v0.13.0
[0.12.0]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.11.2..v0.12.0
[0.11.2]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.11.1..v0.11.2
[0.11.1]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.11.0..v0.11.1
[0.11.0]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.10.0..v0.11.0
[0.10.0]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.9.0..v0.10.0
[0.9.0]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.8.0..v0.9.0
[0.8.0]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.7.0..v0.8.0
[0.7.0]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.6.2..v0.7.0
[0.6.2]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.6.1..v0.6.2
[0.6.1]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.6.0..v0.6.1
[0.6.0]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.5.0..v0.6.0
[0.5.0]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.4.1..v0.5.0
[0.4.1]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.4.0...v0.4.1
[0.4.0]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.2.0...v.0.3.0
[0.2.0]: https://github.com/zaikio/zaikio-hub-ruby/compare/v0.1.1...v.0.2.0
[0.1.1]: https://github.com/zaikio/zaikio-hub-ruby/compare/5c6cb4dbcac316733560ddb2b1e13b53e55eb66e...v0.1.1
[0.1.0]: https://github.com/zaikio/zaikio-hub-ruby/compare/d149fb4c0abe6005f123def3952d2dd2ef6404bb...29889d8a6a496542a81e05688da2a46cf4c44188
