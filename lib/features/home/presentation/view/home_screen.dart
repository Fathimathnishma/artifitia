import 'package:artifitia/core/utils/app_colors%20.dart';
import 'package:artifitia/core/utils/app_icons.dart';
import 'package:artifitia/core/utils/app_images.dart';
import 'package:artifitia/core/widget/ctextform.dart';
import 'package:artifitia/features/home/presentation/view/widget/banner_fram.dart';
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
                label: 'Search Course',
                fontSize: 12,
                icon: Icons.search,
                filled: true,
              ),
              Gap(16),
              Row(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Featured',
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

              MainBanner(),
            ],
          ),
        ),
      ),
    );
  }
}
