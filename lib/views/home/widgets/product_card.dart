import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String image;
  final String price;
  final List<Color> colorVariants; // Add color options
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.onTap,
    this.colorVariants = const [
      Colors.black,
      Colors.blue,
      Colors.red
    ], // Default colors
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: [
            // Main Card
            Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              margin: const EdgeInsets.only(left: 10, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image with Stacked Cart Button
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        child: Image.network(
                          image,
                          fit: BoxFit.cover,
                          width: 155,
                          height: 140,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: FloatingActionButton.small(
                          heroTag: null,
                          backgroundColor: Colors.deepPurple.withOpacity(0.9),
                          elevation: 1,
                          onPressed: () {},
                          child: const Icon(
                            Iconsax.shopping_bag,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Product Info
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          maxLines: 2,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 6),

                        // Color Variants
                        Row(
                          children: colorVariants
                              .map((color) => Container(
                                    margin: const EdgeInsets.only(right: 6),
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: color,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                        width: 1,
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),

                        const SizedBox(height: 8),

                        // Price + Rating Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "€$price", // Simply prepend €
                              style: const TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.deepPurple.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.amber, size: 14),
                                  SizedBox(width: 2),
                                  Text(
                                    "4.5",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Discount Badge (Optional)
            Positioned(
              top: 15,
              left: 15,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  "-20%",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
