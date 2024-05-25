import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xolodilnik_picker/assets/colors/colors.dart';
import 'package:xolodilnik_picker/assets/constants/app_icons.dart';
import 'package:xolodilnik_picker/common/presentation/widgets/w_scale_animation.dart';

class DefaultBottomSheet extends StatelessWidget {
  const DefaultBottomSheet({
    super.key,
    required this.children,
    required this.title,
    required this.hasDivider,
    this.hasBackButton = false,
    this.mainAxisSize = MainAxisSize.min,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.onTapX,
  });

  final List<Widget> children;
  final String title;
  final MainAxisSize? mainAxisSize;
  final bool hasDivider;
  final bool hasBackButton;
  final CrossAxisAlignment crossAxisAlignment;
  final Function()? onTapX;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom + MediaQuery.of(context).viewInsets.bottom + 16),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: mainAxisSize ?? MainAxisSize.min,
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(hasBackButton ? 0 : 20, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (hasBackButton) ...{
                  WScaleAnimation(
                    onTap: () => Navigator.of(context).pop(),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.chevronLeft,
                            color: AppColors.mainDark,
                            height: 24,
                            width: 24,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            title,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                } else ...{
                  Text(
                    title,
                    style:
                        Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                },
                // const Spacer(),
                WScaleAnimation(
                  onTap: onTapX ?? () => Navigator.of(context).pop(),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(
                      AppIcons.xBack,
                      color: AppColors.grey1,
                      height: 24,
                      width: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (hasDivider) const Divider(height: 0, thickness: 1, color: AppColors.grey4),
          ...children,
        ],
      ),
    );
  }
}
