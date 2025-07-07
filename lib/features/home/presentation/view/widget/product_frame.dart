import 'package:flutter/material.dart';
import 'package:animated_rating_stars/animated_rating_stars.dart';

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
      width: 170,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image container
          Container(
            height: 124,
            width: 170,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 4),
          Text(
            "₹$currentPrice",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                "₹$originalPrice",
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontSize: 12,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                discount,
                style: const TextStyle(
                  color: Colors.orange,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              AnimatedRatingStars(
                initialRating: rating,
                minRating: 0,
                maxRating: 5,
                filledColor: Colors.amber,
                emptyColor: Colors.grey.shade300,
                starSize: 20,
                readOnly: true,
                onChanged: (double rating) {},
                customFilledIcon: Icons.star,
                customHalfFilledIcon: Icons.star_half,
                customEmptyIcon: Icons.star_border,
              ),
              const SizedBox(width: 6),
              Text(
                "$ratingCount",
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
