import 'package:artifitia/general/core/utils/app_colors%20.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../data/onboarding_model.dart';

class OnboardingFrame extends StatelessWidget {
  const OnboardingFrame({super.key, required this.onboardingModel});
  final OnboardingModel onboardingModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Image.asset(onboardingModel.image, fit: BoxFit.contain),
          ),
          const Gap(20),
          Text(
            onboardingModel.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.1,
              fontWeight: FontWeight.w800,
              fontSize: 24,
              // color: Colors
              //     .white, // Color here doesn't matter due to the gradient.
            ),
          ),
          const Gap(8),
          Text(
            onboardingModel.description,
            style: TextStyle(
              // maxLines: 3,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: AppColors.blackShade.withOpacity(0.6),
            ),
            textAlign: TextAlign.center,
            maxLines: 4,
          ),
          Gap(30),
        ],
      ),
    );
  }
}
