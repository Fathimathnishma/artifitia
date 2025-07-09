import 'package:flutter/material.dart';

class ProductModel {
  final String title;
  final List<String> imageUrls;
  final double? rating;
  final String? description;
  final int? currentPrice;
  final int? originalPrice;
  final String? discount;
  final List<String> sizes; // ✅ add this
  final int? ratingCount;
  final String createdAt;

  ProductModel({
    required this.title,
    required this.imageUrls,
    required this.createdAt,
    required this.sizes, // ✅ required
    this.rating,
    this.description,
    this.currentPrice,
    this.originalPrice,
    this.discount,
    this.ratingCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json['title'],
      imageUrls:
          json['imageUrls'] != null
              ? List<String>.from(json['imageUrls'])
              : [json['imageUrl']],
      createdAt: json['createdAt'],
      sizes: List<String>.from(json['sizes'] ?? []), // ✅ JSON safe parse
      rating: (json['rating'] as num?)?.toDouble(),
      description: json['description'],
      currentPrice: json['currentPrice'],
      originalPrice: json['originalPrice'],
      discount: json['discount'],
      ratingCount: json['ratingCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'imageUrls': imageUrls,
      'createdAt': createdAt,
      'sizes': sizes,
      'rating': rating,
      'description': description,
      'currentPrice': currentPrice,
      'originalPrice': originalPrice,
      'discount': discount,
      'ratingCount': ratingCount,
    };
  }
}

List<ProductModel> product = [
  ProductModel(
    title: "Pink Embroidered Dress",
    imageUrls: [
      "//www.lazyhippos.in/cdn/shop/files/aestheticmaroonhoodiemalebacksquare.webp?v=1697834960",
    ],
    createdAt: DateTime.now().toIso8601String(),
    sizes: ["6 UK", "7 UK", "8 UK"],
    rating: 4.5,
    description: "Ethnic Embroidered Tissue Kurta",
    currentPrice: 1500,
    originalPrice: 2500,
    discount: "40% OFF",
    ratingCount: 225,
  ),
  ProductModel(
    title: "Pink Embroidered Dress",
    imageUrls: [
      "//www.lazyhippos.in/cdn/shop/files/aestheticmaroonhoodiemalebacksquare.webp?v=1697834960",
    ],
    createdAt: DateTime.now().toIso8601String(),
    sizes: ["6 UK", "7 UK", "8 UK"],
    rating: 4.5,
    description: "Ethnic Embroidered Tissue Kurta",
    currentPrice: 1500,
    originalPrice: 2500,
    discount: "40% OFF",
    ratingCount: 225,
  ),
  ProductModel(
    title: "Pink Embroidered Dress",
    imageUrls: [
      "//encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx58U5bnEqrDm72IGDts9laiiG8NbUSifZww&s",
      "//www.lazyhippos.in/cdn/shop/files/aestheticmaroonhoodiemalebacksquare.webp?v=1697834960",
    ],
    createdAt: DateTime.now().toIso8601String(),
    sizes: ["6 UK", "7 UK", "8 UK"],
    rating: 4.5,
    description: "Ethnic Embroidered Tissue Kurta",
    currentPrice: 1500,
    originalPrice: 2500,
    discount: "40% OFF",
    ratingCount: 225,
  ),
  ProductModel(
    title: "Pink Embroidered Dress",
    imageUrls: [
      "//www.lazyhippos.in/cdn/shop/files/aestheticmaroonhoodiemalebacksquare.webp?v=1697834960",
    ],
    createdAt: DateTime.now().toIso8601String(),
    sizes: ["6 UK", "7 UK", "8 UK"],
    rating: 4.5,
    description: "Ethnic Embroidered Tissue Kurta",
    currentPrice: 1500,
    originalPrice: 2500,
    discount: "40% OFF",
    ratingCount: 225,
  ),
  ProductModel(
    title: "Pink Embroidered Dress",
    imageUrls: [
      "//encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx58U5bnEqrDm72IGDts9laiiG8NbUSifZww&s",
    ],
    createdAt: DateTime.now().toIso8601String(),
    sizes: ["6 UK", "7 UK", "8 UK"],
    rating: 4.5,
    description: "Ethnic Embroidered Tissue Kurta",
    currentPrice: 1500,
    originalPrice: 2500,
    discount: "40% OFF",
    ratingCount: 225,
  ),
  ProductModel(
    title: "Pink Embroidered Dress",
    imageUrls: [
      "//encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx58U5bnEqrDm72IGDts9laiiG8NbUSifZww&s",
    ],
    createdAt: DateTime.now().toIso8601String(),
    sizes: ["6 UK", "7 UK", "8 UK"],
    rating: 4.5,
    description: "Ethnic Embroidered Tissue Kurta",
    currentPrice: 1500,
    originalPrice: 2500,
    discount: "40% OFF",
    ratingCount: 225,
  ),
  ProductModel(
    title: "Pink Embroidered Dress",
    imageUrls: [
      "//encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx58U5bnEqrDm72IGDts9laiiG8NbUSifZww&s",
      "//www.lazyhippos.in/cdn/shop/files/aestheticmaroonhoodiemalebacksquare.webp?v=1697834960",
    ],
    createdAt: DateTime.now().toIso8601String(),
    sizes: ["6 UK", "7 UK", "8 UK"],
    rating: 4.5,
    description: "Ethnic Embroidered Tissue Kurta",
    currentPrice: 1500,
    originalPrice: 2500,
    discount: "40% OFF",
    ratingCount: 225,
  ),
];

class SizeSelector extends StatelessWidget {
  final List<String> sizes;
  final String selectedSize;
  final void Function(String) onSizeSelected;

  const SizeSelector({
    Key? key,
    required this.sizes,
    required this.selectedSize,
    required this.onSizeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children:
          sizes.map((size) {
            final bool isSelected = size == selectedSize;
            return GestureDetector(
              onTap: () => onSizeSelected(size),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: isSelected ? Colors.black : Colors.grey.shade200,
                  border: Border.all(
                    color: isSelected ? Colors.black : Colors.grey.shade400,
                  ),
                ),
                child: Text(
                  size,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }
}
