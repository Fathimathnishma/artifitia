import 'package:artifitia/core/services/easy_navigation.dart';
import 'package:artifitia/core/utils/app_colors%20.dart';
import 'package:artifitia/features/auth/presentations/view/login_screen.dart';
import 'package:artifitia/features/on_boarding/data/onboarding_local_data.dart';
import 'package:artifitia/features/on_boarding/presentation/view/widgets/onboarding_frame.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final mqHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backGroudColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroudColor,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            child: Text(
              '${currentIndex + 1}/${OnboardingLocalData.list.length}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: GestureDetector(
              onTap: () {
                OnboardingLocalData.readOnBoardingScreen();
                EasyNavigation.push(
                  context: context,
                  page: const LoginScreen(),
                );
              },
              child: Text(
                'skip',
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: mqHeight * 0.8,
                  child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (value) {
                      currentIndex = value;
                      setState(() {});
                    },
                    //scrollDirection: Axis.horizontal,
                    itemCount: OnboardingLocalData.list.length,
                    itemBuilder: (context, index) {
                      return OnboardingFrame(
                        onboardingModel: OnboardingLocalData.list[index],
                      );
                    },
                  ),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Show "Prev" only if not on first page
                      if (currentIndex != 0)
                        GestureDetector(
                          onTap: () {
                            pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                          child: Text(
                            'Prev',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      else
                        const SizedBox(
                          width: 40,
                        ), // placeholder to balance layout
                      // Page Indicator
                      SmoothPageIndicator(
                        controller: pageController,
                        count: OnboardingLocalData.list.length,
                        effect: ExpandingDotsEffect(
                          dotHeight: 8,
                          dotWidth: 11,
                          spacing: 5,
                          activeDotColor: AppColors.smooth,
                          dotColor: AppColors.smooth.withOpacity(0.2),
                          paintStyle: PaintingStyle.fill,
                        ),
                      ),

                      // "Next" or "Get Started" Button
                      GestureDetector(
                        onTap: () {
                          if (currentIndex ==
                              OnboardingLocalData.list.length - 1) {
                            OnboardingLocalData.readOnBoardingScreen();
                            EasyNavigation.push(
                              context: context,
                              page: const LoginScreen(),
                            );
                          } else {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          }
                        },
                        child: Text(
                          currentIndex == OnboardingLocalData.list.length - 1
                              ? 'Get Started'
                              : 'Next',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
