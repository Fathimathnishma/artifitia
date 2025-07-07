import 'package:artifitia/core/utils/app_colors%20.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BottomNaviFrame extends StatelessWidget {
  const BottomNaviFrame({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.title,
    required this.index,
    required this.selectIndex,
    this.iconSize,
  });
  final int index;
  final int selectIndex;
  final String icon;
  final String title;
  final double? iconSize;
  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed.call(index);
      },
      borderRadius: BorderRadius.circular(30),
      child: SizedBox(
        width: 55,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 45,
              padding: const EdgeInsets.symmetric(vertical: 1.5),
              // decoration: BoxDecoration(
              //   color: selectIndex == index ? AppColors.secondaryColor : null,
              //   borderRadius: BorderRadius.circular(30),
              // ),
              child: ImageIcon(
                AssetImage(icon),
                color:
                    selectIndex == index ? AppColors.secondary : Colors.white,
                size: iconSize,
              ),
            ),
            const Gap(5),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
