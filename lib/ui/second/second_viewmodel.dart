import 'package:stacked/stacked.dart';

class SecondViewModel extends BaseViewModel {
  int count = 0;

  void doSomething() {
    count++;
    notifyListeners();
  }
}
