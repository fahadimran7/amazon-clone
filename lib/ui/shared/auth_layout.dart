import 'package:flutter/material.dart';
import 'package:stacked_architecture/ui/shared/widgets/busy_button.dart';
import 'package:stacked_architecture/ui/shared/widgets/secondary_button.dart';
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
    required this.showTermsText,
  }) : super(key: key);
  final Widget form;
  final String? validationMessage;
  final void Function() onMainButtonTapped;
  final String mainButtonText;
  final String title;
  final String secondaryButtonText;
  final bool isBusy;
  final bool showTermsText;
  final void Function()? onSignUpTapped;
  final void Function()? onLoginTapped;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        verticalSpaceMedium,
        verticalSpaceSmall,
        Image.asset(
          'assets/images/amazon_logo_text.png',
          width: screenWidthPercentage(context, percentage: 0.25),
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
            ]
          ],
        ),
        verticalSpaceRegular,
        BusyButton(
          onMainButtonTapped: onMainButtonTapped,
          mainButtonText: mainButtonText,
          busy: isBusy,
        ),
        verticalSpaceSmall,
        Column(
          children: [
            if (showTermsText) ...[
              verticalSpaceMedium,
              const Text(
                'By continuing, you agree to Amazon\'s Conditions of Use and Privacy Notice.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w500, height: 1.5),
              ),
            ]
          ],
        ),
        verticalSpaceRegular,
        const Divider(),
        verticalSpaceRegular,
        Text(
          secondaryButtonText,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black38,
          ),
        ),
        verticalSpaceMedium,
        SecondaryButton(
          onMainButtonTapped: onLoginTapped ?? onSignUpTapped!,
          mainButtonText: onSignUpTapped != null ? 'Create Account' : 'Login',
        ),
      ],
    );
  }
}
