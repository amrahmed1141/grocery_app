import 'package:flutter/material.dart';
import 'package:grocery_app/utils/constant.dart';
import 'package:iconsax/iconsax.dart';

class ProductListContainer extends StatefulWidget {
  const ProductListContainer({super.key});

  @override
  State<ProductListContainer> createState() => _ProductListContainerState();
}

class _ProductListContainerState extends State<ProductListContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: secondryColor,
          border: Border.all(
            color: primaryColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Column(children: [
        Image.asset(
          'assets/grocery/lemon.png',
          fit: BoxFit.cover,
        ),
        const Spacer(),
        const Text(
          'Lemon',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
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
        Row(
          children: [
            const Text(
              "\$${5}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: const Icon(Iconsax.shopping_bag,color: Colors.white,)
              ),
            ),
          ],
        )
      ]),
    );
  }
}
