import 'package:flutter/material.dart';

class PageTopBarSecondary extends StatelessWidget {
  const PageTopBarSecondary({Key? key, this.onBackPressed, required this.title})
      : super(key: key);
  final void Function()? onBackPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
              onPressed: onBackPressed,
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 18,
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const Spacer(
              flex: 3,
            )
          ],
        ),
      ],
    );
  }
}
