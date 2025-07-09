import 'package:artifitia/general/core/utils/app_icons.dart';
import 'package:artifitia/general/core/utils/app_images.dart';
import 'package:artifitia/general/core/widget/ctextform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:artifitia/features/product/data/product_model.dart';
import 'package:artifitia/features/home/presentation/view/widget/product_frame.dart';
import 'package:artifitia/general/core/utils/app_colors%20.dart';
import 'package:gap/gap.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroudColor.withOpacity(0.99),
      appBar: AppBar(
        backgroundColor: AppColors.backGroudColor,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(AppIcons.menu),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Row(
              children: [
                SizedBox(
                  height: 31,
                  width: 97,
                  child: Image.asset(AppIcons.appLogo),
                ),
                const Gap(80),
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
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
            const Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  ' All Featured',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                Row(
                  children: [
                    _buildButton('Sort', AppIcons.sort),
                    const SizedBox(width: 8),
                    _buildButton('Filter', AppIcons.filter),
                  ],
                ),
              ],
            ),
            const Gap(16),

            /// 🛠️ Fix: Wrap GridView in Expanded
            Expanded(
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                itemCount: product.length,
                itemBuilder: (context, index) {
                  final height = 220 + (index % 3) * 30; // Pinterest effect
                  return ProductFrame(
                    product: product[index],
                    height: height.toDouble(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String label, String iconPath) {
    return Container(
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
            label,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(width: 4),
          Image.asset(iconPath, height: 16),
        ],
      ),
    );
  }
}
