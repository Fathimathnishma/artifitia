import 'package:artifitia/core/utils/app_colors%20.dart';
import 'package:artifitia/core/utils/app_icons.dart';
import 'package:artifitia/core/utils/app_images.dart';
import 'package:artifitia/core/widget/ctextform.dart';
import 'package:artifitia/features/home/data/category.dart';
import 'package:artifitia/features/home/presentation/view/widget/banner_fram.dart';
import 'package:artifitia/features/home/presentation/view/widget/limited_offer.dart';
import 'package:artifitia/features/home/presentation/view/widget/product_frame.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroudColor.withOpacity(0.99),
      appBar: AppBar(
        backgroundColor: AppColors.backGroudColor,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(child: Image(image: AssetImage(AppIcons.menu))),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Row(
              children: [
                SizedBox(
                  height: 31,
                  width: 97,
                  child: Image(image: AssetImage(AppIcons.appLogo)),
                ),
                Gap(80),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(AppImages.profile),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              CTextField(
                label: 'Search any Product..',
                fontSize: 12,
                icon: Icons.search,
                filled: true,
                color: Colors.white,
                suffix: Icon(
                  Icons.mic_none_outlined,
                  color: AppColors.blackShade.withOpacity(0.4),
                ),
              ),
              Gap(16),
              SizedBox(
                height: 24,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ' All Featured',
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          height: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Sort',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Image.asset(AppIcons.sort, height: 16),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          height: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Filter',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Image.asset(AppIcons.filter, height: 16),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Gap(16),
              Container(
                height: 87,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),

                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final cat = category[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: SizedBox(
                        height: 71,
                        width: 56,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundImage: AssetImage(cat.image),
                            ),
                            Text(cat.name, style: TextStyle(fontSize: 10)),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Gap(12);
                  },
                  itemCount: category.length,
                ),
              ),
              Gap(16),

              SponcerBanner(),
              Gap(16),
              LimitedOfferBox(
                backgroundColor: Colors.blue, // or AppColors.blue
                title: 'Deal of the Day',
                leadingIcon: Icons.alarm,
                countdownText: '22h 55m 20s remaining',
                onTap: () {
                  print("Clicked empty box!");
                },
              ),
              Gap(16),
              Container(
                height: 241,
                decoration: BoxDecoration(
                  color: AppColors.backGroudColor.withOpacity(0.99),
                  borderRadius: BorderRadius.circular(10),
                ),

                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: ProductFrame(
                        height: 241,
                        width: 170,
                        rating: 4.8,
                        imageUrl: AppImages.beauty,
                        title: "Women Printed Kurta",
                        description:
                            "Neque porro quisquam est qui dolorem ipsum quia",
                        currentPrice: 1500,
                        originalPrice: 2499,
                        discount: "40%Off",
                        ratingCount: 56890,
                        imgHeight: 124,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Gap(12);
                  },
                  itemCount: 6,
                ),
              ),
              Container(
                height: 84,
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(AppImages.sploffer, height: 60, width: 75),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Special Offers 🤑",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "We make sure you get the offer you need at best prices",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Gap(16),
              Container(
                height: 179,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    height: 170,
                    width: double.infinity,

                    color: Colors.grey.shade200,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,

                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              AppImages.sparkling,
                              width: 90,
                              height: 169,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        /// Second Image (e.g., Heels) Overlay on top corner
                        Positioned(
                          left: 2,
                          bottom: 0,
                          top: 4,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                            ),
                            child: Image.asset(
                              AppImages.heels,
                              height: 108,
                              width: 144,
                              //  fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Positioned(
                          top: 35,
                          left: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Flat & Heels',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 2),
                              const Text(
                                'Stand a chance to get rewarded',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Gap(10),
                              SizedBox(
                                width: 150,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 28,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: AppColors.primary,
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        children: const [
                                          Text(
                                            'View Now',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(width: 4),
                                          Icon(
                                            Icons.arrow_forward,
                                            size: 14,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
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
              Gap(25),
              LimitedOfferBox(
                backgroundColor: AppColors.pink,
                title: "Trending Products ",
                leadingIcon: Icons.calendar_month,
                countdownText: "Last Date 29/02/22",
              ),
              Gap(8),
              Container(
                height: 186,
                decoration: BoxDecoration(
                  color: AppColors.backGroudColor.withOpacity(0.99),
                  borderRadius: BorderRadius.circular(10),
                ),

                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: ProductFrame(
                        height: 186,
                        width: 142,
                        rating: 4.8,
                        imageUrl: AppImages.beauty,
                        title: "Women Printed Kurta",
                        description:
                            "Neque porro quisquam est qui dolorem ipsum quia",
                        currentPrice: 1500,
                        originalPrice: 2499,
                        discount: "40%Off",
                        ratingCount: 56890,
                        imgHeight: 100,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Gap(12);
                  },
                  itemCount: 6,
                ),
              ),
              Gap(12),
              NewBanner(),
              Gap(16),
              SponcerBanner(),
            ],
          ),
        ),
      ),
    );
  }
}
