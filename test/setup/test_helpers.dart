import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_architecture/services/authentication_service.dart';
import 'package:stacked_architecture/services/local_storage_service.dart';
import 'package:stacked_architecture/services/user_service.dart';
import 'package:stacked_services/stacked_services.dart';

import 'test_helpers.mocks.dart';

@GenerateNiceMocks([
  MockSpec<UserService>(),
  MockSpec<NavigationService>(),
  MockSpec<AuthenticationService>(),
  MockSpec<LocalStorageService>(),
])
void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}

UserService getAndRegisterUserService({bool hasUserTokenOnDisk = false}) {
  _removeRegistrationIfExists<UserService>();
  final MockUserService service = MockUserService();
  when(service.currentUser).thenReturn(hasUserTokenOnDisk
      ? User(email: 'test@example.com', password: 'super-strong-password')
      : null);
  locator.registerSingleton<UserService>(service);
  return service;
}

NavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final MockNavigationService service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

AuthenticationService getAndRegisterAuthenticationService() {
  _removeRegistrationIfExists<AuthenticationService>();
  final MockAuthenticationService service = MockAuthenticationService();
  locator.registerSingleton<AuthenticationService>(service);
  return service;
}

LocalStorageService getAndRegisterLocalStorageService() {
  _removeRegistrationIfExists<LocalStorageService>();
  final MockLocalStorageService service = MockLocalStorageService();
  locator.registerSingleton<LocalStorageService>(service);
  return service;
}

void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterUserService();
  getAndRegisterAuthenticationService();
  getAndRegisterLocalStorageService();
}

void unRegisterServices() {
  locator.unregister<NavigationService>();
  locator.unregister<UserService>();
  locator.unregister<AuthenticationService>();
  locator.unregister<LocalStorageService>();
}
