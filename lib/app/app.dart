import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_architecture/ui/second/second_view.dart';
import 'package:stacked_architecture/ui/startup/startup_view.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: StartupView, initial: true),
  CupertinoRoute(page: SecondView),
], dependencies: [
  LazySingleton(classType: NavigationService)
])
class AppSetup {}
