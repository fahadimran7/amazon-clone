import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/app/app.router.dart';
import 'package:stacked_architecture/services/authentication_service.dart';
import 'package:stacked_architecture/services/user_service.dart';
import 'package:stacked_services/stacked_services.dart';

class CustomDrawerViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _authenticationService = locator<AuthenticationService>();

  void navigateToProfileView() {
    _navigationService.popRepeated(1);
    _navigationService.navigateTo(
      Routes.userProfileView,
      arguments: UserProfileViewArguments(
        userProfileDetails: _userService.currentUser!,
      ),
    );
  }

  void navigateToFavoriteProductsView() {
    _navigationService.popRepeated(1);
    _navigationService.navigateTo(
      Routes.favoriteProductsView,
      arguments: FavoriteProductsViewArguments(
        favoritesList: _userService.currentUser!.favorites!,
      ),
    );
  }

  void signOut() async {
    setBusy(true);
    final userLoggedOut = await _authenticationService.signOutUser();

    setBusy(false);

    if (userLoggedOut) {
      _navigationService.replaceWith(Routes.loginView);
    }
  }
}
