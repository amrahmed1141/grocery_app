import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // AppBar Section
        AppBar(
          backgroundColor: Colors.transparent, // Make appbar transparent
          elevation: 0, // Remove shadow
          automaticallyImplyLeading: false, // Don't show back button
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Day for shopping',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.apply(color: Colors.deepPurple),
              ),
              Text(
                'Amr Ahmed',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.apply(color: Colors.black, fontWeightDelta: 1),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Iconsax.shopping_bag),
              onPressed: () {
                // Handle shopping bag action
              },
            ),
          ],
        ),
        
        // Search Bar Section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search products...',
              hintStyle: const TextStyle(color: Colors.deepPurple),
              prefixIcon: const Icon(Iconsax.search_normal,color: Colors.deepPurple,),
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
            ),
          ),
        ),
      ],
    );
  }
}
