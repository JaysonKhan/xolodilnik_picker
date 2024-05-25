import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:xolodilnik_picker/assets/colors/colors.dart';
import 'package:xolodilnik_picker/common/presentation/widgets/default_bottom_sheet.dart';
import 'package:xolodilnik_picker/common/presentation/widgets/w_button.dart';

class ConfirmCancelSheet extends StatelessWidget {
  const ConfirmCancelSheet(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.onTapCancel,
      required this.onTapConfirm,
      required this.confirmButtonText,
      required this.isLoading});

  final String title;
  final String subTitle;
  final String confirmButtonText;
  final VoidCallback onTapCancel;
  final VoidCallback onTapConfirm;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return DefaultBottomSheet(
      title: title,
      hasDivider: true,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16, bottom: 24),
          child: Text(subTitle,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  )),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            WButton(
              width: (MediaQuery.sizeOf(context).width - 44) / 2,
              margin: const EdgeInsets.fromLTRB(16, 3, 12, 0),
              onTap: onTapCancel,
              color: AppColors.grey4,
              textColor: AppColors.mainDark,
              text: "cancel",
            ),
            WButton(
                width: (MediaQuery.sizeOf(context).width - 44) / 2,
                margin: const EdgeInsets.fromLTRB(0, 3, 16, 0),
                onTap: onTapConfirm,
                hasGradient: true,
                isLoading: isLoading,
                textColor: AppColors.white,
                text: confirmButtonText),
          ],
        ),
      ],
    );
  }
}
