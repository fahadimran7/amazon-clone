import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.enableActions,
  }) : super(key: key);
  final bool enableActions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Image.asset(
            'assets/images/amazon_logo_text.png',
            width: 90,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: enableActions
            ? <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black,
                  ),
                )
              ]
            : [],
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 2,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
