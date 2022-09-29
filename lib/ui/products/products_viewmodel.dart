import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/app/app.router.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_architecture/services/authentication_service.dart';
import 'package:stacked_architecture/services/product_service.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductsViewModel extends BaseViewModel {
  final _productService = locator<ProductService>();
  final _authenticationService = locator<AuthenticationService>();
  final _navigationService = locator<NavigationService>();
  List<Product> _products = [];

  get products => _products;

  Future<void> getAllProducts() async {
    setBusy(true);
    final products = await _productService.getAllProducts();

    if (products != null) {
      _products = products;
    }

    setBusy(false);
  }

  Future<void> signOut() async {
    final bool loggedOut = await _authenticationService.signOutUser();

    if (loggedOut) {
      _navigationService.replaceWith(Routes.loginView);
    }
  }

  void navigateToProductDetails({required Product productDetails}) {
    _navigationService.navigateTo(
      Routes.productDetailsView,
      arguments: ProductDetailsViewArguments(productDetails: productDetails),
    );
  }

  Future<void> handleRefresh() async {
    await getAllProducts();
  }
}
