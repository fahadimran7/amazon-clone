// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unused_import, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../models/application_models.dart';
import '../ui/favorite_products/favorite_products_view.dart';
import '../ui/login/login_view.dart';
import '../ui/product_details/product_details_view.dart';
import '../ui/products/products_view.dart';
import '../ui/sign_up/sign_up_view.dart';
import '../ui/startup/startup_view.dart';
import '../ui/user_profile/user_profile_view.dart';

class Routes {
  static const String signUpView = '/sign-up-view';
  static const String loginView = '/login-view';
  static const String productsView = '/products-view';
  static const String productDetailsView = '/product-details-view';
  static const String userProfileView = '/user-profile-view';
  static const String favoriteProductsView = '/favorite-products-view';
  static const String startupView = '/';
  static const all = <String>{
    signUpView,
    loginView,
    productsView,
    productDetailsView,
    userProfileView,
    favoriteProductsView,
    startupView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.productsView, page: ProductsView),
    RouteDef(Routes.productDetailsView, page: ProductDetailsView),
    RouteDef(Routes.userProfileView, page: UserProfileView),
    RouteDef(Routes.favoriteProductsView, page: FavoriteProductsView),
    RouteDef(Routes.startupView, page: StartupView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SignUpView: (data) {
      var args = data.getArgs<SignUpViewArguments>(
        orElse: () => SignUpViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => SignUpView(key: args.key),
        settings: data,
      );
    },
    LoginView: (data) {
      var args = data.getArgs<LoginViewArguments>(
        orElse: () => LoginViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => LoginView(key: args.key),
        settings: data,
      );
    },
    ProductsView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const ProductsView(),
        settings: data,
      );
    },
    ProductDetailsView: (data) {
      var args = data.getArgs<ProductDetailsViewArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => ProductDetailsView(
          key: args.key,
          productDetails: args.productDetails,
        ),
        settings: data,
      );
    },
    UserProfileView: (data) {
      var args = data.getArgs<UserProfileViewArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => UserProfileView(
          key: args.key,
          userProfileDetails: args.userProfileDetails,
        ),
        settings: data,
      );
    },
    FavoriteProductsView: (data) {
      var args = data.getArgs<FavoriteProductsViewArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => FavoriteProductsView(
          key: args.key,
          favoritesList: args.favoritesList,
        ),
        settings: data,
      );
    },
    StartupView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const StartupView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// SignUpView arguments holder class
class SignUpViewArguments {
  final Key? key;
  SignUpViewArguments({this.key});
}

/// LoginView arguments holder class
class LoginViewArguments {
  final Key? key;
  LoginViewArguments({this.key});
}

/// ProductDetailsView arguments holder class
class ProductDetailsViewArguments {
  final Key? key;
  final Product productDetails;
  ProductDetailsViewArguments({this.key, required this.productDetails});
}

/// UserProfileView arguments holder class
class UserProfileViewArguments {
  final Key? key;
  final User userProfileDetails;
  UserProfileViewArguments({this.key, required this.userProfileDetails});
}

/// FavoriteProductsView arguments holder class
class FavoriteProductsViewArguments {
  final Key? key;
  final List<Product> favoritesList;
  FavoriteProductsViewArguments({this.key, required this.favoritesList});
}

/// ************************************************************************
/// Extension for strongly typed navigation
/// *************************************************************************

extension NavigatorStateExtension on NavigationService {
  Future<dynamic> navigateToSignUpView({
    Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.signUpView,
      arguments: SignUpViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToLoginView({
    Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.loginView,
      arguments: LoginViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToProductsView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.productsView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToProductDetailsView({
    Key? key,
    required Product productDetails,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.productDetailsView,
      arguments:
          ProductDetailsViewArguments(key: key, productDetails: productDetails),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToUserProfileView({
    Key? key,
    required User userProfileDetails,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.userProfileView,
      arguments: UserProfileViewArguments(
          key: key, userProfileDetails: userProfileDetails),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToFavoriteProductsView({
    Key? key,
    required List<Product> favoritesList,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.favoriteProductsView,
      arguments:
          FavoriteProductsViewArguments(key: key, favoritesList: favoritesList),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToStartupView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.startupView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
