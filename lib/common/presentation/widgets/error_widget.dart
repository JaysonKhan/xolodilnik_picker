import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xolodilnik_picker/assets/constants/app_icons.dart';

class AppErrorWidget extends StatelessWidget {
  final Widget? iconWidget;
  final String? title;
  final String? subtitle;
  final Color textColor;

  const AppErrorWidget({super.key, this.iconWidget, this.title, this.subtitle, this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 100),
        iconWidget ??
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(color: Color(0xFFFF831B), shape: BoxShape.circle),
              child: Center(child: SvgPicture.asset(AppIcons.error)),
            ),
        const SizedBox(height: 16),
        Text(title ?? "error_has_occurred",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20, color: textColor)),
        const SizedBox(height: 8),
        if (subtitle != null)
          Text(subtitle ?? "try_again",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 12,
                    color: textColor.withOpacity(.8),
                  )),
        const SizedBox(height: 24)
      ],
    ));
  }
}
