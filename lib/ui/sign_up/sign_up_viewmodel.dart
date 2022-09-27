import 'package:flutter/material.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/app/app.logger.dart';
import 'package:stacked_architecture/utils/input_validators.dart';
import 'package:stacked_architecture/services/authentication_service.dart';
import 'package:stacked_architecture/ui/base/auth_viewmodel.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends AuthViewModel {
  final log = getLogger('SignUpViewModel');

  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();

  void navigateToLogin() => _navigationService.back();

  void hideSoftKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

  @override
  void runAuthentication() async {
    setBusy(true);
    final authResponse =
        await _authenticationService.createUserWithEmailAndPassword(
      fullName: formValueMap['fullName'],
      email: formValueMap['email'],
      password: formValueMap['password'],
    );

    if (authResponse['success'] == true) {
      log.v(
          'Account created successfully. User set ${_authenticationService.currentUser}');

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
    if (!InputValidators.isValidFullName(formValueMap['fullName']) ||
        !InputValidators.isValidEmail(formValueMap['email']) ||
        !InputValidators.isValidPassword(formValueMap['password'])) {
      setIsValidForm(false);
    } else {
      setIsValidForm(true);
    }
  }
}
