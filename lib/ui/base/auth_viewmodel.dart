import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/utils/input_validators.dart';

abstract class AuthViewModel extends FormViewModel {
  @override
  void setFormStatus() {}

  void saveData() {
    if (formValueMap.containsKey('fullName')) {
      _runValidations(validateName: true);
    } else {
      _runValidations(validateName: false);
    }
  }

  void _runValidations({bool validateName = false}) {
    if ((validateName
            ? !InputValidators.isValidFullName(formValueMap['fullName'])
            : false) ||
        !InputValidators.isValidEmail(formValueMap['email']) ||
        !InputValidators.isValidPassword(formValueMap['password'])) {
      setValidationMessage('Please check your input and try again.');
    }
    notifyListeners();
  }
}
