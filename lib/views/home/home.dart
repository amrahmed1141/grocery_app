import 'package:carousel_slider/carousel_slider.dart';
import 'package:eshop_app/utils/rating.dart';
import 'package:eshop_app/views/home/widgets/appbar_title.dart';
import 'package:eshop_app/views/home/widgets/home_header.dart';
import 'package:eshop_app/views/home/widgets/horizontal_product.dart';
import 'package:eshop_app/views/home/widgets/most_popular_list.dart';
import 'package:eshop_app/views/home/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eshop_app/viewModel/home/category_list.dart';
import 'package:eshop_app/utils/constant.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CategoryConsumer(),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: kBackgroundColor,
            body: const Padding(
              padding: EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HomeHeader(),
                  SizedBox( height: 10,),
                  CategoryList(),
                  SizedBox( height: 10, ),
                  SectionHeader(title: 'Products', actionText: ' See All'),
                  SizedBox( height: 10,),
                  HorizontalProductList(),
                  SizedBox( height: 20,),
                   SectionHeader(title: 'Most Popular', actionText: ' See All'),
                  MostPopularList()
                ]),
              ),
            ),
          ),
        ));
  }
}
