import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_architecture/app/app.router.dart';
import 'package:stacked_architecture/ui/login/login_viewmodel.dart';

import '../setup/test_helpers.dart';

class MockLoginViewModel extends Mock implements LoginViewModel {}

void main() {
  group('LoginViewModelTest', () {
    setUp(() => registerServices());
    tearDown(() => unRegisterServices());

    group('navigateToSignUp', () {
      test(
          'Given the function navigateToSignUp, when called, then call notifyListeners to rebuild the UI',
          () {
        bool called = false;
        final model = LoginViewModel();
        model.addListener(() {
          called = true;
        });
        model.navigateToSignUp();
        expect(called, true);
      });
      test(
          'Given the function navigateToSignUp, when called, then navigate to signUpView',
          () {
        final navigationService = getAndRegisterNavigationService();
        final model = LoginViewModel();
        model.navigateToSignUp();
        verify(navigationService.navigateTo(Routes.signUpView));
      });
    });

    group('runAuthenticationLogic', () {
      test(
          'Given the function runAuthentication, when called, then call loginUser on the authenticationService.',
          () async {
        final authenticationService = getAndRegisterAuthenticationService();
        final model = LoginViewModel();

        model.formValueMap['email'] = 'test@example.com';
        model.formValueMap['password'] = '123456';

        model.runAuthentication();
        verify(
          await authenticationService.loginUser(
            email: 'test@example.com',
            password: '123456',
          ),
        );
      });

      test(
          'Given the function loginUser, when returns a boolean, then call getValueFromStorage on the localStorageService.',
          () async {
        final authenticationService = getAndRegisterAuthenticationService();
        final localStorageService = getAndRegisterLocalStorageService();

        final model = LoginViewModel();

        model.formValueMap['email'] = 'test@example.com';
        model.formValueMap['password'] = '123456';

        when(await authenticationService.loginUser(
                email: 'test@example.com', password: '123456'))
            .thenAnswer(
          (realInvocation) => Future.value(true),
        );

        await model.runAuthentication();

        verify(
          await localStorageService.getValueFromStorage(key: 'x-auth-token'),
        );
      });

      test(
          'Given the function loginUser, when returns a non-boolean result, then should not navigate to productsView',
          () async {
        final authenticationService = getAndRegisterAuthenticationService();
        final navigationService = getAndRegisterNavigationService();

        final model = LoginViewModel();
        final mockModel = MockLoginViewModel();

        model.formValueMap['email'] = 'test@example.com';
        model.formValueMap['password'] = '123456';

        when(await authenticationService.loginUser(
                email: 'test@example.com', password: '123456'))
            .thenAnswer(
          (realInvocation) => Future.value('Error'),
        );

        await model.runAuthentication();

        verifyNever(navigationService.replaceWith(Routes.productsView));
      });

      test(
          'Given the function getValueFromStorage, when returns a user token, then call loadUserFromDisk on the userService.',
          () async {
        final authenticationService = getAndRegisterAuthenticationService();
        final localStorageService = getAndRegisterLocalStorageService();
        final userService = getAndRegisterUserService();

        final model = LoginViewModel();

        model.formValueMap['email'] = 'test@example.com';
        model.formValueMap['password'] = '123456';

        when(await authenticationService.loginUser(
                email: 'test@example.com', password: '123456'))
            .thenAnswer(
          (realInvocation) => Future.value(true),
        );

        when(localStorageService.getValueFromStorage(key: 'x-auth-token'))
            .thenAnswer(
          (realInvocation) => Future.value('saved'),
        );

        await model.runAuthentication();

        verify(
          await userService.loadUserFromDisk(),
        );
      });

      test(
          'Given the function loadUserFromDisk, when called and returns without exception, then navigate to productsView.',
          () async {
        final authenticationService = getAndRegisterAuthenticationService();
        final localStorageService = getAndRegisterLocalStorageService();
        final userService = getAndRegisterUserService();
        final navigationService = getAndRegisterNavigationService();

        final model = LoginViewModel();

        model.formValueMap['email'] = 'test@example.com';
        model.formValueMap['password'] = '123456';

        when(await authenticationService.loginUser(
                email: 'test@example.com', password: '123456'))
            .thenAnswer(
          (realInvocation) => Future.value(true),
        );

        when(localStorageService.getValueFromStorage(key: 'x-auth-token'))
            .thenAnswer(
          (realInvocation) => Future.value('saved'),
        );

        when(await userService.loadUserFromDisk()).thenAnswer(
          (realInvocation) => Future.value(),
        );

        await model.runAuthentication();

        verify(navigationService.replaceWith(Routes.productsView));
      });
    });
  });
}
