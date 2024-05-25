import 'package:flutter/material.dart';
import 'package:xolodilnik_picker/assets/colors/colors.dart';

class WRadio extends StatelessWidget {
  final int value;
  final int groupValue;
  final ValueChanged<int> onChanged;
  final Color activeColor;
  final Color? inactiveColor;
  final double borderWidth;
  final double size;
  final bool isSelect;

  const WRadio({
    required this.onChanged,
    required this.value,
    required this.groupValue,
    this.activeColor = AppColors.mainDark,
    this.inactiveColor,
    this.borderWidth = 5,
    this.isSelect = false,
    this.size = 20,
    super.key,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          onChanged(value);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              margin: const EdgeInsets.all(2),
              duration: const Duration(milliseconds: 150),
              padding: EdgeInsets.all(value == groupValue ? size / 4 : 0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: value == groupValue ? AppColors.mainGradient : null,
                border: value == groupValue ? null : Border.all(width: 2, color: AppColors.grey3),
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                height: value == groupValue ? size / 2 : size - 4,
                width: value == groupValue ? size / 2 : size - 4,
                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                // padding: value == groupValue ? EdgeInsets.all(size / 5.2) : EdgeInsets.zero,
              ),
            ),
          ],
        ),
      );
}
