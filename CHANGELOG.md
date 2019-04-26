# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.1.1] - 2019-04-26

### Added

- `Graph::Edge` have a new attribue named `weight`
- `Graph::Vertex` and `Graph::Edge` have a new method named `to_h`

### Changed

- `Graph::Edge` attribute `ukey` rename to `key`
- `Graph::Vertex` attribute `uid` rename to `key`
- `Graph#add`, `Graph#delete` and `Graph#index_of` now identify vertex or edge by attribute `key`

## [0.1.0] - 2019-04-26

### Added

- class `Graph`
- class `Graph::Vertex`
- class `Graph::Edge`

[Unreleased]: https://github.com/jk195417/graph-rb/compare/v0.1.1...HEAD
[0.1.1]: https://github.com/jk195417/graph-rb/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/jk195417/graph-rb/releases/tag/v0.1.0
