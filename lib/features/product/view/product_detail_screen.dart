import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:artifitia/general/core/utils/app_colors%20.dart';
import 'package:artifitia/features/product/data/product_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    late String selectedSize;
    @override
    void initState() {
      super.initState();
      selectedSize = widget.product.sizes.first;
    }

    CarouselSliderController controller = CarouselSliderController();
    int activeIndex = 0;
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: Text(
          widget.product.title,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select Size",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            SizeSelector(
              sizes: widget.product.sizes,
              selectedSize: selectedSize,
              onSizeSelected: (size) {
                setState(() {
                  selectedSize = size;
                });
              },
            ),

            Column(
              children: [
                CarouselSlider.builder(
                  carouselController: controller,
                  itemCount: 1,
                  options: CarouselOptions(
                    height: 189,
                    viewportFraction: 1.03,
                    autoPlay: widget.product.imageUrls.length > 1,
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlayAnimationDuration: const Duration(
                      milliseconds: 400,
                    ),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: false,
                    onPageChanged: (index, _) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                  ),
                  itemBuilder: (context, index, _) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              widget.product.imageUrls[index],
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                if (widget.product.imageUrls.length > 1)
                  Container(
                    margin: const EdgeInsets.only(bottom: 5, top: 10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 3,
                    ),
                    child: AnimatedSmoothIndicator(
                      activeIndex: activeIndex,
                      count: widget.product.imageUrls.length,
                      effect: CustomizableEffect(
                        spacing: 6.0,
                        activeDotDecoration: DotDecoration(
                          width: 9,
                          height: 9,
                          color: AppColors.pink,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        dotDecoration: DotDecoration(
                          width: 9,
                          height: 9,
                          color: AppColors.blackShade.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            Text(
              widget.product.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            Text(
              widget.product.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                "₹${widget.product.currentPrice}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  height: 1,
                ),
              ),
            ),

            /// Original Price + Discount
            if (widget.product.originalPrice != null &&
                widget.product.discount != null)
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Row(
                  children: [
                    Text(
                      "₹${widget.product.originalPrice}",
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 10,
                        color: AppColors.greyShade,
                        height: 1,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      widget.product.discount!,
                      style: TextStyle(color: AppColors.dicClr, fontSize: 10),
                    ),
                  ],
                ),
              ),

            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                children: [
                  AnimatedRatingStars(
                    initialRating: widget.product.rating!,
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
                  const SizedBox(width: 4),
                  if (widget.product.ratingCount != null)
                    Text(
                      "${widget.product.ratingCount}",
                      style: TextStyle(fontSize: 9, color: AppColors.greyShade),
                    ),
                ],
              ),
            ),

            // 🔹 Price & Discount
            Row(
              children: [
                Text(
                  "₹${widget.product.currentPrice ?? 'N/A'}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                if (widget.product.originalPrice != null)
                  Text(
                    "₹${widget.product.originalPrice}",
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                  ),
                const SizedBox(width: 8),
                if (widget.product.discount != null)
                  Text(
                    "${widget.product.discount} OFF",
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),

            // 🔹 Rating
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber.shade700, size: 18),
                const SizedBox(width: 4),
                Text(
                  "${widget.product.rating} (${widget.product.ratingCount ?? 0} reviews)",
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // 🔹 Description
            const Text(
              "Product Details",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              widget.product.description ?? 'No description available.',
              style: const TextStyle(height: 1.4),
            ),
            const SizedBox(height: 16),

            // 🔹 Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Add to cart logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                    ),
                    child: const Text("Go to Cart"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Buy now logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text("Buy Now"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 🔹 Delivery info (mocked for now)
            Row(
              children: const [
                Icon(Icons.delivery_dining, color: Colors.blue),
                SizedBox(width: 8),
                Text("Delivery in 1 hour"),
              ],
            ),
            const SizedBox(height: 20),

            // 🔹 Bottom Navigation Simulation
          ],
        ),
      ),
    );
  }
}
