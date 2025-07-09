import 'package:artifitia/general/core/utils/app_images.dart';

class CategoryItem {
  String? id;
  final String name;
  final String image;
  final DateTime createdAt;

  CategoryItem({
    this.id,
    required this.name,
    required this.image,
    required this.createdAt,
  });
}

List<CategoryItem> category = [
  CategoryItem(
    id: "456",
    name: "mens",
    image: AppImages.mens,
    createdAt: DateTime.now(),
  ),
  CategoryItem(
    id: "456",
    name: "womens",
    image: AppImages.womens,
    createdAt: DateTime.now(),
  ),
  CategoryItem(
    id: "456",
    name: "fashion",
    image: AppImages.fashion,
    createdAt: DateTime.now(),
  ),
  CategoryItem(
    id: "456",
    name: "kids",
    image: AppImages.kids,
    createdAt: DateTime.now(),
  ),
  CategoryItem(
    id: "456",
    name: "shoes",
    image: AppImages.fashion,
    createdAt: DateTime.now(),
  ),
];
