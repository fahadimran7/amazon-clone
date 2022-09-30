import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/app/app.logger.dart';
import 'package:stacked_architecture/enums/basic_dialog_status.dart';
import 'package:stacked_architecture/enums/dialog_type.dart';
import 'package:stacked_architecture/services/user_service.dart';
import 'package:stacked_architecture/utils/input_validators.dart';
import 'package:stacked_services/stacked_services.dart';

class UserProfileViewModel extends FormViewModel {
  final log = getLogger('UserProfileViewModel');

  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _dialogService = locator<DialogService>();

  bool _buttonBusy = false;

  get buttonBusy => _buttonBusy;

  void setButtonBusy(bool value) {
    _buttonBusy = value;
    notifyListeners();
  }

  void navigateBack() => _navigationService.back();

  void updateProfile({required String userId, required String email}) async {
    if (!InputValidators.isValidFullName(formValueMap['fullName']) ||
        !InputValidators.isValidEmail(formValueMap['email'])) {
      setValidationMessage(
        'Invalid email address or full name. Please try again.',
      );

      notifyListeners();

      return;
    }

    setButtonBusy(true);
    log.v('formValueMap: $formValueMap');

    final response = await _userService.updateUserProfile(
      fullName: formValueMap['fullName'],
      email: formValueMap['email'],
      emailUpdated: formValueMap['email'] != email,
    );

    if (response is bool) {
      log.v('User profile updated successfully!');
      log.v(
        'The currentUser from the UserProfileViewModel is: ${_userService.currentUser}',
      );

      final dialogResult = await _dialogService.showCustomDialog(
        variant: DialogType.basic,
        data: BasicDialogStatus.success,
        title: 'Profile Updated',
        description:
            'Your profile information has been updated successfully in our records. You can continue using the app as before.',
        mainButtonTitle: 'Got it',
      );

      if (dialogResult!.confirmed) {
        _navigationService.back();
      }
    } else {
      log.e('Error updating user profile!');
      setValidationMessage(response);
      notifyListeners();
    }

    setButtonBusy(false);
  }

  @override
  void setFormStatus() {}
}
