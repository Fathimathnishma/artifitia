import 'package:artifitia/core/utils/app_colors%20.dart';
import 'package:flutter/material.dart';
import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:gap/gap.dart';

class ProductFrame extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double? rating;
  final String? description;
  final int? currentPrice;
  final int? originalPrice;
  final String? discount;
  final int? ratingCount;
  final double height;
  final double imgHeight;
  final double width;
  final bool isTitleBold;

  const ProductFrame({
    super.key,
    required this.title,
    required this.imageUrl,
    this.rating,
    this.description,
    this.currentPrice,
    this.originalPrice,
    this.discount,
    this.ratingCount,
    required this.height,
    required this.width,
    required this.imgHeight,
    this.isTitleBold = true, // 👈 default is bold
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: imgHeight,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),

          const SizedBox(height: 4),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: isTitleBold ? FontWeight.w600 : FontWeight.w400,
              fontSize: isTitleBold ? 12 : 10,
            ),
          ),
          const SizedBox(height: 3),
          if (description != null)
            Text(
              description!,
              maxLines: 2,

              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
            ),
          const SizedBox(height: 3),
          if (currentPrice != null)
            Text(
              "₹$currentPrice",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                height: 1,
                fontSize: 12,
              ),
            ),

          if (originalPrice != null && discount != null)
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "₹$originalPrice",
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 12,
                    color: AppColors.greyShade,
                    height: 1,
                    decorationColor: AppColors.greyShade.withOpacity(0.8),
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  discount!,
                  style: TextStyle(color: AppColors.dicClr, fontSize: 10),
                ),
              ],
            ),
          if (rating != null)
            Row(
              children: [
                AnimatedRatingStars(
                  initialRating: rating!,
                  minRating: 0,
                  maxRating: 5,
                  filledColor: Colors.amber,
                  emptyColor: Colors.grey.shade300,
                  starSize: 10,
                  readOnly: true,
                  onChanged: (_) {},
                  customFilledIcon: Icons.star,
                  customHalfFilledIcon: Icons.star_half,
                  customEmptyIcon: Icons.star_border,
                ),
                const SizedBox(width: 6),
                if (ratingCount != null)
                  Text(
                    "$ratingCount",
                    style: TextStyle(fontSize: 10, color: AppColors.greyShade),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
