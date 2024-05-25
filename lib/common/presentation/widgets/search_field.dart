import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xolodilnik_picker/assets/colors/colors.dart';
import 'package:xolodilnik_picker/assets/constants/app_icons.dart';

class SearchField extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final Function()? onClear;
  final Color fillColor;
  final Color? borderColor;
  final FocusNode? focusNode;
  final double borderRadius;
  final GlobalKey<FormState>? stateKey;
  final bool hasBorder;
  final TextStyle? textStyle;
  final double height;
  final Widget? suffixIcon;
  final String? hintText;
  final bool autoFocus;

  const SearchField({
    this.focusNode,
    this.suffixIcon,
    this.stateKey,
    required this.controller,
    required this.onChanged,
    this.onClear,
    this.borderColor,
    this.borderRadius = 8,
    this.fillColor = AppColors.grey4,
    super.key,
    this.hasBorder = false,
    this.textStyle,
    this.height = 40,
    this.hintText,
    this.autoFocus = false,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: (widget.focusNode?.hasFocus ?? false) ? Border.all(color: AppColors.mainDark) : null),
      child: Focus(
        autofocus: widget.autoFocus,
        onFocusChange: (focused) {
          setState(() {
            isFocused = focused;
          });
        },
        child: Stack(
          children: [
            TextFormField(
              autofocus: widget.autoFocus,
              key: widget.stateKey,
              focusNode: widget.focusNode,
              controller: widget.controller,
              onTapOutside: (value) {
                widget.focusNode?.unfocus();
              },
              onChanged: (val) {
                widget.onChanged(val);
                setState(() {});
              },
              cursorColor: AppColors.mainOrange,
              style:
                  widget.textStyle ?? Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                filled: true,
                fillColor: isFocused ? AppColors.white : widget.fillColor,
                contentPadding: const EdgeInsets.only(left: 8),
                suffixIconConstraints: BoxConstraints(maxHeight: widget.height - 2),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SvgPicture.asset(
                    AppIcons.search,
                    colorFilter: const ColorFilter.mode(AppColors.grey2, BlendMode.srcIn),
                  ),
                ),
                hintText: widget.hintText ?? "",
                hintStyle: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontWeight: FontWeight.w500, color: AppColors.grey3),
                prefixIconConstraints: const BoxConstraints(maxWidth: 40),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: BorderSide(color: widget.borderColor ?? Colors.transparent),
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: ValueListenableBuilder<TextEditingValue>(
                builder: (context, value, child) {
                  if (value.text.isNotEmpty) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: SvgPicture.asset(AppIcons.clear),
                      ),
                      onTap: () {
                        widget.controller.clear();
                        widget.onChanged('');
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
                valueListenable: widget.controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
