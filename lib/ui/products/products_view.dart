import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/ui/products/components/product_card.dart';
import 'package:stacked_architecture/ui/products/products_viewmodel.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ProductsViewModel(),
      builder: (context, model, child) => Scaffold(
        body: _buildGridView(),
      ),
    );
  }
}

_buildGridView() {
  return GridView.builder(
    padding: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 10,
    ),
    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 200,
      mainAxisExtent: 313,
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,
    ),
    itemCount: 10,
    itemBuilder: (BuildContext ctx, index) {
      return const ProductCard();
    },
  );
}
