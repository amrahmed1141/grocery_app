import 'package:flutter/material.dart';
import 'package:grocery_app/models/category_model.dart';
import 'package:grocery_app/utils/constant.dart';
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
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(6),
        itemBuilder: (context, index) {
          return Selector<CategoryConsumer, int>(
            selector: (_, provider) => provider.selectedIndex,
            builder: (context, selectedIndex, child) {
              return GestureDetector(
                onTap: () {
                  context.read<CategoryConsumer>().switchCategory(index);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(6),
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color:
                                selectedIndex == index ? primaryColor : Colors.grey,
                            strokeAlign: 1,
                            width: 2,
                          ),
                        ),
                        child: Image.asset(
                              catgeories[index].image,
                              height: 50,
                              width: 50,
                            ),
                             ),
                            Text(
                              catgeories[index].name,
                              style: TextStyle(
                                color: selectedIndex == index
                                    ? primaryColor
                                    : Colors.black,
                              ),
                            )
                          
                     
                    ],
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
