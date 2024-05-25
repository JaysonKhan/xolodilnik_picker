import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xolodilnik_picker/assets/colors/colors.dart';
import 'package:xolodilnik_picker/assets/themes/theme.dart';

class DefaultTextField extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onSubmit;
  final Function()? onTap;
  final EdgeInsets contentPadding;
  final Widget? prefix;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffix;
  final double prefixMaxWidth;
  final double suffixMaxWidth;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final String? hintText;
  final bool hasError;
  final bool isObscure;
  final String prefixText;
  final InputDecoration? inputDecoration;
  final TextInputType? keyboardType;
  final String title;
  final double? height;
  final int? maxLines;
  final int? maxLength;
  final bool autoFocus;
  final FocusNode? focusNode;
  final TextAlignVertical? textAlignVertical;
  final bool? expands;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final bool showCount;
  final TextInputAction? textInputAction;
  final TextStyle? titleStyle;
  final bool readOnly;
  final Color? fillColor;
  final Color? borderColor;
  final Color? cursorColor;
  final double? borderRadius;
  final Function(PointerDownEvent pointerDownEvent)? onTapOutside;

  const DefaultTextField({
    this.onSubmit,
    this.autoFocus = true,
    this.readOnly = false,
    this.showCount = false,
    this.focusNode,
    this.fillColor,
    this.textInputAction,
    this.maxLengthEnforcement,
    required this.controller,
    required this.onChanged,
    this.prefix,
    this.title = '',
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 12),
    this.inputFormatters,
    this.cursorColor = AppColors.mainOrange,
    this.suffix,
    this.prefixMaxWidth = 40,
    this.suffixMaxWidth = 40,
    this.hintStyle,
    this.hintText,
    this.borderColor,
    this.style,
    this.isObscure = false,
    this.hasError = false,
    this.prefixText = '',
    this.inputDecoration,
    this.keyboardType,
    this.height,
    this.maxLines,
    this.maxLength,
    this.titleStyle,
    this.textAlignVertical,
    this.expands,
    Key? key,
    this.borderRadius,
    this.onTap,
    this.onTapOutside,
  }) : super(key: key);

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.theme(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title.isNotEmpty) ...[
            Text(
              widget.title,
              style:
                  widget.titleStyle ?? Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
          ],
          SizedBox(
            height: widget.height ?? 44,
            child: AbsorbPointer(
              absorbing: widget.readOnly,
              child: Focus(
                autofocus: widget.autoFocus,
                onFocusChange: (focused) {
                  if (!widget.readOnly) {
                    setState(() {
                      isFocused = focused;
                    });
                  }
                },
                child: TextField(
                  onTapOutside: widget.onTapOutside ?? (PointerDownEvent pointerDownEvent) {},
                  onTap: widget.onTap ?? () {},
                  expands: widget.expands ?? false,
                  maxLengthEnforcement: widget.maxLengthEnforcement,
                  textAlignVertical: widget.textAlignVertical,
                  focusNode: widget.focusNode,
                  autofocus: widget.autoFocus,
                  readOnly: widget.readOnly,
                  controller: widget.controller,
                  onChanged: widget.onChanged,
                  textInputAction: widget.textInputAction,
                  style:
                      widget.style ?? Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w500),
                  inputFormatters: widget.inputFormatters,
                  obscureText: widget.isObscure,
                  keyboardType: widget.keyboardType,
                  maxLength: widget.maxLength,
                  maxLines: widget.isObscure ? 1 : widget.maxLines,
                  onSubmitted: widget.onSubmit,
                  cursorColor: widget.cursorColor,
                  decoration: widget.inputDecoration ??
                      InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
                          borderSide: BorderSide(color: widget.hasError ? AppColors.red : Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
                          borderSide: BorderSide(
                              color: widget.hasError
                                  ? AppColors.red
                                  : isFocused
                                      ? widget.borderColor ?? AppColors.grey2
                                      : AppColors.white),
                        ),
                        hintText: widget.hintText,
                        hintStyle: widget.hintStyle ??
                            const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey2,
                            ),
                        contentPadding: widget.contentPadding,
                        suffixIcon: widget.suffix,
                        suffixIconConstraints: BoxConstraints(maxWidth: widget.suffixMaxWidth),
                        fillColor: widget.fillColor ?? (isFocused ? AppColors.white : AppColors.grey4),
                        filled: true,
                        prefixIconConstraints: BoxConstraints(maxWidth: widget.prefixMaxWidth),
                        prefixIcon: widget.prefix,
                        counterText: '',
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
