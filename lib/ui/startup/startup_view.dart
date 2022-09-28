import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/ui/startup/startup_viewmodel.dart';
import 'package:stacked_architecture/ui/styles/app_colors.dart';
import 'package:stacked_architecture/ui/styles/ui_helpers.dart';

class StartupView extends StatelessWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      viewModelBuilder: () => StartupViewModel(),
      onModelReady: (model) => model.runStartupLogic(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Image.asset(
            'assets/images/amazon_logo.png',
            width: screenWidthPercentage(context, percentage: 0.6),
          ),
        ),
      ),
    );
  }
}
