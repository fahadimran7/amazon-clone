import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stacked_architecture/app/app.logger.dart';
import 'package:stacked_architecture/constants/app_constants.dart';
import 'package:stacked_architecture/models/application_models.dart';

class ProductService {
  final log = getLogger('ProductService');

  Future<List<Product>?> getAllProducts() async {
    try {
      http.Response apiResponse = await http.get(
        Uri.parse(productsBaseUrl),
      );

      final products = jsonDecode(apiResponse.body);

      final productList = <Product>[];

      for (final product in products) {
        productList.add(Product.fromJson(product));
      }

      return productList;
    } catch (e) {
      log.e(e);

      return null;
    }
  }
}
