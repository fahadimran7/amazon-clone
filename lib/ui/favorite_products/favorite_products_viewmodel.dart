import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/app/app.router.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_services/stacked_services.dart';

class FavoriteProductsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void navigateBack() => _navigationService.back();

  void navigateToProductDetails({required Product productDetails}) {
    _navigationService.navigateTo(
      Routes.productDetailsView,
      arguments: ProductDetailsViewArguments(productDetails: productDetails),
    );
  }
}
