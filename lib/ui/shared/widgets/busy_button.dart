import 'package:flutter/material.dart';
import 'package:stacked_architecture/ui/styles/app_colors.dart';

class BusyButton extends StatelessWidget {
  const BusyButton({
    Key? key,
    required this.onMainButtonTapped,
    required this.mainButtonText,
    required this.busy,
  }) : super(key: key);

  final void Function() onMainButtonTapped;
  final String mainButtonText;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50), // NEW
      ),
      onPressed: onMainButtonTapped,
      child: busy
          ? const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                strokeWidth: 3.0,
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            )
          : Text(
              mainButtonText,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
    );
  }
}
