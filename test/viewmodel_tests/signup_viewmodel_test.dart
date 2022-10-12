import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/app/app.router.dart';
import 'package:stacked_architecture/enums/basic_dialog_status.dart';
import 'package:stacked_architecture/enums/dialog_type.dart';
import 'package:stacked_architecture/ui/sign_up/sign_up_viewmodel.dart';
import '../setup/test_helpers.dart';

void main() {
  group('SignUpViewModelTest', () {
    setUp(() => registerServices());
    tearDown(() => unRegisterServices());

    group('navigateToLogin', () {
      test('should navigate to loginView', () {
        final navigationService = getAndRegisterNavigationService();
        final model = SignUpViewModel();
        model.navigateToLogin();
        verify(navigationService.back());
      });
    });

    group('runAuthenticationLogic', () {
      test(
          'should call createUserWithEmailAndPassword on the authenticationService.',
          () async {
        final authenticationService = getAndRegisterAuthenticationService();
        final model = SignUpViewModel();

        model.formValueMap['fullName'] = 'Test Account';
        model.formValueMap['email'] = 'test@example.com';
        model.formValueMap['password'] = '123456';

        await model.runAuthentication();
        verify(
          await authenticationService.createUserWithEmailAndPassword(
            fullName: 'Test Account',
            email: 'test@example.com',
            password: '123456',
          ),
        );
      });

      test(
          'should call showCustomDialog on the dialogService when account created.',
          () async {
        getAndRegisterAuthenticationService();
        final dialogService = getAndRegisterDialogService();
        final model = SignUpViewModel();

        model.formValueMap['fullName'] = 'Test Account';
        model.formValueMap['email'] = 'test@example.com';
        model.formValueMap['password'] = '123456';

        await model.runAuthentication();
        verify(await dialogService.showCustomDialog(
          variant: DialogType.basic,
          data: BasicDialogStatus.success,
          title: 'Account Created',
          description:
              'You\'re account has been created successfully. You can now login and start using the app.',
          mainButtonTitle: 'Login Now',
        ));
      });
    });
  });
}
