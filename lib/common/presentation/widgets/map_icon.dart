import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xolodilnik_picker/assets/colors/colors.dart';
import 'package:xolodilnik_picker/common/presentation/widgets/w_scale_animation.dart';

class MapIcon extends StatelessWidget {
  const MapIcon({super.key, required this.onTap, required this.icon});
  final VoidCallback onTap;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: AppColors.mainDark.withOpacity(.12),
                blurRadius: 12,
                spreadRadius: 0,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: SvgPicture.asset(
            icon,
            color: AppColors.mainDark,
            height: 24,
            width: 24,
          )),
    );
  }
}
