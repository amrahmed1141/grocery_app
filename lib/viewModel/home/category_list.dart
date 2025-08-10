import 'package:eshop_app/viewModel/home/get_product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:eshop_app/models/home/category_model.dart';
import 'package:eshop_app/utils/constant.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: catgeories.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.all(6),
        itemBuilder: (context, index) {
          return Selector<CategoryConsumer, int>(
            selector: (_, provider) => provider.selectedIndex,
            builder: (context, selectedIndex, child) {
              return GestureDetector(
                onTap: () {
                  context.read<CategoryConsumer>().switchCategory(index);
                  final selectCategory = catgeories[index].name;
                  context
                      .read<GetProductViewModel>()
                      .getProductsByCatgeory(selectCategory);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Container(
                    height: 60,
                    width: 76,
                    margin: const EdgeInsets.all(5),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: selectedIndex == index
                            ? Colors.deepPurple
                            : const Color.fromARGB(155, 0, 187, 212),
                        strokeAlign: 1,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 7,
                        ),
                        Image.asset(
                          catgeories[index].image,
                          height: 30,
                          width: 30,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          catgeories[index].name,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: selectedIndex == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: selectedIndex == index
                                ? Colors.deepPurple
                                : Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CategoryConsumer extends ChangeNotifier {
  int selectedIndex = 0;

  void switchCategory(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
