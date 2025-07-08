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
  final Color? color;
  final Color? iconColor;

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
    this.color,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final baseColor = color ?? AppColors.blackShade.withOpacity(0.4);

    final borderStyle =
        hasBorder
            ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: baseColor, width: 1),
            )
            : InputBorder.none;

    return TextFormField(
      cursorColor: baseColor,
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      style: TextStyle(fontSize: fontSize, color: baseColor),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontSize: fontSize,
          color: iconColor ?? AppColors.blackShade.withOpacity(0.4),
        ),
        prefixIcon: Icon(
          icon,
          color: iconColor ?? AppColors.blackShade.withOpacity(0.4),
        ),
        suffixIcon: suffix,
        filled: filled,
        fillColor: color ?? baseColor.withOpacity(0.2),
        enabledBorder: borderStyle,
        focusedBorder: borderStyle,
        border: borderStyle,
        focusColor: baseColor,
      ),
    );
  }
}
