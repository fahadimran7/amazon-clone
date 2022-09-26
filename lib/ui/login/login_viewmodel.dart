import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/app/app.router.dart';
import 'package:stacked_architecture/ui/base/auth_viewmodel.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends AuthViewModel {
  final _navigationService = locator<NavigationService>();

  void navigateToSignUp() {
    _clearValidationMessages();
    _navigationService.navigateTo(Routes.signUpView);
  }

  void _clearValidationMessages() {
    setValidationMessage(null);
    notifyListeners();
  }
}
