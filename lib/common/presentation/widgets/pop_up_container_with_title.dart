import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xolodilnik_picker/assets/colors/colors.dart';
import 'package:xolodilnik_picker/assets/constants/app_icons.dart';
import 'package:xolodilnik_picker/assets/constants/enums.dart';
import 'package:xolodilnik_picker/utils/extensions.dart';

class PopUpContainerWithTitle extends StatefulWidget {
  final PopUpStatus status;
  final VoidCallback? onCancel;
  final String title;
  final String subtitle;

  const PopUpContainerWithTitle({
    super.key,
    required this.status,
    required this.onCancel,
    required this.title,
    required this.subtitle,
  });

  @override
  State<PopUpContainerWithTitle> createState() => _PopUpContainerWithTitleState();
}

class _PopUpContainerWithTitleState extends State<PopUpContainerWithTitle> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3), value: 1)..reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: AppColors.grey4),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackRussian.withOpacity(0.12),
            offset: const Offset(0, 6),
            blurRadius: 20,
          )
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(widget.status.icon),
          const SizedBox(width: 8),
          if (!widget.status.isWarning) ...{
            Expanded(
              child: Text(widget.title,
                  style: context.textTheme.headlineLarge!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start),
            ),
          } else ...{
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,
                      style: context.textTheme.headlineLarge!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.start),
                  Text(widget.subtitle,
                      style: context.textTheme.headlineLarge!.copyWith(
                        color: AppColors.grey1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.start),
                ],
              ),
            ),
          },
          AnimatedBuilder(
            animation: animationController,
            builder: (BuildContext context, Widget? child) {
              if (animationController.value == 0) {
                return const SizedBox(
                  height: 28,
                  width: 28,
                );
              }
              return GestureDetector(
                onTap: widget.onCancel,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.flip(
                      flipX: true,
                      child: SizedBox(
                        height: 28,
                        width: 28,
                        child: CircularProgressIndicator(
                          color: AppColors.grey4,
                          strokeWidth: 1.6,
                          value: animationController.value,
                        ),
                      ),
                    ),
                    SvgPicture.asset(AppIcons.xBack, height: 24, width: 24),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
