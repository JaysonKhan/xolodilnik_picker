import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xolodilnik_picker/assets/colors/colors.dart';
import 'package:xolodilnik_picker/assets/constants/app_icons.dart';

class WCheckBox extends StatelessWidget {
  bool isChecked;
  final Color checkBoxColor;
  final double size;

  WCheckBox({
    required this.isChecked,
    this.size = 24,
    this.checkBoxColor = Colors.white,
    super.key,
  });

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: size,
        width: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isChecked ? checkBoxColor : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
            gradient: isChecked ? AppColors.mainButtonGradient : null,
            border: isChecked ? null : Border.all(width: 1.6, color: AppColors.grey3)),
        child: SvgPicture.asset(
          AppIcons.check,
          color: isChecked ? AppColors.white : Colors.transparent,
        ),
      );
}
