import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/viewModel/category_list.dart';
import 'package:grocery_app/utils/constant.dart';
import 'package:grocery_app/views/home/widgets/product_list.dart';
import 'package:grocery_app/views/home/widgets/search_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List sliderImages = [
    'assets/slider/Slider 1.png',
    'assets/slider/Slider 2.png',
    'assets/slider/Slider 3.png'
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CategoryConsumer(),
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              foregroundColor: secondryColor,
              backgroundColor: secondryColor,
              elevation: 0,
              scrolledUnderElevation: 0,
              surfaceTintColor: secondryColor,
              title: Row(children: [
                const Text(
                  'Hello,',
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Amr',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                SvgPicture.asset('assets/svg/Icons.svg'),
              ]),
            ),
            backgroundColor: secondryColor,
            body: Padding(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Column(children: [
                  const SizedBox(height: 10),
                  const MySearchBar(),
                  const SizedBox(
                    height: 10,
                  ),
                  CarouselSlider.builder(
                    itemCount: sliderImages.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Image.asset(sliderImages[itemIndex]),
                    options: CarouselOptions(
                      height: 222,
                      autoPlay: false,
                      enlargeCenterPage: true,
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Category',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'See All',
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CategoryList(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Products',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'See All',
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ProductsList(),
                ]),
              ),
            ),
          ),
        ));
  }
}

