import 'package:artifitia/general/core/utils/app_images.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboarding_model.dart';

class OnboardingLocalData {
  static List<OnboardingModel> list = [
    OnboardingModel(
      title: 'Choose Products',
      description:
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
      image: AppImages.onBording1,
    ),
    OnboardingModel(
      title: 'Make Payment',
      description:
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
      image: AppImages.onBording2,
    ),
    OnboardingModel(
      title: 'Get Your Order',
      description:
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
      image: AppImages.onBording3,
    ),
  ];

  static Future<void> readOnBoardingScreen() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setBool('isReadOnboardingScreen', true);
  }

  static Future<bool> getOnBoardingScreen() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getBool('isReadOnboardingScreen') ?? false;
  }
}
