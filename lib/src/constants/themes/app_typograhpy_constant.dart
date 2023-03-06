import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TypographyTheme {
  static TextStyle title = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle body = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle caption = GoogleFonts.poppins(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
  );
}
