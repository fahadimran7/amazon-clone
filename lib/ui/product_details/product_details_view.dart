import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_architecture/ui/product_details/product_details_viewmodel.dart';
import 'package:stacked_architecture/ui/shared/widgets/busy_button.dart';
import 'package:stacked_architecture/ui/styles/app_colors.dart';
import 'package:stacked_architecture/ui/styles/ui_helpers.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({Key? key, required this.productDetails})
      : super(key: key);
  final Product productDetails;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductDetailsViewModel>.reactive(
      viewModelBuilder: () => ProductDetailsViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Padding(
          padding:
              const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: model.navigateBack,
                    child: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                  Image.asset(
                    'assets/images/amazon_logo_text.png',
                    width: 90,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.favorite_border_rounded),
                  )
                ],
              ),
              verticalSpaceMedium,
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: CachedNetworkImage(
                  imageUrl: productDetails.imageUrl,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                    ),
                  ),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 280,
                ),
              ),
              verticalSpaceRegular,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    productDetails.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    '\$${productDetails.price}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              verticalSpaceTiny,
              Text(
                productDetails.brand,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              verticalSpaceRegular,
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                decoration: BoxDecoration(
                  color: productDetails.inStock
                      ? AppColors.badgeBackgroundSuccess
                      : AppColors.badgeBackgroundDanger,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  productDetails.inStock ? 'IN STOCK' : 'SOLD OUT',
                  style: TextStyle(
                    fontSize: 12,
                    color: productDetails.inStock
                        ? AppColors.badgeTextSuccess
                        : AppColors.badgeTextDanger,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              verticalSpaceRegular,
              const Text(
                'Rating',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
              verticalSpaceTiny,
              _buildStars(productDetails.rating),
              verticalSpaceRegular,
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
              verticalSpaceSmall,
              Text(
                productDetails.description!,
                style: const TextStyle(color: Colors.black54, fontSize: 15),
              ),
              const Spacer(),
              BusyButton(
                onMainButtonTapped: () {},
                mainButtonText: 'Add to cart',
                busy: model.isBusy,
              )
            ],
          ),
        ),
      ),
    );
  }
}

_buildStars(rating) {
  List<Widget> listOfStars = [];

  final ratingList = List<int>.generate(rating, (i) => i + 1);

  for (int i = 1; i < 6; i++) {
    if (ratingList.contains(i)) {
      listOfStars.add(
        const Icon(
          Icons.star_rate_rounded,
          color: Colors.amber,
        ),
      );
    } else {
      listOfStars.add(
        const Icon(
          Icons.star_border_rounded,
          color: Colors.amber,
        ),
      );
    }
  }

  return Row(
    children: listOfStars,
  );
}
