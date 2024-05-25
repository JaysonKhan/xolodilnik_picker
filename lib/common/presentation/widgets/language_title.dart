import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xolodilnik_picker/common/presentation/widgets/w_radio.dart';

class LanguageTitle extends StatelessWidget {
  final String title;
  final ValueChanged<int> onTap;
  final int value;
  final int groupValue;
  final bool isHaveImage;
  final String? img;

  const LanguageTitle({
    required this.onTap,
    required this.title,
    required this.groupValue,
    required this.value,
    this.isHaveImage = false,
    this.img,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(groupValue);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(img ?? "", width: 24, height: 24),
                    const SizedBox(width: 8),
                    Text(title,
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w700)),
                  ],
                ),
                WRadio(onChanged: onTap, value: value, groupValue: groupValue),
              ],
            )
          ],
        ),
      ),
    );
  }
}
