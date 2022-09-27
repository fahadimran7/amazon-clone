import 'package:flutter/material.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/app/app.logger.dart';
import 'package:stacked_architecture/app/app.router.dart';
import 'package:stacked_architecture/utils/input_validators.dart';
import 'package:stacked_architecture/services/authentication_service.dart';
import 'package:stacked_architecture/ui/base/auth_viewmodel.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends AuthViewModel {
  final log = getLogger('LoginViewModel');

  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();

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

    if (authResponse['success'] == true) {
      log.v('Logged in successfully');

      log.v(authResponse['msg']);
    } else {
      log.e(authResponse['error']);
      setValidationMessage(authResponse['error']);
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
