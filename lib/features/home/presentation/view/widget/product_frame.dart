import 'dart:ui';

import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:artifitia/general/core/utils/app_colors%20.dart';
import 'package:artifitia/features/product/data/product_model.dart';
import 'package:flutter/material.dart';

class ProductFrame extends StatelessWidget {
  final ProductModel product;
  final double? height;
  final double? width;
  final double? imgHeight;
  final bool isTitleBold;
  final bool showRating;

  const ProductFrame({
    super.key,
    required this.product,
    this.height,
    this.width,
    this.imgHeight,
    this.isTitleBold = true,
    this.showRating = true,
  });

  @override
  Widget build(BuildContext context) {
    final double totalHeight = height ?? 186;
    final double imageH = imgHeight ?? totalHeight * 0.48;
    final double fontScale = totalHeight / 186;

    return Container(
      height: totalHeight,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image
          Container(
            height: imageH,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  product.imageUrls[0].startsWith('//')
                      ? 'https:${product.imageUrls[0]}'
                      : product.imageUrls[0],
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 4),

          /// Title
          Text(
            product.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: isTitleBold ? FontWeight.w600 : FontWeight.w400,
              fontSize: 12 * fontScale.clamp(0.8, 1),
              height: 1,
            ),
          ),

          /// Description
          if (product.description != null)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                product.description!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10 * fontScale.clamp(0.8, 1),
                  height: 1.2,
                ),
              ),
            ),

          /// Current Price
          if (product.currentPrice != null)
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                "₹${product.currentPrice}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12 * fontScale.clamp(0.8, 1),
                  height: 1,
                ),
              ),
            ),

          /// Original Price + Discount
          if (product.originalPrice != null && product.discount != null)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                children: [
                  Text(
                    "₹${product.originalPrice}",
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 10 * fontScale.clamp(0.8, 1),
                      color: AppColors.greyShade,
                      height: 1,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    product.discount!,
                    style: TextStyle(
                      color: AppColors.dicClr,
                      fontSize: 9 * fontScale.clamp(0.8, 1),
                    ),
                  ),
                ],
              ),
            ),

          /// Rating
          if (showRating && product.rating != null)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                children: [
                  AnimatedRatingStars(
                    initialRating: product.rating!,
                    minRating: 0,
                    maxRating: 5,
                    filledColor: Colors.amber,
                    emptyColor: Colors.grey.shade300,
                    starSize: 10 * fontScale.clamp(0.8, 1),
                    readOnly: true,
                    onChanged: (_) {},
                    customFilledIcon: Icons.star,
                    customHalfFilledIcon: Icons.star_half,
                    customEmptyIcon: Icons.star_border,
                  ),
                  const SizedBox(width: 4),
                  if (product.ratingCount != null)
                    Text(
                      "${product.ratingCount}",
                      style: TextStyle(
                        fontSize: 9 * fontScale.clamp(0.8, 1),
                        color: AppColors.greyShade,
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
