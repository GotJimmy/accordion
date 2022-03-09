import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

/// ScrollIntoViewOfItems is used to adjust the position of newly
/// opened sections in the center of the screen
enum ScrollIntoViewOfItems { none, slow, fast }

/// SectionHapticFeedback controls which (if any) haptic feedback
/// should be played when clicking the header of a section.
/// Can be applied to both `Accordion` for all sections or
/// to `AccordionSection` for individula sections.
enum SectionHapticFeedback {
  none,
  light,
  medium,
  heavy,
  selection,
  vibrate,
}

const springFast = SpringDescription(mass: 1, stiffness: 200, damping: 30);

/// `CommonParams` is used for both `Accordion` (for all sections)
/// and `AccordionSections` for individual sections.
mixin CommonParams {
  late final Color? headerBackgroundColor;
  late final Color? headerBackgroundColorOpened;
  late final double? headerBorderRadius;
  late final EdgeInsets? headerPadding;
  late final Widget? leftIcon, rightIcon;
  late final RxBool? flipRightIconIfOpen = true.obs;
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
}

/// Controller for `Accordion` widget
class ListController extends GetxController {
  final controller = AutoScrollController(axis: Axis.vertical);
  final openSections = <Key>[].obs;

  /// Maximum number of open sections at any given time.
  /// Opening a new section will close the "oldest" open section
  int maxOpenSections = 1;

  /// The delay in milliseconds (when the entire accordion loads)
  /// before the individual sections open one after another.
  /// Helpful if you go to a new page in your app and then (after
  /// the delay) have a nice opening sequence.
  int initialOpeningSequenceDelay = 250;

  void updateSections(Key key) {
    openSections.contains(key)
        ? openSections.remove(key)
        : openSections.add(key);

    if (openSections.length > maxOpenSections) {
      openSections.removeRange(0, openSections.length - maxOpenSections);

      print(openSections.value.join(', '));
    }
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}

final listCtrl = ListController();

/// Controller for `AccordionSection` widgets
class SectionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final controller = AnimationController(vsync: this);
  final isSectionOpen = false.obs;
  bool firstRun = true;

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
