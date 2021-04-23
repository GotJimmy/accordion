# accordion

Accordion widget to display a list of expandable items with opening/closing and scroll-into-view animations.

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.


## Common Properties
The following properties can be set globally for all sections or for each section individually:

| Property                     | Description                                                                         | Type                  | Required | Default value                  |
| ---------------------------- | ----------------------------------------------------------------------------------- | --------------------- | -------- | ------------------------------ |
| headerBackgroundColor        | background color of the section header                                              | Color                 | no       | Theme.of(context).primaryColor |
| headerBorderRadius           | border radius of the section header                                                 | double                | no       | 30                             |
| headerTextAlign              | alignment of the title in the section header                                        | TextAlign             | no       | TextAlign.left                 |
| headerTextStyle              | text style of the title in the section header                                       | TextStyle             | no       |                                |
| headerPadding                | padding of the title in the section header                                          | EdgeInsets            | no       |                                |
| leftIcon                     | widget to the left of the title in the section header                               | Widget                | no       |                                |
| rightIcon                    | widget to the right of the title in the section header                              | Widget                | no       |                                |
| flipRightIconIfOpen          | if the right icon in the header should be flipped when section is open              | bool                  | no       |                                |
| contentBackgroundColor       | background color of the content part of the section                                 | Color                 | no       |                                |
| contentBorderColor           | border color of the content part of the section                                     | Color                 | no       |                                |
| contentBorderWidth           | border width of the content part of the section                                     | double                | no       |                                |
| contentBorderStyle           | border style of the content part of the section                                     | BorderStyle           | no       |                                |
| contentBorderRadius          | border radius of the content part of the section                                    | double                | no       |                                |
| contentHorizontalPadding     | horizontal padding within the content part of the section                           | double                | no       |                                |
| contentVerticalPadding       | vertical padding within the content part of the section                             | double                | no       |                                |
| paddingBetweenClosedSections | padding below closed sections                                                       | double                | no       |                                |
| paddingBetweenOpenSections   | padding below an open section to visually make it stand out more                    | double                | no       |                                |
| scrollIntoViewOfItems        | if a section should automatically be scrolled to the center of the list when opened | ScrollIntoViewOfItems | no       |                                |