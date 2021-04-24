library accordion;

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

enum ScrollIntoViewOfItems { none, slow, fast }

final springFast = SpringDescription(mass: 1, stiffness: 200, damping: 30);

mixin VSCommonAccordionProps {
  late final Color? _headerBackgroundColor;
  late final double? _headerBorderRadius;
  late final TextAlign? _headerTextAlign;
  late final TextStyle? _headerTextStyle;
  late final EdgeInsets? _headerPadding;
  late final Widget? _leftIcon, _rightIcon;
  late final bool? _flipRightIconIfOpen;
  late final Color? _contentBackgroundColor;
  late final Color? _contentBorderColor;
  late final double? _contentBorderWidth;
  late final double? _contentBorderRadius;
  late final double? _contentHorizontalPadding;
  late final double? _contentVerticalPadding;
  late final double? _paddingBetweenOpenSections;
  late final double? _paddingBetweenClosedSections;
  late final ScrollIntoViewOfItems? _scrollIntoViewOfItems;
}

class Accordion extends StatelessWidget with VSCommonAccordionProps {
  final List<AccordionSection>? children;
  late final double _paddingListHorizontal;
  late final double _paddingListTop;
  late final double _paddingListBottom;

  Accordion({
    int? maxOpenSections,
    this.children,
    Color? headerBackgroundColor,
    double? headerBorderRadius,
    TextAlign? headerTextAlign,
    TextStyle? headerTextStyle,
    Widget? leftIcon,
    Widget? rightIcon,
    bool? flipRightIconIfOpen,
    Color? contentBackgroundColor,
    Color? contentBorderColor,
    double? contentBorderWidth,
    double? contentBorderRadius,
    double? contentHorizontalPadding,
    double? contentVerticalPadding,
    double? paddingListTop,
    double? paddingListBottom,
    double? paddingListHorizontal,
    EdgeInsets? headerPadding,
    double? paddingBetweenOpenSections,
    double? paddingBetweenClosedSections,
    ScrollIntoViewOfItems? scrollIntoViewOfItems,
  }) {
    this._headerBackgroundColor = headerBackgroundColor;
    this._headerBorderRadius = headerBorderRadius ?? 30;
    this._headerTextAlign = headerTextAlign ?? TextAlign.left;
    this._headerTextStyle = headerTextStyle;
    this._leftIcon = leftIcon;
    this._rightIcon = rightIcon;
    this._flipRightIconIfOpen = flipRightIconIfOpen;
    this._contentBackgroundColor = contentBackgroundColor;
    this._contentBorderColor = contentBorderColor;
    this._contentBorderWidth = contentBorderWidth;
    this._contentBorderRadius = contentBorderRadius ?? 20;
    this._contentHorizontalPadding = contentHorizontalPadding;
    this._contentVerticalPadding = contentVerticalPadding;
    this._paddingListTop = paddingListTop ?? 20.0;
    this._paddingListBottom = paddingListBottom ?? 40.0;
    this._paddingListHorizontal = paddingListHorizontal ?? 10.0;
    this._headerPadding = headerPadding ?? EdgeInsets.symmetric(horizontal: 20, vertical: 10);
    this._paddingBetweenOpenSections = paddingBetweenOpenSections ?? 10;
    this._paddingBetweenClosedSections = paddingBetweenClosedSections ?? 3;
    this._scrollIntoViewOfItems = scrollIntoViewOfItems;

    int count = 0;
    listCtrl.maxOpenSections = maxOpenSections ?? 1;
    children!.forEach((child) {
      if (child.isOpen == true) {
        count++;

        if (count > listCtrl.maxOpenSections) child.isOpen = false;
      }
    });
  }

  build(context) {
    int index = 0;

    return Scrollbar(
      child: ListView(
        controller: listCtrl.controller,
        padding: EdgeInsets.only(
          top: _paddingListTop,
          bottom: _paddingListBottom,
          right: _paddingListHorizontal,
          left: _paddingListHorizontal,
        ),
        cacheExtent: 100000,
        children: children!.map(
          (child) {
            final key = UniqueKey();

            if (child.isOpen) listCtrl.openSections.add(key);

            return AutoScrollTag(
              key: ValueKey(key),
              controller: listCtrl.controller,
              index: index,
              child: AccordionSection(
                key: key,
                index: index++,
                isOpen: child.isOpen,
                scrollIntoViewOfItems: _scrollIntoViewOfItems,
                headerBackgroundColor: child._headerBackgroundColor ?? _headerBackgroundColor,
                headerBorderRadius: child._headerBorderRadius ?? _headerBorderRadius,
                headerText: child.headerText,
                headerTextStyle: child._headerTextStyle ?? _headerTextStyle,
                headerTextAlign: child._headerTextAlign ?? _headerTextAlign,
                headerPadding: child._headerPadding ?? _headerPadding,
                leftIcon: child._leftIcon ?? _leftIcon,
                rightIcon: child._rightIcon ??
                    _rightIcon ??
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white60,
                      size: 20,
                    ),
                flipRightIconIfOpen: child._flipRightIconIfOpen ?? _flipRightIconIfOpen,
                paddingBetweenClosedSections: child._paddingBetweenClosedSections ?? _paddingBetweenClosedSections,
                paddingBetweenOpenSections: child._paddingBetweenOpenSections ?? _paddingBetweenOpenSections,
                content: child.content,
                contentBackgroundColor: child._contentBackgroundColor ?? _contentBackgroundColor,
                contentBorderColor: child._contentBorderColor ?? _contentBorderColor,
                contentBorderWidth: child._contentBorderWidth ?? _contentBorderWidth,
                contentBorderRadius: child._contentBorderRadius ?? _contentBorderRadius,
                contentHorizontalPadding: child._contentHorizontalPadding ?? _contentHorizontalPadding,
                contentVerticalPadding: child._contentVerticalPadding ?? _contentVerticalPadding,
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

class AccordionSection extends StatelessWidget with VSCommonAccordionProps {
  UniqueKey? key = UniqueKey();
  int index;
  bool isOpen;
  String headerText;
  Widget content;
  late SectionController _sectionCtrl;
  bool _firstRun = true;

  AccordionSection({
    this.key,
    this.index = 0,
    this.isOpen = false,
    required this.headerText,
    required this.content,
    Color? headerBackgroundColor,
    double? headerBorderRadius,
    TextAlign? headerTextAlign,
    TextStyle? headerTextStyle,
    EdgeInsets? headerPadding,
    Widget? leftIcon,
    Widget? rightIcon,
    bool? flipRightIconIfOpen = true,
    Color? contentBackgroundColor,
    Color? contentBorderColor,
    double? contentBorderWidth,
    double? contentBorderRadius,
    double? contentHorizontalPadding,
    double? contentVerticalPadding,
    double? paddingBetweenOpenSections,
    double? paddingBetweenClosedSections,
    ScrollIntoViewOfItems? scrollIntoViewOfItems,
  }) {
    _sectionCtrl = SectionController();

    this._headerBackgroundColor = headerBackgroundColor;
    this._headerBorderRadius = headerBorderRadius;
    this._headerTextAlign = headerTextAlign;
    this._headerTextStyle = headerTextStyle;
    this._headerPadding = headerPadding;
    this._leftIcon = leftIcon;
    this._rightIcon = rightIcon;
    this._flipRightIconIfOpen = flipRightIconIfOpen ?? true;
    this._contentBackgroundColor = contentBackgroundColor;
    this._contentBorderColor = contentBorderColor;
    this._contentBorderWidth = contentBorderWidth;
    this._contentBorderRadius = contentBorderRadius;
    this._contentHorizontalPadding = contentHorizontalPadding ?? 10;
    this._contentVerticalPadding = contentVerticalPadding ?? 10;
    this._paddingBetweenOpenSections = paddingBetweenOpenSections;
    this._paddingBetweenClosedSections = paddingBetweenClosedSections;
    this._scrollIntoViewOfItems = scrollIntoViewOfItems;
  }

  get _flipQuarterTurns => _flipRightIconIfOpen == true ? (_isOpen ? 2 : 0) : 0;

  get _isOpen {
    final open = listCtrl.openSections.contains(key);
    Timer(
      _firstRun ? (min(index * 200, 1000)).milliseconds : 0.seconds,
      () {
        _sectionCtrl.controller.fling(velocity: open ? 1 : -1, springDescription: springFast);
        _firstRun = false;
      },
    );
    return open;
  }

  build(context) {
    return Obx(
      () => Column(
        key: key,
        children: [
          InkWell(
            onTap: () {
              listCtrl.updateSections(key!);

              if (_isOpen && _scrollIntoViewOfItems != ScrollIntoViewOfItems.none)
                Timer(
                  0.5.seconds,
                  () {
                    listCtrl.controller.scrollToIndex(index,
                        preferPosition: AutoScrollPosition.middle,
                        duration: (_scrollIntoViewOfItems == ScrollIntoViewOfItems.fast ? .5 : 1).seconds);
                  },
                );
            },
            child: AnimatedContainer(
              duration: 0.75.seconds,
              curve: Curves.easeOut,
              alignment: Alignment.center,
              padding: _headerPadding,
              decoration: BoxDecoration(
                color: _headerBackgroundColor ?? Theme.of(context).primaryColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(_headerBorderRadius!),
                  bottom: Radius.circular(_isOpen ? 0 : _headerBorderRadius!),
                ),
              ),
              child: Row(
                children: [
                  if (_leftIcon != null) _leftIcon!,
                  Expanded(
                    flex: 10,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        headerText,
                        textAlign: _headerTextAlign,
                        style: _headerTextStyle ?? TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  if (_rightIcon != null) RotatedBox(quarterTurns: _flipQuarterTurns, child: _rightIcon!),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: _isOpen ? _paddingBetweenOpenSections! : _paddingBetweenClosedSections!),
            child: SizeTransition(
              sizeFactor: _sectionCtrl.controller,
              child: ScaleTransition(
                scale: _sectionCtrl.controller,
                child: Center(
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: _contentBorderColor ?? Colors.white,
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(_contentBorderRadius!)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        _contentBorderWidth ?? 0,
                        0,
                        _contentBorderWidth ?? 0,
                        _contentBorderWidth ?? 0,
                      ),
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(bottom: Radius.circular(_contentBorderRadius! / 1.02))),
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              color: _contentBackgroundColor,
                              borderRadius: BorderRadius.vertical(bottom: Radius.circular(_contentBorderRadius! / 1.02))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: _contentHorizontalPadding!,
                              vertical: _contentVerticalPadding!,
                            ),
                            child: Center(
                              child: content,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ListController extends GetxController {
  final controller = AutoScrollController(axis: Axis.vertical);
  final openSections = <UniqueKey>[].obs;
  int maxOpenSections = 1;

  void updateSections(UniqueKey key) {
    openSections.contains(key) ? openSections.remove(key) : openSections.add(key);

    if (openSections.length > maxOpenSections) openSections.removeRange(0, openSections.length - maxOpenSections);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}

final listCtrl = ListController();

class SectionController extends GetxController with SingleGetTickerProviderMixin {
  late final controller = AnimationController(vsync: this);

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
