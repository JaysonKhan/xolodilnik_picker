import 'package:flutter/material.dart';
import 'package:xolodilnik_picker/assets/colors/colors.dart';

class SheetHeader extends StatelessWidget {
  const SheetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 5,
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: AppColors.grey4),
    );
  }
}
