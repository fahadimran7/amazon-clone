import 'package:flutter/material.dart';
import 'package:stacked_architecture/constants/global_variables.dart';
import 'package:stacked_architecture/ui/styles/ui_helpers.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout(
      {Key? key,
      required this.form,
      this.validationMessage,
      required this.onMainButtonTapped,
      required this.mainButtonText,
      required this.title,
      required this.secondaryButtonText,
      this.onSignUpTapped,
      this.onLoginTapped})
      : super(key: key);
  final Widget form;
  final String? validationMessage;
  final void Function() onMainButtonTapped;
  final String mainButtonText;
  final String title;
  final String secondaryButtonText;
  final void Function()? onSignUpTapped;
  final void Function()? onLoginTapped;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpaceLarge,
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        verticalSpaceMedium,
        form,
        verticalSpaceMedium,
        Column(
          children: [
            if (validationMessage != null) ...[
              Text(
                validationMessage!,
                style: const TextStyle(color: Colors.red),
              ),
              verticalSpaceRegular
            ]
          ],
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50), // NEW
          ),
          onPressed: onMainButtonTapped,
          child: Text(mainButtonText),
        ),
        verticalSpaceRegular,
        const Text('OR'),
        verticalSpaceRegular,
        GestureDetector(
          onTap: onSignUpTapped ?? onLoginTapped,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(secondaryButtonText),
              horizontalSpaceTiny,
              Text(
                onSignUpTapped != null ? 'Sign up now' : 'Login',
                style: const TextStyle(
                  color: GlobalVariables.secondaryColor,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
