## [2.1.1]
* fixed controller issue with scrollbar
* fixed problem with `flipRightIconIfOpen`
* fixed `headerBorderRadius` prop not reacting when set globally via `Accordion`
* added `shrinkWrap` and `AlwaysScrollableScrollPhysics` to the `Accordion` widget

## [2.1.0]
* `headerText`, `headerTextStyle`, `headerTextAlign` have been removed -- please use `header` instead
* the content area now has a 1px border by default
* the background color of the `header` and the `contentBorderColor` share the same default color (primaryColor)

## [2.0.1]
* included "Accordion within Accordion" in the example app (see notes in README)
* changed default borderRadius of header and content to 10
* updated documentation and example app

## [2.0.0]
* deprecated `headerText`, `headerTextStyle`, `headerTextAlign`
* new parameter `header` which replaces all of the above

## [1.0.4]
* changed line length to 80 for dartfmt

## [1.0.3]
* fixed non-final values in AccordionSection
* changed default `scrollIntoView` animation to `fast`
* updated docs

## [1.0.2]
* fixed Flutter SDK version

## [1.0.1]
* fixed dependencies
* added null safety
* fixed static analysis problems
* fixed problem with dartdoc

## [1.0.0]
* Initial release
