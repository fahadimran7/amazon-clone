import 'package:flutter/material.dart';
import 'package:stacked_architecture/ui/shared/widgets/busy_button.dart';
import 'package:stacked_architecture/ui/styles/app_colors.dart';
import 'package:stacked_architecture/ui/styles/ui_helpers.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({
    Key? key,
    required this.form,
    this.validationMessage,
    required this.onMainButtonTapped,
    required this.mainButtonText,
    required this.title,
    required this.secondaryButtonText,
    this.onSignUpTapped,
    this.onLoginTapped,
    required this.isBusy,
  }) : super(key: key);
  final Widget form;
  final String? validationMessage;
  final void Function() onMainButtonTapped;
  final String mainButtonText;
  final String title;
  final String secondaryButtonText;
  final bool isBusy;
  final void Function()? onSignUpTapped;
  final void Function()? onLoginTapped;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpaceLarge,
        Text(
          title,
          style: const TextStyle(fontSize: 34, fontWeight: FontWeight.w500),
        ),
        verticalSpaceSmall,
        const Text(
          'Enter your email and password to create an account or login. Happy shopping :)',
          style: TextStyle(color: Colors.black54, height: 1.4, fontSize: 15),
        ),
        verticalSpaceMedium,
        verticalSpaceSmall,
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
        verticalSpaceRegular,
        BusyButton(
          onMainButtonTapped: onMainButtonTapped,
          mainButtonText: mainButtonText,
          busy: isBusy,
        ),
        verticalSpaceRegular,
        const Align(
          alignment: Alignment.center,
          child: Text(
            'OR',
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
        ),
        verticalSpaceRegular,
        GestureDetector(
          onTap: onSignUpTapped ?? onLoginTapped,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                secondaryButtonText,
                style: const TextStyle(fontSize: 15, color: Colors.black54),
              ),
              horizontalSpaceTiny,
              Text(
                onSignUpTapped != null ? 'Sign up now' : 'Login',
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.primaryBlack,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
