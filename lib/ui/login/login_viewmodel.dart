import 'package:flutter/material.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/app/app.logger.dart';
import 'package:stacked_architecture/app/app.router.dart';
import 'package:stacked_architecture/services/local_storage_service.dart';
import 'package:stacked_architecture/services/user_service.dart';
import 'package:stacked_architecture/utils/input_validators.dart';
import 'package:stacked_architecture/services/authentication_service.dart';
import 'package:stacked_architecture/ui/base/auth_viewmodel.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends AuthViewModel {
  final log = getLogger('LoginViewModel');

  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();
  final _localStorageService = locator<LocalStorageService>();
  final _userService = locator<UserService>();

  void navigateToSignUp() {
    _clearValidationMessages();
    _navigationService.navigateTo(Routes.signUpView);
  }

  void _clearValidationMessages() {
    setValidationMessage(null);
    notifyListeners();
  }

  @override
  void runAuthentication() async {
    setBusy(true);
    final authResponse = await _authenticationService.loginUser(
      email: formValueMap['email'],
      password: formValueMap['password'],
    );

    if (authResponse is bool) {
      log.v('Logged in successfully');

      // Save the token to shared prefs
      final tokenSaved = await _localStorageService.getValueFromStorage(
        key: 'x-auth-token',
      );

      log.v('token saved and read from loginViewModel: $tokenSaved');

      // Set _currentUser
      _userService.loadUserFromDisk();

      // Navigate to home view
      _navigationService.replaceWith(Routes.productsView);
    } else {
      log.e(authResponse);
      setValidationMessage(authResponse);
    }

    setBusy(false);
    notifyListeners();
  }

  @override
  void runValidations() {
    if (!InputValidators.isValidEmail(formValueMap['email']) ||
        !InputValidators.isValidPassword(formValueMap['password'])) {
      setIsValidForm(false);
    } else {
      setIsValidForm(true);
    }
  }

  void hideSoftKeyboard() => FocusManager.instance.primaryFocus?.unfocus();
}
