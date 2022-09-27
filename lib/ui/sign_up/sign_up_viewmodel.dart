import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/app/app.logger.dart';
import 'package:stacked_architecture/services/authentication_service.dart';
import 'package:stacked_architecture/ui/base/auth_viewmodel.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends AuthViewModel {
  final log = getLogger('SignUpViewModel');

  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();

  void navigateToLogin() => _navigationService.back();

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
    } else {
      log.e(authResponse['error']);
      setValidationMessage(authResponse['error']);
    }

    setBusy(false);
    notifyListeners();
  }
}
