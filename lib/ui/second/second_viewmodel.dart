import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/app/app.router.dart';
import 'package:stacked_architecture/services/authentication_service.dart';
import 'package:stacked_services/stacked_services.dart';

class SecondViewModel extends BaseViewModel {
  final _authenticationService = locator<AuthenticationService>();
  final _navigationService = locator<NavigationService>();
  int count = 0;

  void doSomething() {
    count++;
    notifyListeners();
  }

  void signOut() async {
    setBusy(true);
    await _authenticationService.signOutUser();
    setBusy(false);
    _navigationService.replaceWith(Routes.loginView);
  }
}
