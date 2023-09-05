import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

/// ScrollIntoViewOfItems is used to adjust the position of newly
/// opened sections in the center of the screen
enum ScrollIntoViewOfItems {
  none,
  slow,
  fast,
}

/// SectionHapticFeedback controls which (if any) haptic feedback
/// should be played when clicking the header of a section.
/// Can be applied to both `Accordion` for all sections or
/// to `AccordionSection` for individual sections.
enum SectionHapticFeedback {
  none,
  light,
  medium,
  heavy,
  selection,
  vibrate,
}

/// spring to set the speed of opening/closing animations of a section
const springFast = SpringDescription(mass: 1, stiffness: 200, damping: 30);

/// `CommonParams` is used for both `Accordion` (for all sections)
/// and `AccordionSections` for individual sections.
mixin CommonParams {
  /// background color of header when section is closed
  late final Color? headerBackgroundColor;

  /// background color of header when section is open
  late final Color? headerBackgroundColorOpened;

  /// border color of header when section is closed
  late final Color? headerBorderColor;

  /// border color of header when section is open
  late final Color? headerBorderColorOpened;

  /// width of header border. Set to 0 if no header border is desired.
  late final double? headerBorderWidth;

  late final double? headerBorderRadius;
  late final EdgeInsets? headerPadding;
  late final Widget? leftIcon, rightIcon;
  late final Color? contentBackgroundColor;
  late final Color? contentBorderColor;
  late final double? contentBorderWidth;
  late final double? contentBorderRadius;
  late final double? contentHorizontalPadding;
  late final double? contentVerticalPadding;
  late final double? paddingBetweenOpenSections;
  late final double? paddingBetweenClosedSections;
  late final ScrollIntoViewOfItems? scrollIntoViewOfItems;
  late final SectionHapticFeedback? sectionOpeningHapticFeedback;
  late final SectionHapticFeedback? sectionClosingHapticFeedback;
  late final String? accordionId;
}

/// Controller for `Accordion` widget
class ListController extends GetxController {
  final controller = AutoScrollController(axis: Axis.vertical);
  final openSections = <UniqueKey>[];
  final keys = List<UniqueKey>.generate(10000, (index) => UniqueKey());
  StreamController<String> controllerIsOpen =
      StreamController<String>.broadcast();

  /// Maximum number of open sections at any given time.
  /// Opening a new section will close the "oldest" open section
  int maxOpenSections = 1;

  /// The delay in milliseconds (when the entire accordion loads)
  /// before the individual sections open one after another.
  /// Helpful if you go to a new page in your app and then (after
  /// the delay) have a nice opening sequence.
  int initialOpeningSequenceDelay = 250;

  /// adds or removes a section key from the list of open sections
  /// and notifies sections to open or close accordingly
  void updateSections(UniqueKey key) {
    openSections.contains(key)
        ? openSections.remove(key)
        : openSections.add(key);

    while (openSections.length > maxOpenSections) {
      openSections.removeAt(0);
    }

    controllerIsOpen.sink.add('update list');
  }

  @override
  void onClose() {
    controllerIsOpen.close();
    controller.dispose();
    super.onClose();
  }
}

/// Controller for `AccordionSection` widgets
class SectionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final controller = AnimationController(vsync: this);
  final isSectionOpen = false.obs;
  bool firstRun = true;
  static bool flipLeftIconIfOpen = false;
  static bool flipRightIconIfOpen = true;

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
