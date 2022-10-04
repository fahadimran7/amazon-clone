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
      test('When called should check if we have currentUser on UserService',
          () async {
        final userService = getAndRegisterUserService();
        final model = StartupViewModel();
        await model.runStartupLogic();
        verify(userService.currentUser);
      });

      test('When initialized should call loadUserFromDisk', () async {
        final userService = getAndRegisterUserService();
        final model = StartupViewModel();
        await model.runStartupLogic();
        verify(userService.loadUserFromDisk());
      });

      test('When there is no user token on disk, should navigate to loginView',
          () async {
        final navigationService = getAndRegisterNavigationService();
        final model = StartupViewModel();
        await model.runStartupLogic();
        verify(navigationService.replaceWith(Routes.loginView));
      });

      test(
          'When there is a user token on disk, should navigate to productsView',
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
