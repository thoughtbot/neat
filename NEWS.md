1.2.0 (2013-02-18)

  * New: Auto-detect table layout when `span-columns()` is called inside `row(table)`
  * Fix: Make `shift()` reset context after each nested call

1.1.0 (2013-01-09)
 
  * New: `pad()` takes shorthand arguments
  * Refactor: Merge `omega()` and `nth-omega()`
  * Fix: Last child in table layouts keeps its right-padding

1.0.2 (2012-11-19)

  * Fix: Add explicit require to the bourbon gem [#38](https://github.com/thoughtbot/neat/issues/38) 

1.0.1 (2012-11-06)

  * Fix: Make `em()` always return a number
  * Fix: Relative path imports in Rails

1.0.0 (2012-10-29)

  * New: Add executable for non-Rails projects
  * New: Add visual grid
  * New: Add `media` and `new-breakpoint` mixins
  * New: Add `_neat-helpers.scss` as a public interface for Neat
  * Fix: Make `shift()` work properly in nested contexts
  * Refactor: Remove typography mixins and settings

0.4.2 (2012-08-31)

  * Initial release
