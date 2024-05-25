import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:xolodilnik_picker/assets/constants/enums.dart';
import 'package:xolodilnik_picker/common/presentation/widgets/pop_up_container.dart';
import 'package:xolodilnik_picker/common/presentation/widgets/pop_up_container_with_title.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  EdgeInsets get padding => MediaQuery.paddingOf(this);

  Size get sizeOf => MediaQuery.sizeOf(this);

  // CustomColors get themeExtension => theme.extension<CustomColors>()!;
  Brightness get brightness => theme.brightness;

  AppBarTheme get appBarTheme => theme.appBarTheme;

  Future<void> showPopUp(
    BuildContext context,
    PopUpStatus status, {
    required String message,
    Widget? child,
    double? height,
  }) async {
    AnimationController? localAnimationController;
    showTopSnackBar(
      Overlay.of(this),
      child ??
          PopUpContainer(
            status: status,
            message: message,
            onCancel: () {
              if (localAnimationController != null) localAnimationController!.reverse();
            },
          ),
      displayDuration: const Duration(seconds: 3),
      dismissType: status.isWarning ? DismissType.onSwipe : DismissType.none,
      curve: Curves.decelerate,
      reverseCurve: Curves.linear,
      onAnimationControllerInit: (p0) => localAnimationController = p0,
      animationDuration: const Duration(milliseconds: 400),
      reverseAnimationDuration: const Duration(milliseconds: 300),
    );
  }

  Future<void> showPopUpWithTitle(
    BuildContext context,
    PopUpStatus status, {
    required String title,
    required String subtitle,
    Widget? child,
    double? height,
  }) async {
    AnimationController? localAnimationController;
    showTopSnackBar(
      Overlay.of(this),
      child ??
          PopUpContainerWithTitle(
            status: status,
            title: title,
            subtitle: subtitle,
            onCancel: () {
              if (localAnimationController != null) localAnimationController!.reverse();
            },
          ),
      displayDuration: const Duration(seconds: 3),
      dismissType: status.isWarning ? DismissType.onSwipe : DismissType.none,
      curve: Curves.decelerate,
      reverseCurve: Curves.linear,
      onAnimationControllerInit: (p0) => localAnimationController = p0,
      animationDuration: const Duration(milliseconds: 400),
      reverseAnimationDuration: const Duration(milliseconds: 300),
    );
  }
}
