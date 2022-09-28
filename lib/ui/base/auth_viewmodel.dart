import 'package:stacked/stacked.dart';

abstract class AuthViewModel extends FormViewModel {
  bool _isValidForm = false;

  setIsValidForm(bool value) {
    _isValidForm = value;
    notifyListeners();
  }

  @override
  void setFormStatus() {}

  void saveData() {
    runValidations();

    if (!_isValidForm) {
      setValidationMessage(
          'Invalid email address or password. Please try again.');
      notifyListeners();
    } else {
      runAuthentication();
    }
  }

  // To be overriden in sign up and login view models
  void runAuthentication() {}

  void runValidations() {}
}
