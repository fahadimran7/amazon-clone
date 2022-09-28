import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/ui/second/second_viewmodel.dart';
import 'package:stacked_architecture/ui/shared/widgets/busy_button.dart';

class SecondView extends StatelessWidget {
  const SecondView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SecondViewModel>.reactive(
      viewModelBuilder: () => SecondViewModel(),
      builder: (context, model, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: model.doSomething,
        ),
        body: Center(
          child: BusyButton(
            onMainButtonTapped: model.signOut,
            mainButtonText: 'Log out',
            busy: model.isBusy,
          ),
        ),
      ),
    );
  }
}
