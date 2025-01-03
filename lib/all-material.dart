import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AllMaterial {
  static var box = GetStorage();

  // Font Family
  static var workSans = GoogleFonts.workSans;

  // Font Weight
  static const fontExtraBold = FontWeight.w800;
  static const fontBold = FontWeight.w700;
  static const fontSemiBold = FontWeight.w600;
  static const fontMedium = FontWeight.w500;
  static const fontRegular = FontWeight.w400;

  // Color
  static const colorPrimary = Color(0xff3EB075);
  static const colorSecondary = Color(0xffCCF9DB);
  static const colorWhite = Colors.white;
  static const colorBlack = Color(0xff0B0B0B);
  static const colorGreySec = Color(0xff8F8F8F);
  static const colorBlue = Color(0xff007AFF);
  static const colorRed = Color(0xffFF3B30);
  static const colorMint = Color(0xff00C7BE);

  // Linear Background
  static var linearBackground = const LinearGradient(
    stops: [0, 1],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFEAF5ED),
      Color(0xffffffff),
    ],
  );
}
