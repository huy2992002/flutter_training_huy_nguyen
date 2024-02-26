import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/gen/fonts.gen.dart';

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
    fontFamily: FontFamily.poppins,
    fontWeight: FontWeight.w400,
  );

  static TextStyle h12Medium = primaryTextStyle(
    fontSize: 12,
    fontFamily: FontFamily.poppins,
    fontWeight: FontWeight.w500,
  );

  static TextStyle h14Normal = primaryTextStyle(
    fontSize: 14,
    fontFamily: FontFamily.poppins,
    fontWeight: FontWeight.w400,
  );

  static TextStyle h14Medium = primaryTextStyle(
    fontSize: 14,
    fontFamily: FontFamily.poppins,
    fontWeight: FontWeight.w500,
  );

  static TextStyle h14SemiBold = primaryTextStyle(
    fontSize: 14,
    fontFamily: FontFamily.raleway,
    fontWeight: FontWeight.w600,
  );

  static TextStyle h16ExtraLight = primaryTextStyle(
    fontSize: 16,
    fontFamily: FontFamily.raleway,
    fontWeight: FontWeight.w200,
  );

  static TextStyle h16Normal = primaryTextStyle(
    fontSize: 16,
    fontFamily: FontFamily.poppins,
    fontWeight: FontWeight.w400,
  );

  static TextStyle h16Medium = primaryTextStyle(
    fontSize: 16,
    fontFamily: FontFamily.poppins,
    fontWeight: FontWeight.w500,
  );

  static TextStyle h16SemiBold = primaryTextStyle(
    fontSize: 16,
    fontFamily: FontFamily.raleway,
    fontWeight: FontWeight.w600,
  );

  static TextStyle h16Bold = primaryTextStyle(
    fontSize: 16,
    fontFamily: FontFamily.raleway,
    fontWeight: FontWeight.w700,
  );

  static TextStyle h18Semibold = primaryTextStyle(
    fontSize: 18,
    fontFamily: FontFamily.poppins,
    fontWeight: FontWeight.w600,
  );

  static TextStyle h20Medium = primaryTextStyle(
    fontSize: 20,
    fontFamily: FontFamily.poppins,
    fontWeight: FontWeight.w500,
  );

  static TextStyle h21SemiBold = primaryTextStyle(
    fontSize: 21,
    fontFamily: FontFamily.raleway,
    fontWeight: FontWeight.w600,
  );

  static TextStyle h24Semibold = primaryTextStyle(
    fontSize: 24,
    fontFamily: FontFamily.poppins,
    fontWeight: FontWeight.w600,
  );

  static TextStyle h26Bold = primaryTextStyle(
    fontSize: 26,
    fontFamily: FontFamily.ralewayBold,
    fontWeight: FontWeight.w700,
  );

  static TextStyle h32Bold = primaryTextStyle(
    fontSize: 32,
    fontFamily: FontFamily.ralewayBold,
    fontWeight: FontWeight.w700,
  );

  static TextStyle h32Black = primaryTextStyle(
    fontSize: 32,
    fontFamily: FontFamily.ralewayBlack,
    fontWeight: FontWeight.w900,
  );

  static TextStyle h36Black = primaryTextStyle(
    fontSize: 36,
    fontFamily: FontFamily.ralewayBold,
    fontWeight: FontWeight.w700,
  );
}
