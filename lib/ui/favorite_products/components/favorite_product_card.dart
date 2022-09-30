import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_architecture/ui/styles/ui_helpers.dart';

class FavoriteProductCard extends StatelessWidget {
  const FavoriteProductCard({
    Key? key,
    required this.productDetails,
    required this.navigateToProductDetails,
  }) : super(key: key);

  final Product productDetails;
  final Function navigateToProductDetails;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateToProductDetails(productDetails: productDetails),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                height: 120,
                width: 120,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productDetails.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                verticalSpaceSmall,
                Text(
                  productDetails.brand,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                verticalSpaceRegular,
                Text(
                  '\$${productDetails.price}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_rounded,
                color: Colors.redAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
