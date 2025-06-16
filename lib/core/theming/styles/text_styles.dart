import 'package:auvnet_flutter_internship_assessment/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextStyles {
  static TextStyle rubik24Medium = GoogleFonts.rubik(
    color: ColorsManager.kSecondaryColor,
    fontSize: 28.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle rubik14Regular = GoogleFonts.rubik(
    color: Color(0xFF677294),
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle rubik18Medium = GoogleFonts.rubik(
    color: Colors.white,
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle mulish14Light = GoogleFonts.mulish(
    color: Colors.black.withValues(alpha: 0.50),
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle dmSans14Bold = GoogleFonts.dmSans(
    color: Color(0xFF1877F2),
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle dmSans14Medium = GoogleFonts.dmSans(
    color: Colors.white,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );
}
