# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.4] - 2026-01-28

### Changed
- Refactored internal widget construction to use private getter for better code organization
- Improved code readability by extracting Flex widget creation into `_child` getter

### Internal
- Split `build` method logic for cleaner separation of scroll view and flex layout
- Minor code quality improvements with no API changes
- No breaking changes - fully backward compatible

## [0.0.3] - 2026-01-21

### Added
- `ExpandableColumn` widget - a scrollable column that supports `Expanded` and `Spacer` widgets
- Support for all standard Column properties (alignment, direction, text baseline)
- Configurable scroll physics with sensible defaults
- Optional padding support using `SliverPadding`
- Comprehensive test coverage including edge cases
- Detailed documentation and usage examples

### Features
- Full support for `mainAxisAlignment`, `crossAxisAlignment`, and `mainAxisSize`
- Support for `textDirection`, `verticalDirection`, and `textBaseline`
- Custom scroll physics configuration (`physics` parameter)
- Primary scroll view support (`primary` parameter)
- Reverse scrolling capability (`reverse` parameter)
- Clip behavior customization (`clipBehavior` parameter)

### Documentation
- Added comprehensive README with usage examples
- Added API reference documentation
- Added comparison with alternative solutions
- Added migration guides from common patterns
- Added troubleshooting section
- Added performance tips and best practices

## [0.0.2]

- feat: Add `ExpandableColumn` widget - a scrollable column that supports `Expanded` and `Spacer`
  widgets
- feat: Support for all standard Column properties (alignment, direction, text baseline)
- feat: Configurable scroll physics with sensible defaults
- feat: Optional padding support using `SliverPadding`
- feat: Comprehensive test coverage including edge cases
- docs: Add detailed documentation and usage examples

## [0.0.1]

- feat: initial commit
