import 'package:eshop_app/viewModel/home/get_product_view_model.dart';
import 'package:eshop_app/views/home/widgets/most_popular_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MostPopularList extends StatelessWidget {
  const MostPopularList({
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
        return StreamBuilder(
            stream: productStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text('No popular products found'));
              }
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final ds = snapshot.data!.docs[index];
                    return MostPopularCard(
                        name: ds['name'],
                        imageUrl: ds['image'],
                        price: ds['price'],
                        onTap: () {});
                  });
            });
      },
    );
  }
}
