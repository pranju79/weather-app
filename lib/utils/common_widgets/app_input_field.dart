import 'package:flutter/material.dart';
import 'package:weather_app/utils/components/app_colors.dart';
import 'package:weather_app/utils/components/app_typography.dart';

class AppInputField extends StatefulWidget {
  final String label;
  final String hint;
  final bool password;
  final Widget? leading;
  final TextEditingController? controller;
  final Widget? trailing;
  final void Function()? trailingTapped;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final FormFieldValidator<String>? validator;

  const AppInputField({
    super.key,
    this.label = '',
    this.hint = '',
    this.trailing,
    this.leading,
    this.controller,
    this.onChanged,
    this.onTap,
    this.trailingTapped,
    this.password = false,
    this.validator,
  });

  @override
  State<AppInputField> createState() => _AppInputFieldState();
}

class _AppInputFieldState extends State<AppInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: AppColors.lightgrey,
        filled: true,
        focusColor: AppColors.primary,
        hintText: widget.hint,
        labelText: widget.label,
        hintStyle: AppTypography.text16Grey,
        labelStyle: AppTypography.text16Blue,
        iconColor: AppColors.grey,
        suffixIconColor: AppColors.primary,
        prefixIcon: widget.leading,
        suffixIcon: widget.trailing != null
            ? GestureDetector(
                onTap: widget.trailingTapped,
                child: widget.trailing,
              )
            : null,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.lightgrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
      ),
      validator: widget.validator,
      style: const TextStyle(height: 1.5, fontSize: 16),
      obscureText: widget.password,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
