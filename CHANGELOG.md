## [2.6.0]

* fixed `flipRightIconIfOpen` not reacting when set for all sections in `Accordion`
* added `flipLeftIconIfOpen` -- thanks @janbennettet-datacom
* added `headerBorder` for each `AccordionSection` -- thanks @KeeganDC
* fixed some properties not working on `Accordion`
* added screenshot for pub.dev

## [2.5.1]

* added some documentation

## [2.5.0]

* merged PR from @gslender making scale animations optional. See `scaleWhenAnimating`
* updated code example in README

## [2.4.0]

* merged PR from @anatolinicolae
* updated to latest versions of GetX & scroll_to_index
* increased maximum number of sections to 10,000

## [2.3.0]

* merged PR from @jobic10 to make Key optional
* merged PR from @SirObi to allow multiple `Accordion` instances on one page
* added callbacks when opening/closing `AccordionSections`. Inspired by @singh-karan-7

## [2.2.3]

* added some missing documentation

## [2.2.2]

* fixed error when using multiple `Accordion` in a `PageView`

## [2.2.1]

* fixed missing documentation
* fixed deprecated SingleGetTickerProviderMixin to GetSingleTickerProviderStateMixin

## [2.2.0]

* code refactoring
* added `headerBackgroundColorOpened` as an option when a section is open. Default is `headerBackgroundColor`
* added `sectionOpeningHapticFeedback` and `sectionClosingHapticFeedback` to play a haptic feedback when opening/closing a section.
* added `openAndCloseAnimation` to `Accordion` to control if sections should animate when opened/closed.

## [2.1.2]

* added `disableScrolling` prop to `Accordion`. Useful when the `Accordion` is used within a ListView or something else that already scrolls.

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
