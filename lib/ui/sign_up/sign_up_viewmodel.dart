import 'package:flutter/material.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/app/app.logger.dart';
import 'package:stacked_architecture/app/app.router.dart';
import 'package:stacked_architecture/enums/basic_dialog_status.dart';
import 'package:stacked_architecture/enums/dialog_type.dart';
import 'package:stacked_architecture/utils/input_validators.dart';
import 'package:stacked_architecture/services/authentication_service.dart';
import 'package:stacked_architecture/ui/base/auth_viewmodel.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends AuthViewModel {
  final log = getLogger('SignUpViewModel');

  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();
  final _dialogService = locator<DialogService>();

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

    if (authResponse is bool) {
      // Display Dialog to show that account has been created and take user to login
      log.v('User account created successfully. Take them to login view.');

      final dialogResult = await _dialogService.showCustomDialog(
        variant: DialogType.basic,
        customData: BasicDialogStatus.success,
        title: 'Account Creation Success',
        description:
            'You\'re account has been created successfully. You can now login and start using the app.',
        mainButtonTitle: 'Take me to login',
      );

      if (dialogResult!.confirmed) {
        _navigationService.replaceWith(Routes.loginView);
      }
    } else {
      log.e(authResponse);
      setValidationMessage(authResponse);
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
