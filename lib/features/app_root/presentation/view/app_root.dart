import 'package:artifitia/features/product/data/product_model.dart';
import 'package:artifitia/features/product/view/product_detail_screen.dart';
import 'package:artifitia/features/profile/profile_screen.dart';
import 'package:artifitia/features/home/presentation/view/home_screen.dart';
import 'package:artifitia/features/wishlist/presentation/view/wishlist_screens.dart';
import 'package:flutter/material.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    WishListScreen(),
    HomeScreen(), // Center (Cart) Page
    ProfileDetailsScreen(), // Search (change as needed)
    ProductDetailPage(product: product[1]), // Settings
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_selectedIndex]),
      extendBody: true,
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 64,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, -1),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.home, 'Home', 0),
                _buildNavItem(Icons.favorite_border, 'Wishlist', 1),
                const SizedBox(width: 48), // Spacer for center FAB
                _buildNavItem(Icons.search, 'Search', 3),
                _buildNavItem(Icons.settings, 'Setting', 4),
              ],
            ),
          ),

          /// Center Cart Button
          Positioned(
            bottom: 18,
            child: FloatingActionButton(
              onPressed: () => _onItemTapped(2),
              backgroundColor: Colors.white,
              shape: const CircleBorder(),
              elevation: 6,
              child: Icon(Icons.shopping_cart_outlined, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 24,
            color: isSelected ? Colors.red : Colors.grey.shade600,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.red : Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
