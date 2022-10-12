import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_architecture/app/app.router.dart';
import 'package:stacked_architecture/ui/login/login_viewmodel.dart';
import '../setup/test_helpers.dart';

void main() {
  group('LoginViewModelTest', () {
    setUp(() => registerServices());
    tearDown(() => unRegisterServices());

    group('navigateToSignUp', () {
      test('should call notifyListeners to rebuild the UI', () {
        bool called = false;
        final model = LoginViewModel();
        model.addListener(() {
          called = true;
        });
        model.navigateToSignUp();
        expect(called, true);
      });

      test('should navigate to signUpView', () {
        final navigationService = getAndRegisterNavigationService();
        final model = LoginViewModel();
        model.navigateToSignUp();
        verify(navigationService.navigateTo(Routes.signUpView));
      });
    });

    group('runAuthenticationLogic', () {
      test('should call loginUser on the authenticationService.', () async {
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
          'should call getValueFromStorage on the localStorageService when user is logged in',
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

      test('should not navigate to productsView when user is not logged in',
          () async {
        final authenticationService = getAndRegisterAuthenticationService();
        final navigationService = getAndRegisterNavigationService();

        final model = LoginViewModel();

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
          'should call loadUserFromDisk on the userService when getValueFromStorage returns a user token',
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

      test('should navigate to productsView when user loaded from disk',
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
