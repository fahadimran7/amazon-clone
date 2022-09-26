import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void doSomething() {
    _navigationService.navigateTo(Routes.secondView);
  }
}
