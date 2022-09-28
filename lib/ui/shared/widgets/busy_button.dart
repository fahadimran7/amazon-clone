import 'package:flutter/material.dart';

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
        elevation: 0,
        minimumSize: const Size.fromHeight(50),
        shape: const StadiumBorder(),
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
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }
}
