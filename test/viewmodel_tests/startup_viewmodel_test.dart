import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_architecture/app/app.router.dart';
import 'package:stacked_architecture/ui/startup/startup_viewmodel.dart';

import '../setup/test_helpers.dart';

void main() {
  group('StartupViewModelTest - ', () {
    setUp(() => registerServices());
    tearDown(() => unRegisterServices());

    group('runStartupLogic', () {
      test(
          'Given a void function runStartupLogic, when called, then check if we have currentUser on UserService.',
          () async {
        final userService = getAndRegisterUserService();
        final model = StartupViewModel();
        await model.runStartupLogic();
        verify(userService.currentUser);
      });

      test(
          'Given a void function runStartupLogic, when called, then call loadUserFromDisk.',
          () async {
        final userService = getAndRegisterUserService();
        final model = StartupViewModel();
        await model.runStartupLogic();
        verify(userService.loadUserFromDisk());
      });

      test(
          'Given a void function runStartupLogic, when called, then should navigate to loginView if no user session on disk.',
          () async {
        final navigationService = getAndRegisterNavigationService();
        final model = StartupViewModel();
        await model.runStartupLogic();
        verify(navigationService.replaceWith(Routes.loginView));
      });

      test(
          'Given a void function runStartupLogic, when called, should navigate to productsView if there is a user session on disk.',
          () async {
        getAndRegisterUserService(hasUserTokenOnDisk: true);
        final navigationService = getAndRegisterNavigationService();
        final model = StartupViewModel();
        await model.runStartupLogic();
        verify(navigationService.replaceWith(Routes.productsView));
      });
    });
  });
}
