import 'package:flutter/material.dart';

class NSStyle {
  static TextStyle primaryTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    required String fontFamily,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
    );
  }

  static TextStyle h12Normal = primaryTextStyle(
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static TextStyle h12Medium = primaryTextStyle(
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static TextStyle h14Normal = primaryTextStyle(
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static TextStyle h14Medium = primaryTextStyle(
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static TextStyle h14SemiBold = primaryTextStyle(
    fontSize: 14,
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w600,
  );

  static TextStyle h16ExtraLight = primaryTextStyle(
    fontSize: 16,
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w200,
  );

  static TextStyle h16Normal = primaryTextStyle(
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static TextStyle h16Medium = primaryTextStyle(
    fontSize: 16,
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w500,
  );

  static TextStyle h16SemiBold = primaryTextStyle(
    fontSize: 16,
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w600,
  );

  static TextStyle h16Bold = primaryTextStyle(
    fontSize: 16,
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w700,
  );

  static TextStyle h18Semibold = primaryTextStyle(
    fontSize: 18,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  static TextStyle h20Medium = primaryTextStyle(
    fontSize: 20,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static TextStyle h21SemiBold = primaryTextStyle(
    fontSize: 21,
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w600,
  );

  static TextStyle h24Semibold = primaryTextStyle(
    fontSize: 24,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  static TextStyle h26Bold = primaryTextStyle(
    fontSize: 26,
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w700,
  );

  static TextStyle h32Bold = primaryTextStyle(
    fontSize: 32,
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w700,
  );

  static TextStyle h32Black = primaryTextStyle(
    fontSize: 32,
    fontFamily: 'Raleway-Black',
    fontWeight: FontWeight.w900,
  );

  static TextStyle h36Black = primaryTextStyle(
    fontSize: 36,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w900,
  );
}
