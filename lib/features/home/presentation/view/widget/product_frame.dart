import 'package:artifitia/core/utils/app_colors%20.dart';
import 'package:flutter/material.dart';
import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:gap/gap.dart';

class ProductFrame extends StatelessWidget {
  final double rating;
  final String imageUrl;
  final String title;
  final String description;
  final int currentPrice;
  final int originalPrice;
  final String discount;
  final int ratingCount;

  const ProductFrame({
    super.key,
    required this.rating,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.currentPrice,
    required this.originalPrice,
    required this.discount,
    required this.ratingCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 241,
      width: 170,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        //  border: Border.all(color: Colors.purple.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Container(
            height: 110,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),

          const SizedBox(height: 6),

          // Title
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          ),

          // Description
          Text(
            description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
          ),

          const SizedBox(height: 4),

          // Current Price
          Text(
            "₹$currentPrice",
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          ),

          // Original Price + Discount
          Row(
            children: [
              Text(
                "₹$originalPrice",
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontSize: 12,
                  color: AppColors.greyShade,
                  decorationColor: AppColors.greyShade.withOpacity(0.8),
                ),
              ),
              const SizedBox(width: 6),
              Text(
                discount,
                style: TextStyle(color: AppColors.dicClr, fontSize: 10),
              ),
            ],
          ),

          Gap(4),
          Row(
            children: [
              AnimatedRatingStars(
                initialRating: rating,
                minRating: 0,
                maxRating: 5,
                filledColor: Colors.amber,
                emptyColor: Colors.grey.shade300,
                starSize: 10,
                readOnly: true,
                onChanged: (double rating) {},
                customFilledIcon: Icons.star,
                customHalfFilledIcon: Icons.star_half,
                customEmptyIcon: Icons.star_border,
              ),
              const SizedBox(width: 6),
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
