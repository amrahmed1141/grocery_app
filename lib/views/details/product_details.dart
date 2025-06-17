import 'package:flutter/material.dart';
import 'package:grocery_app/utils/constant.dart';
import 'package:iconsax/iconsax.dart';

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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  child: Image.asset('assets/grocery/banana.png',width:MediaQuery.of(context).size.width * 0.6,fit: BoxFit.contain,),
                ),
                SafeArea(
                    child: AppBar(
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back_ios_new)),
                  actions: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Iconsax.heart))
                  ],
                )),
              ],
            ),
          ]),
        
      ),
    );
  }
}
