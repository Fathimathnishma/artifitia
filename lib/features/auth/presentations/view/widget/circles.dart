import 'package:artifitia/core/utils/app_colors%20.dart';
import 'package:flutter/material.dart';

class BorderCircle extends StatelessWidget {
  final String imagePath;

  const BorderCircle({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: 54,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primary, width: 1),
      ),
      child: CircleAvatar(
        backgroundColor: AppColors.primary.withOpacity(0.1),
        child: Image.asset(imagePath, height: 24, width: 24),
      ),
    );
  }
}
