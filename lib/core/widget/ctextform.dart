import 'package:artifitia/core/utils/app_colors%20.dart';
import 'package:flutter/material.dart';

class CTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool obscureText;
  final TextEditingController? controller;
  final Widget? suffix;
  final bool filled;
  final bool hasBorder;
  final double fontSize;
  final String? Function(String?)? validator;

  const CTextField({
    super.key,
    required this.label,
    required this.icon,
    this.obscureText = false,
    this.controller,
    this.suffix,
    this.filled = true,
    this.hasBorder = true,
    this.fontSize = 12,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final borderStyle =
        hasBorder
            ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.blackShade, width: 1),
            )
            : InputBorder.none;

    return TextFormField(
      cursorColor: AppColors.blackShade,
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      style: TextStyle(fontSize: fontSize, color: AppColors.blackShade),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontSize: fontSize,
          color: AppColors.blackShade, // fixes purple label color
        ),
        prefixIcon: Icon(icon, color: AppColors.blackShade),
        suffixIcon: suffix,
        filled: filled,
        fillColor: AppColors.blackShade.withOpacity(0.2),
        enabledBorder: borderStyle,
        focusedBorder: borderStyle,
        border: borderStyle,
        focusColor: AppColors.black, // optional
      ),
    );
  }
}
