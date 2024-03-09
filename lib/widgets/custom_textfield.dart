import 'package:flight/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onSaved;
  final bool? enabled;
  final bool? readOnly;
  final int? maxLines;
  final int? minLines;
  final bool? expands;
  final String? initialValue;
  final String? labelText;
  final String? errorText;
  final String? helperText;
  final FocusNode? focusNode;

  const CustomTextField(
      {super.key,
      this.hintText,
      this.controller,
      this.keyboardType,
      this.obscureText,
      this.suffixIcon,
      this.prefixIcon,
      this.validator,
      this.onChanged,
      this.onTap,
      this.onFieldSubmitted,
      this.onSaved,
      this.enabled,
      this.readOnly,
      this.maxLines,
      this.minLines,
      this.expands,
      this.initialValue,
      this.labelText,
      this.errorText,
      this.focusNode,
      this.helperText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
          decoration: BoxDecoration(
            color: AppColors.accentColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText ?? false,
            validator: validator,
            onChanged: onChanged,
            onTap: onTap,
            textCapitalization: TextCapitalization.words,
            onFieldSubmitted: onFieldSubmitted,
            enabled: enabled,
            readOnly: readOnly ?? false,
            maxLines: maxLines ?? 1,
            minLines: minLines,
            expands: expands ?? false,
            focusNode: focusNode,
            initialValue: initialValue,
            textAlignVertical: obscureText != null
                ? TextAlignVertical.center
                : TextAlignVertical.top,
            decoration: InputDecoration(
              alignLabelWithHint: true,
              hintText: hintText,
              hintStyle: TextStyle(
                color: AppColors.textColor.withOpacity(0.5),
                fontSize: 14,
              ),
              contentPadding: EdgeInsets.zero,
              helperText: helperText,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              border: InputBorder.none,
            ),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 5),
            child: Text(
              errorText!,
              style: const TextStyle(
                color: AppColors.redColor,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
