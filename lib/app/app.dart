import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_architecture/ui/login/login_view.dart';
import 'package:stacked_architecture/ui/second/second_view.dart';
import 'package:stacked_architecture/ui/sign_up/sign_up_view.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  CupertinoRoute(page: SignUpView),
  CupertinoRoute(page: LoginView, initial: true),
  CupertinoRoute(page: SecondView),
], dependencies: [
  LazySingleton(classType: NavigationService)
])
class AppSetup {}
