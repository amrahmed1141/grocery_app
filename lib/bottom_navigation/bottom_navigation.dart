import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/utils/constant.dart';
import 'package:grocery_app/views/cart/cart.dart';
import 'package:grocery_app/views/favorite/favorites.dart';
import 'package:grocery_app/views/home/home.dart';
import 'package:grocery_app/views/profile/profile.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final _pageController = PageController(initialPage: 0);
  final _controller = NotchBottomBarController(index: 0);

  final List<Widget> _pages = [
    const HomeScreen(),
    const FavoriteScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondryColor,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        notchColor: primaryColor,
        kIconSize: 24,
        kBottomRadius: 28,
        bottomBarItems: const[
          BottomBarItem(
            inActiveItem: Icon(
              Iconsax.home,
              color:primaryColor,
            ),
            activeItem: Icon(
              Iconsax.home,
              color:secondryColor,
            ),
            itemLabel: 'Home',
          ),
           BottomBarItem(
            inActiveItem: Icon(
              Iconsax.heart,
              color: primaryColor,
            ),
            activeItem: Icon(
              Iconsax.heart,
              color: secondryColor,
            ),
            itemLabel: 'Favorites',
          ),
           BottomBarItem(
            inActiveItem: Icon(
              Iconsax.shopping_bag,
              color: primaryColor,
            ),
            activeItem: Icon(
              Iconsax.shopping_bag,
              color:secondryColor,
            ),
            itemLabel: 'Cart',
          ),
           BottomBarItem(
            inActiveItem: Icon(
                 Iconsax.user,
              color: primaryColor,
            ),
            activeItem: Icon(
              Iconsax.user,
              color:secondryColor,
            ),
            itemLabel: 'Profile',
          ),
        ],
      ),
    );
  }
}
