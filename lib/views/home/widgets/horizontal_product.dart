import 'package:eshop_app/viewModel/home/get_product_view_model.dart';
import 'package:eshop_app/views/home/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HorizontalProductList extends StatelessWidget {
  const HorizontalProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Selector<GetProductViewModel, Stream?>(
        selector: (context, vm) => vm.productStream,
        builder: (context, productStream, _) {
          if (productStream == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return SizedBox(
            height: 250,
            child: StreamBuilder(
                stream: productStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('No products found'));
                  }
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final ds = snapshot.data!.docs[index];
                        return ProductCard(
                            name: ds['name'],
                            image: ds['image'],
                            price: ds['price'],
                            onTap: () {});
                      });
                }),
          );
        });
  }
}
