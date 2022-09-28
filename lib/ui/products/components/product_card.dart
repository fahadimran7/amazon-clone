import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked_architecture/ui/styles/ui_helpers.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    // required this.product,
  }) : super(key: key);

  // final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 6,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://unsplash.com/photos/LG88A2XgIXY/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8Nnx8c2hvZXN8ZW58MHx8fHwxNjY0MzM3OTA4&force=true&w=640',
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                    ),
                  ),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 180,
                ),
              ),
              verticalSpaceTiny,
              const Text(
                'Air Max Pro',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Nike',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black38,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '\$99.99',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_shopping_cart_sharp),
                      tooltip: 'Add product to cart',
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
