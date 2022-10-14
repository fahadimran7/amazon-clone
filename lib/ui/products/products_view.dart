import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_architecture/ui/products/components/product_card.dart';
import 'package:stacked_architecture/ui/products/products_viewmodel.dart';
import 'package:stacked_architecture/ui/shared/layout/custom_app_bar.dart';
import 'package:stacked_architecture/ui/shared/layout/drawer/custom_drawer.dart';
import 'package:stacked_architecture/utils/no_glow_scroll.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductsViewModel>.reactive(
      viewModelBuilder: () => ProductsViewModel(),
      onModelReady: (model) => model.getAllProducts(),
      builder: (context, model, child) {
        return ScrollConfiguration(
          behavior: NoGlowBehavior(),
          child: Scaffold(
            appBar: const CustomAppBar(
              enableActions: true,
            ),
            body: model.isBusy
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: model.handleRefresh,
                    child: Column(
                      children: [
                        Expanded(
                          child: _buildGridView(
                            products: model.products,
                            model: model,
                          ),
                        )
                      ],
                    ),
                  ),
            drawer: const CustomDrawerView(),
          ),
        );
      },
    );
  }
}

_buildGridView(
    {required List<Product> products, required ProductsViewModel model}) {
  return GridView.builder(
    padding: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 10,
    ),
    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 200,
      mainAxisExtent: 316,
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,
    ),
    itemCount: products.length,
    itemBuilder: (BuildContext ctx, index) {
      return ProductCard(
        productDetails: products[index],
        navigateToProductDetails: model.navigateToProductDetails,
      );
    },
  );
}
