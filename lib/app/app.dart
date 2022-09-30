import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_architecture/services/authentication_service.dart';
import 'package:stacked_architecture/services/local_storage_service.dart';
import 'package:stacked_architecture/services/product_service.dart';
import 'package:stacked_architecture/services/user_service.dart';
import 'package:stacked_architecture/ui/favorite_products/favorite_products_view.dart';
import 'package:stacked_architecture/ui/login/login_view.dart';
import 'package:stacked_architecture/ui/product_details/product_details_view.dart';
import 'package:stacked_architecture/ui/products/products_view.dart';
import 'package:stacked_architecture/ui/sign_up/sign_up_view.dart';
import 'package:stacked_architecture/ui/startup/startup_view.dart';
import 'package:stacked_architecture/ui/user_profile/user_profile_view.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  CupertinoRoute(page: SignUpView),
  CupertinoRoute(page: LoginView),
  CupertinoRoute(page: ProductsView),
  CupertinoRoute(page: ProductDetailsView),
  CupertinoRoute(page: UserProfileView),
  CupertinoRoute(page: FavoriteProductsView),
  CupertinoRoute(page: StartupView, initial: true),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: AuthenticationService),
  LazySingleton(classType: LocalStorageService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: UserService),
  LazySingleton(classType: ProductService),
], logger: StackedLogger())
class AppSetup {}
