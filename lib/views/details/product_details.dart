import 'package:flutter/material.dart';
import 'package:eshop_app/utils/constant.dart';
import 'package:eshop_app/views/details/widgets/items_details.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffF2F3F2),
                      borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.width * 0.8,
                  child: Image.asset(
                    'assets/grocery/banana.png',
                    width: MediaQuery.of(context).size.width * 0.6,
                    fit: BoxFit.contain,
                  ),
                ),
                SafeArea(
                    child: AppBar(
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new)),
                  actions: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Iconsax.heart))
                  ],
                )),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Organic Banana',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: const Color(0xffF2F3F2),
                              borderRadius: BorderRadius.circular(30)),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.remove,
                                color: primaryColor,
                              )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          '1',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: IconButton(
                              alignment: AlignmentDirectional.center,
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ReadMoreText(
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w400),
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                  colorClickableText: Colors.black.withOpacity(0.5),
                ),
                const SizedBox(
                  height: 20,
                ),
                const ItemDetails(),
                const SizedBox(
                  height: 100,
                ),
                MaterialButton(
                  onPressed: () {},
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  color: primaryColor,
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Iconsax.shopping_bag,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          'Add to cart',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            )
          ]),
        ),
      ),
    );
  }
}
