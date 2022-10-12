import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_architecture/ui/favorite_products/components/favorite_product_card.dart';
import 'package:stacked_architecture/ui/favorite_products/favorite_products_viewmodel.dart';
import 'package:stacked_architecture/ui/shared/layout/app_top_bar_secondary.dart';
import 'package:stacked_architecture/ui/styles/ui_helpers.dart';
import 'package:stacked_architecture/utils/no_glow_scroll.dart';

class FavoriteProductsView extends StatelessWidget {
  const FavoriteProductsView({Key? key, required this.favoritesList})
      : super(key: key);
  final List<Product> favoritesList;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FavoriteProductsViewModel>.reactive(
      viewModelBuilder: () => FavoriteProductsViewModel(),
      builder: (context, model, child) => ScrollConfiguration(
        behavior: NoGlowBehavior(),
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Column(
                children: [
                  PageTopBarSecondary(
                    title: 'Favorites',
                    onBackPressed: model.navigateBack,
                  ),
                  verticalSpaceSmall,
                  model.isBusy
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : favoritesList.isNotEmpty
                          ? Expanded(
                              child: ListView.builder(
                                itemCount: favoritesList.length,
                                itemBuilder: (context, index) {
                                  return FavoriteProductCard(
                                    productDetails: favoritesList[index],
                                    navigateToProductDetails:
                                        model.navigateToProductDetails,
                                  );
                                },
                              ),
                            )
                          : const Expanded(
                              child: Center(
                                child: Text('No favorite products to show :('),
                              ),
                            )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
