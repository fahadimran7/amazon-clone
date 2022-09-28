import 'package:flutter/material.dart';
import 'package:stacked_architecture/ui/styles/app_colors.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    Key? key,
    required this.onMainButtonTapped,
    required this.mainButtonText,
  }) : super(key: key);

  final void Function() onMainButtonTapped;
  final String mainButtonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        onPrimary: AppColors.primaryOrange,
        primary: const Color(0xFFFFF6E9),
        minimumSize: const Size.fromHeight(50),
        shape: const StadiumBorder(),
        elevation: 0,
      ),
      onPressed: onMainButtonTapped,
      child: Text(
        mainButtonText,
        style: const TextStyle(
          fontSize: 14,
          color: AppColors.primaryOrange,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
