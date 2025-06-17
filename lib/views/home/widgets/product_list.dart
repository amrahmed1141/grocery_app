import 'package:flutter/material.dart';
import 'package:grocery_app/utils/constant.dart';
import 'package:grocery_app/views/details/details.dart';
import 'package:iconsax/iconsax.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailsPage()));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    height: 240,
                    width: 180,
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryColor, width: 1),
                        borderRadius: BorderRadius.circular(25),
                        gradient: const LinearGradient(
                            colors: [Colors.white, Color(0XffF7FFF7)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 2,
                              spreadRadius: 1,
                              offset: const Offset(0, 3))
                        ]),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(children: [
                            Center(
                              child: Image.asset(
                                'assets/grocery/banana.png',
                                height: 120,
                                width: 140,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              right: 10,
                              top: 5,
                              child: Material(
                                elevation: 4,
                                borderRadius: BorderRadius.circular(25),
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      border: Border.all(color:  Colors.grey.shade400),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: const Icon(
                                    Iconsax.heart,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                          const Spacer(),
                          const Text(
                            'Fresh Banana',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Row(
                            children: [
                              Text(
                                '1',
                                style: TextStyle(
                                    color: Color(0xff828282),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Kg',
                                style: TextStyle(
                                    color: Color(0xff828282),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "\$${5}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600),
                                ),
                                InkWell(
                                  child: Material(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(15),
                                    elevation: 4,
                                    child: Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: const Icon(
                                        Iconsax.shopping_bag,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailsPage()));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    height: 240,
                    width: 180,
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryColor, width: 1),
                        borderRadius: BorderRadius.circular(25),
                        gradient: const LinearGradient(
                            colors: [Colors.white, Color(0XffF7FFF7)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 2,
                              spreadRadius: 1,
                              offset: const Offset(0, 3))
                        ]),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(children: [
                            Center(
                              child: Image.asset(
                                'assets/grocery/banana.png',
                                height: 120,
                                width: 140,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              right: 10,
                              top: 5,
                              child: Material(
                                elevation: 4,
                                borderRadius: BorderRadius.circular(25),
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      border: Border.all(color:  Colors.grey.shade400),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: const Icon(
                                    Iconsax.heart,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                          const Spacer(),
                          const Text(
                            'Fresh Banana',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Row(
                            children: [
                              Text(
                                '1',
                                style: TextStyle(
                                    color: Color(0xff828282),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Kg',
                                style: TextStyle(
                                    color: Color(0xff828282),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "\$${5}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600),
                                ),
                                InkWell(
                                  child: Material(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(15),
                                    elevation: 4,
                                    child: Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: const Icon(
                                        Iconsax.shopping_bag,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailsPage()));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    height: 240,
                    width: 180,
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryColor, width: 1),
                        borderRadius: BorderRadius.circular(25),
                        gradient: const LinearGradient(
                            colors: [Colors.white, Color(0XffF7FFF7)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 2,
                              spreadRadius: 1,
                              offset: const Offset(0, 3))
                        ]),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(children: [
                            Center(
                              child: Image.asset(
                                'assets/grocery/banana.png',
                                height: 120,
                                width: 140,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              right: 10,
                              top: 5,
                              child: Material(
                                elevation: 4,
                                borderRadius: BorderRadius.circular(25),
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      border: Border.all(color:  Colors.grey.shade400),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: const Icon(
                                    Iconsax.heart,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                          const Spacer(),
                          const Text(
                            'Fresh Banana',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Row(
                            children: [
                              Text(
                                '1',
                                style: TextStyle(
                                    color: Color(0xff828282),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Kg',
                                style: TextStyle(
                                    color: Color(0xff828282),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "\$${5}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600),
                                ),
                                InkWell(
                                  child: Material(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(15),
                                    elevation: 4,
                                    child: Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: const Icon(
                                        Iconsax.shopping_bag,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ])),
    );
  }
}
