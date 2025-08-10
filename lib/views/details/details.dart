import 'package:flutter/material.dart';
import 'package:eshop_app/utils/constant.dart';
import 'package:eshop_app/utils/rating.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondryColor,
      appBar: AppBar(
        backgroundColor: secondryColor,
        iconTheme: const IconThemeData(color: primaryColor),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Iconsax.heart),
          )
        ],
      ),
      body: Column(children: [
        SizedBox(
          height: 280,
          child: Stack(
            children: [
              Container(
                height: 200,
                color: secondryColor,
              ),
              Positioned(
                  left: 0,
                  bottom: 0,
                  right: 0,
                  top: 0,
                  child: Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/grocery/banana.png',
                      height: 220,
                      width: double.maxFinite,
                      fit: BoxFit.contain,
                    ),
                  )),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
            decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Banana',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.remove)),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        '1',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.add)),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Text(
                    '\$',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '12/kg',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ReadMoreText(
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w500),
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                colorClickableText: Colors.white.withOpacity(0.5),
              ),
              const SizedBox(height: 20,),
              const Rating(),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () {},
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                        color: Colors.white,
                    child:const Padding(
                      padding: EdgeInsets.all(15),
                      child:  Row(
                        children: [
                          Icon(Iconsax.money,color: primaryColor,),
                          SizedBox(width: 3,),
                          Text(
                            'Buy Now',
                            style: TextStyle(color: primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                        color: Colors.white,
                    child:const Padding(
                      padding: EdgeInsets.all(15),
                      child:  Row(
                        children: [
                          Icon(Iconsax.shopping_bag,color: primaryColor,),
                           SizedBox(width: 3,),
                          Text(
                            'Add to cart',
                            style: TextStyle(color: primaryColor),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ]),
          ),
        )
      ]),
    );
  }
}
