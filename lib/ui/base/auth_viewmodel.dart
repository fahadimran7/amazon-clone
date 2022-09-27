import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/constants/input_validators.dart';

abstract class AuthViewModel extends FormViewModel {
  @override
  void setFormStatus() {}

  void saveData() {
    bool isValidForm;
    if (formValueMap.containsKey('fullName')) {
      isValidForm = _runValidations(validateName: true);
    } else {
      isValidForm = _runValidations(validateName: false);
    }

    if (!isValidForm) {
      setValidationMessage(
          'Invalid email address or password. Please check your input and try again.');
      notifyListeners();
    } else {
      runAuthentication();
    }
  }

  void runAuthentication() {}

  bool _runValidations({bool validateName = false}) {
    if ((validateName
            ? !InputValidators.isValidFullName(formValueMap['fullName'])
            : false) ||
        !InputValidators.isValidEmail(formValueMap['email']) ||
        !InputValidators.isValidPassword(formValueMap['password'])) {
      return false;
    }

    return true;
  }
}
