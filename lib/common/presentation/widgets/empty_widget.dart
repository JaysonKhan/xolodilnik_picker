import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:xolodilnik_picker/assets/colors/colors.dart';
import 'package:xolodilnik_picker/assets/constants/app_images.dart';

class EmptyWidget extends StatelessWidget {
  final Widget? iconWidget;
  final String? title;
  final String? subtitle;
  final Color textColor;

  const EmptyWidget({super.key, this.iconWidget, this.title, this.subtitle, this.textColor = AppColors.black});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        iconWidget ??
            Image.asset(
              AppImages.emptySearch,
              width: 160,
              height: 151,
            ),
        const SizedBox(height: 16),
        Text(
          title ?? "no_results",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: 20,
                color: textColor,
              ),
        ),
        const SizedBox(height: 8),
        if (subtitle != null)
          Text(
            subtitle ?? "no_results",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 12,
                  color: textColor,
                ),
          ),
        const SizedBox(height: 110),
      ],
    ));
  }
}
