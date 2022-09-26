import 'package:flutter/material.dart';

class BusyButton extends StatelessWidget {
  const BusyButton({
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
        minimumSize: const Size.fromHeight(50), // NEW
      ),
      onPressed: onMainButtonTapped,
      child: Text(mainButtonText),
    );
  }
}
