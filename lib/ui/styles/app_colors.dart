import 'package:flutter/material.dart';

class AppColors {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const MaterialColor primaryBlack = MaterialColor(
    _blackPrimaryValue,
    <int, Color>{
      50: Color(0xFF000000),
      100: Color(0xFF000000),
      200: Color(0xFF000000),
      300: Color(0xFF000000),
      400: Color(0xFF000000),
      500: Color(_blackPrimaryValue),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    },
  );
  static const int _blackPrimaryValue = 0xFF000000;

  static const MaterialColor primaryOrange = MaterialColor(
    _orangePrimaryValue,
    <int, Color>{
      50: Color(0xffffcc80),
      100: Color(0xffffc266),
      200: Color(0xffffb84d),
      300: Color(0xffffad33),
      400: Color(0xffffa31a),
      500: Color(_orangePrimaryValue),
      600: Color(0xffe68a00),
      700: Color(0xffcc7a00),
      800: Color(0xffb36b00),
      900: Color(0xff995c00),
    },
  );
  static const int _orangePrimaryValue = 0xffff9900;

  static const MaterialColor primaryGreen = MaterialColor(
    _greenPrimaryValue,
    <int, Color>{
      50: Color(0xFF91d2ae),
      100: Color(0xFF7ac89e),
      200: Color(0xFF64bf8e),
      300: Color(0xFF4eb67d),
      400: Color(0xFF38ad6d),
      500: Color(_greenPrimaryValue),
      600: Color(0xFF1f9454),
      700: Color(0xFF1b834a),
      800: Color(0xFF187341),
      900: Color(0xFF146238),
    },
  );
  static const int _greenPrimaryValue = 0xFF22A45D;

  static const secondaryColor = Colors.black;
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;
}
