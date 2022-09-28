import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/app/app.logger.dart';
import 'package:stacked_architecture/app/app.router.dart';
import 'package:stacked_architecture/services/user_service.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';

class StartupViewModel extends BaseViewModel {
  final log = getLogger('StartupViewModel');
  final _userService = locator<UserService>();
  final _navigationService = locator<NavigationService>();

  Future<void> runStartupLogic() async {
    await _userService.loadUserFromDisk();

    if (_userService.currentUser != null) {
      log.v(
        'The current user has been loaded successfully: ${_userService.currentUser}',
      );

      // return _navigationService.replaceWith(Routes.productsView);
    }

    return _navigationService.replaceWith(Routes.loginView);
  }
}
