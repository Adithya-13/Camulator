import 'package:camulator/src/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension XTextStyle on TextStyle {
  /// [INFO]
  /// Extension for change text color
  TextStyle get black => copyWith(color: ColorApp.black);
  TextStyle get white => copyWith(color: ColorApp.white);
  TextStyle get grey => copyWith(color: ColorApp.grey);
  TextStyle get primary => copyWith(color: ColorApp.primary);
  TextStyle get darkGreen => copyWith(color: ColorApp.darkGreen);
  TextStyle get darkRed => copyWith(color: ColorApp.darkRed);
  TextStyle get darkYellow => copyWith(color: ColorApp.darkYellow);
  TextStyle get darkBlue => copyWith(color: ColorApp.darkBlue);

  /// [INFO]
  /// Extension for change font size
  ///
  /// Example:
  /// TypographyTheme.subtitle1.fontSize(20);
  TextStyle fontSizeCustom(double size) => copyWith(fontSize: size.sp);

  /// [INFO]
  /// Extension for change font color
  ///
  /// Example:
  /// TypographyTheme.subtitle1.fontColor(ColorApp.black);
  TextStyle fontColor(Color color) => copyWith(color: color);

  /// [INFO]
  /// Extension for change font weight
  ///
  /// Example:
  /// TypographyTheme.subtitle1.w500;
  TextStyle get w100 => copyWith(fontWeight: FontWeight.w100);
  TextStyle get w200 => copyWith(fontWeight: FontWeight.w200);
  TextStyle get w300 => copyWith(fontWeight: FontWeight.w300);
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get w800 => copyWith(fontWeight: FontWeight.w800);
  TextStyle get w900 => copyWith(fontWeight: FontWeight.w900);

  /// [INFO]
  /// Extension for change font style and decoration
  ///
  /// Example:
  /// TypographyTheme.subtitle1.underline;
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);
  TextStyle get overline => copyWith(decoration: TextDecoration.overline);

  /// [INFO]
  /// Extension for change font height and letter spacing
  ///
  /// Example
  /// TypographyTheme.customHeight(2);
  /// or
  /// TypographyTheme.customLetterSpacing(2);
  TextStyle customHeight(double value) => copyWith(height: value.h);
  TextStyle customSpacing(double value) => copyWith(letterSpacing: value.w);

  /// [INFO] Extension for shadow, decorationThicknes and change decorationColor
  TextStyle get underlineWithSpace => underline.copyWith(
        shadows: [
          const Shadow(
            color: Colors.black,
            offset: Offset(0, -8),
          ),
        ],
        decorationThickness: 2,
        color: Colors.transparent,
        decorationColor: ColorApp.black,
      );
}
