# Change Log

All notable changes to this project will be documented in this file. This
project adheres to [Semantic Versioning](http://semver.org).

## [Unreleased (`master`)][unreleased]

Nothing at the moment.

## [2.1.0] - 2017-06-27

### Added

- A `--path` CLI option, which lets you install Neat into specific
  directory. ([#459])
- A `style` property has been added to our `package.json`, which makes for easy
  importing when using npm-sass, sass-module-importer and others. ([#514])

### Fixed

- Fixed an issue that would cause Neat to not be found within Rails
  apps. ([#612])
- Simplified the gradient used in the `grid-visual` mixin for more consistent
  cross-browser behaviour. ([#569])

[#459]: https://github.com/thoughtbot/neat/pull/459
[#514]: https://github.com/thoughtbot/neat/pull/514
[#569]: https://github.com/thoughtbot/neat/pull/569
[#612]: https://github.com/thoughtbot/neat/pull/612

## [2.0.0]

### Fixed

- Custom grids inherit undefined properties from global `$neat-grid`
- Fixed instillation from CLI
- Remove float property from `grid-collapse`

## [2.0.0.beta.2]

### Added

- Added `grid-visual` to show visual grid guides
- Added ltr/rtl support

### Removed

- Removed `node-sass` dependency from `package.json`

## [2.0.0.beta.1]

### Added

- Added `grid-collapse` to allow the creation of nested layouts

## [2.0.0.alpha.1]

### Added

- Added `grid-shift` functionality
- Added `grid-media` to allow the creation of media queries with custom grids

## [2.0.0.alpha.0]

### Added

- Added `$neat-grid` map to store user defined default grid properties
- Added core grid functionality in `grid-column`
- Added improved documentation and releasing information
- Added `grid-container` for floated grid which contains a simple clearfix
- Added `grid-push` functionality

### Changed

- Use `core/` as the primary Neat source directory

### Removed

- Removed all previous Neat Sass
  - Mixins
    - `direction-context` has been removed
    - `display-context` has been removed
    - `fill-parent` has been removed
    - `media` has been removed
    - `omega` has been removed
    - `outer-container` has been removed
    - `pad` has been removed
    - `row` has been removed
    - `shift` has been removed
    - `shift-in-context` has been removed
    - `span-columns` has been removed
    - `reset-display` has been removed
    - `reset-layout-direction` has been removed
    - `reset-all` has been removed
  - Functions
    - `new-breakpoint` has been removed
  - Variables
    - `$disable-warnings` has been removed
    - `$column` has been removed
    - `$gutter` has been removed
    - `$grid-columns` has been removed
    - `$max-width` has been removed
    - `$border-box-sizing` has been removed
    - `$default-feature` has been removed
    - `$default-layout-direction` has been removed
    - `$visual-grid` has been removed
    - `$visual-grid-color` has been removed
    - `$visual-grid-index` has been removed
    - `$visual-grid-opacity` has been removed

## 1.8.0 - 2016-06-21

### Added

- Added `--version` and `-v` options to the CLI now has that show the version of
  Neat you have installed

### Removed

- Neat no longer requires Bourbon

## 1.7.4 - 2016-03-04

### Added

- Added an explicit sass requirement

## 1.7.3 - 2016-02-29

### Added

- Added eyeglass support

### Changed

- Neat's npm package now includes the proper Sass paths
- The default `$max-width` is now `1200px`

## 1.7.2 - 2015-03-13

### Added

- Added Bourbon's updated `modular-scale` function for grid settings

### Removed

- Removed prefixes for `box-sizing`

## 1.7.1 - 2015-01-02

### Added

- Added custom `not` function for Libsass 3.0 compatibility

### Changed

- Fixed bug related to the `omega`'s query argument

## 1.7.0 - 2014-10-17

### Added

- Full compatibility with Sass 3.4+ and Libsass 3.0+

### Changed

- `direction-context` mixin changes the direction inside an entire block.
- `display-context` mixin changes the display property inside an entire block.
- `outer-container` now takes a max-width argument

### Removed

- Removed `reset-direction`
- Removed `reset-display`

## 1.5.1 - 2014-04-06

### Added

- Restore compatibility with Sass 3.2.x

## 1.6.0 - 2014-03-28

### Added
- Added multiple media queries support to the `media` mixin, including queries
  such as orientation

### Changed
- Updated to Sass 3.3 and silence `!global` variable warnings
- Use absolute percentage widths for table displays

### Removed

- Passing table no longer adds padding to elements
- Omega no longer supports table display

## 1.6.0.pre2 - 2014-03-21

### Changed

- Use Sass 3.3 and silence global variable warnings

## 1.6.0.pre - 2014-02-10

### Added

- Added multiple media queries support to the `media` mixin, including queries
  such as orientation

### Changed

- Use absolute percentage widths for table displays

### Removed

- Passing table no longer adds padding to elements
- Omega no longer supports table display

## 1.5.0 - 2013-22-15

### Added

- Added the ability for `span-columns` to omit display property from the output
- Improved browser support

### Changed

- Renamed `span-columns` collapse argument to block-collapse
- Made `shift` take parent column argument (useful when other `span-columns`
  calls override the nesting context)

## 1.4.0 - 2013-08-28

### Added

- Added collapse argument to `span-columns` in order to remove gutter

### Changed

- Fixed visual grid overrides by reordering breakpoints
- Unified padding across table cells
- Specified comma as separator for gradient-stops append for libsass

### Removed

## 1.3.0 - 2013-05-03

### Added

- Added global RTL layout support
- Added row-specific RTL layout support
- Added auto-clearing for elements using `omega(nth-child)` (works only with
  simple `nth-child` arguments due to limited string operations in Sass)

### Changed

- `reset-display`, `reset-layout-direction`, and `reset-all` for all your reset needs!

### Removed

- The visual grid no longer blocks user interactions
- `omega` will no longer take `$direction` in favor of `row($direction)` or
  `$default-layout-direction`


## 1.2.1 - 2013-04-04

### Added

- Added stylesheets path to `Sass.load_paths`
- Official Docset

### Changed

- Force full-width and fixed table-layout on `row(table)`

## 1.2.0 - 2013-02-18

### Added

- Auto-detect table layout when `span-columns` is called inside `row(table)`

### Changed

- Make `shift` reset context after each nested call

## 1.1.0 - 2013-01-09

### Added

- `pad` takes shorthand arguments

### Changed

- Merge `omega` and `nth-omega`
- Last child in table layouts keeps its right-padding

## 1.0.2 - 2012-11-19

### Added

- Add explicit require to the bourbon gem
  [#38](https://github.com/thoughtbot/neat/issues/38)

## 1.0.1 - 2012-11-06

### Added

- Relative path imports in Rails

### Changed

- Make `em` always return a number

## 1.0.0 - 2012-10-29

### Added

- Added executable for non-Rails projects
- Added visual grid
- Added `media` and `new-breakpoint` mixins
- Added `_neat-helpers.scss` as a public interface for Neat

### Changed

- Made `shift` work properly in nested contexts

### Removed

- Removed typography mixins and settings

## 0.4.2 - 2012-08-31

- Initial release

[unreleased]: https://github.com/thoughtbot/neat/compare/v2.1.0...HEAD
[2.1.0]: https://github.com/thoughtbot/neat/compare/v2.0.0...v2.1.0
[2.0.0]: https://github.com/thoughtbot/neat/compare/v2.0.0.beta.2...v2.0.0
[2.0.0.beta.2]: https://github.com/thoughtbot/neat/compare/v2.0.0.beta.1...v2.0.0.beta.2
[2.0.0.beta.1]: https://github.com/thoughtbot/neat/compare/v2.0.0.alpha.1...v2.0.0.beta.1
[2.0.0.alpha.1]: https://github.com/thoughtbot/neat/compare/v2.0.0.alpha.0...v2.0.0.alpha.1
[2.0.0.alpha.0]: https://github.com/thoughtbot/neat/compare/v1.8.0...v2.0.0.alpha.0
