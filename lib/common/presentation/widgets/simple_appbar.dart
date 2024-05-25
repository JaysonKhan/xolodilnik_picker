import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xolodilnik_picker/assets/colors/colors.dart';
import 'package:xolodilnik_picker/assets/constants/app_icons.dart';
import 'package:xolodilnik_picker/common/presentation/widgets/custom_divider.dart';
import 'package:xolodilnik_picker/utils/extensions.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  final String title;
  final VoidCallback? actionOnTap;
  final String? actionIcon;
  final VoidCallback? onBack;

  const SimpleAppBar({
    super.key,
    required this.context,
    required this.title,
    this.actionOnTap,
    this.actionIcon,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          onBack?.call();
          Navigator.of(context).pop();
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 12, 8),
          child: SvgPicture.asset(
            AppIcons.arrowLeft,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      title: Text(
        title,
        style: context.textTheme.bodyMedium!.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
        maxLines: 2,
      ),
      elevation: 0,
      bottom: const PreferredSize(preferredSize: Size.fromHeight(1), child: CustomDivider()),
      shadowColor: AppColors.grey1.withOpacity(.1),
      actions: [
        if (actionIcon != null)
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: actionOnTap,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 16, 8),
              child: SvgPicture.asset(
                actionIcon!,
                height: 24,
                width: 24,
              ),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(MediaQuery.sizeOf(context).width, kToolbarHeight);
}
