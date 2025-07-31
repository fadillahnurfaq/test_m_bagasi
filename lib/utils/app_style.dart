import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  AppTextStyle._();
  static FontWeight light = FontWeight.w300;
  static FontWeight regular = FontWeight.w400;
  static FontWeight medium = FontWeight.w500;
  static FontWeight semiBold = FontWeight.w600;
  static FontWeight bold = FontWeight.w700;
  static FontWeight extraBold = FontWeight.w800;
  static FontWeight black = FontWeight.w900;

  static final String? _nunitoSans = GoogleFonts.nunitoSans().fontFamily;

  static TextStyle h1 = TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    fontSize: 20,
    fontWeight: bold,
    height: 1.2,
    fontFamily: _nunitoSans,
  );
  static TextStyle h2 = TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    fontSize: 18,
    fontWeight: bold,
    height: 1.2,
    fontFamily: _nunitoSans,
  );
  static TextStyle h3 = TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    fontSize: 16,
    fontWeight: bold,
    height: 1.2,
    fontFamily: _nunitoSans,
  );
  static TextStyle h4 = TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    fontSize: 14,
    fontWeight: semiBold,
    height: 1.2,
    fontFamily: _nunitoSans,
  );

  static TextStyle regularStyle = TextStyle(
    decoration: TextDecoration.none,
    color: AppColors.black,
    fontSize: 12,
    fontWeight: regular,
    height: 1.2,
    fontFamily: _nunitoSans,
  );
}

class AppColors {
  AppColors._();

  static const Color black900 = Color(0xFF1e1e1e);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFffffff);
  static final Color grey = Color(0xFFffffff).withValues(alpha: 0.6);
  static const Color grey50 = Color(0xFFeceef1);
}

class AppPadding {
  static const EdgeInsets horizonal = EdgeInsets.symmetric(horizontal: 16.0);
  static const EdgeInsets normal = EdgeInsets.all(10.0);
}
