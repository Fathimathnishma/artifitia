import 'package:artifitia/core/utils/app_colors%20.dart';
import 'package:artifitia/core/utils/app_images.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainBanner extends StatefulWidget {
  const MainBanner({super.key});

  @override
  State<MainBanner> createState() => _MainBannerState();
}

class _MainBannerState extends State<MainBanner> {
  CarouselSliderController controller = CarouselSliderController();
  int activeIndex = 0;

  final List<String> bannerList = [AppImages.banner, AppImages.banner];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: controller,
          itemCount: bannerList.length,
          options: CarouselOptions(
            height: 189,
            viewportFraction: 0.95,
            autoPlay: bannerList.length > 1,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 400),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: false,
            onPageChanged: (index, _) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, _) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Background image
                    Image.asset(bannerList[index], fit: BoxFit.cover),
                    // Overlay content
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '50–40% OFF',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Now in (product)\nAll colours',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          height: 32,
                          width: 100,
                          // padding: const EdgeInsets.symmetric(
                          //   horizontal: 16,
                          //   vertical: 8,
                          // ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.white, width: 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Shop Now ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                size: 16,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        if (bannerList.length > 1)
          Container(
            margin: const EdgeInsets.only(bottom: 5, top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: bannerList.length,
              effect: CustomizableEffect(
                spacing: 6.0,
                activeDotDecoration: DotDecoration(
                  width: 12,
                  height: 12,
                  color: AppColors.pink,
                  borderRadius: BorderRadius.circular(6),
                ),
                dotDecoration: DotDecoration(
                  width: 9,
                  height: 9,
                  color: AppColors.blackShade.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
