import 'package:camulator/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// [INFO]
// Constant for sizes to be used in the app with respecting 8 pixel rules
class SizeApp {
  // [INFO]
  // Sizes that related with width
  static final w2 = 2.0.w;
  static final w4 = 4.0.w;
  static final w8 = 8.0.w;
  static final w12 = 12.0.w;
  static final w16 = 16.0.w;
  static final w20 = 20.0.w;
  static final w24 = 24.0.w;
  static final w28 = 28.0.w;
  static final w32 = 32.0.w;
  static final w36 = 36.0.w;
  static final w40 = 40.0.w;
  static final w48 = 48.0.w;
  static final w52 = 52.0.w;
  static final w56 = 56.0.w;
  static final w64 = 64.0.w;
  static final w72 = 72.0.w;
  static final w80 = 80.0.w;
  static final w96 = 96.0.w;

  // [INFO]
  // Sizes that related with height
  static final h4 = 4.0.h;
  static final h8 = 8.0.h;
  static final h12 = 12.0.h;
  static final h16 = 16.0.h;
  static final h20 = 20.0.h;
  static final h24 = 24.0.h;
  static final h28 = 28.0.h;
  static final h32 = 32.0.h;
  static final h36 = 36.0.h;
  static final h40 = 40.0.h;
  static final h48 = 48.0.h;
  static final h52 = 52.0.h;
  static final h56 = 56.0.h;
  static final h64 = 64.0.h;
  static final h72 = 72.0.h;
  static final h80 = 80.0.h;
  static final h96 = 96.0.h;

  /// [INFO]
  /// Sizes for custom width or height outside the 8 pixel rules
  static customWidth(double value) => value.w;
  static customHeight(double value) => value.h;
}

/// [INFO]
/// Constant for gaps to be used in the app with respecting 8 pixel rules
class Gap {
  /// [INFO]
  /// Gaps that related with width
  static final w4 = SizedBox(width: SizeApp.w4);
  static final w8 = SizedBox(width: SizeApp.w8);
  static final w12 = SizedBox(width: SizeApp.w12);
  static final w16 = SizedBox(width: SizeApp.w16);
  static final w20 = SizedBox(width: SizeApp.w20);
  static final w24 = SizedBox(width: SizeApp.w24);
  static final w28 = SizedBox(width: SizeApp.w28);
  static final w32 = SizedBox(width: SizeApp.w32);
  static final w36 = SizedBox(width: SizeApp.w36);
  static final w40 = SizedBox(width: SizeApp.w40);
  static final w48 = SizedBox(width: SizeApp.w48);
  static final w52 = SizedBox(width: SizeApp.w52);
  static final w56 = SizedBox(width: SizeApp.w56);
  static final w64 = SizedBox(width: SizeApp.w64);
  static final w72 = SizedBox(width: SizeApp.w72);
  static final w80 = SizedBox(width: SizeApp.w80);

  /// [INFO]
  /// Gaps that related with height
  static final h4 = SizedBox(height: SizeApp.h4);
  static final h8 = SizedBox(height: SizeApp.h8);
  static final h12 = SizedBox(height: SizeApp.h12);
  static final h16 = SizedBox(height: SizeApp.h16);
  static final h20 = SizedBox(height: SizeApp.h20);
  static final h24 = SizedBox(height: SizeApp.h24);
  static final h28 = SizedBox(height: SizeApp.h28);
  static final h32 = SizedBox(height: SizeApp.h32);
  static final h36 = SizedBox(height: SizeApp.h36);
  static final h40 = SizedBox(height: SizeApp.h40);
  static final h48 = SizedBox(height: SizeApp.h48);
  static final h52 = SizedBox(height: SizeApp.h52);
  static final h56 = SizedBox(height: SizeApp.h56);
  static final h64 = SizedBox(height: SizeApp.h64);
  static final h72 = SizedBox(height: SizeApp.h72);
  static final h80 = SizedBox(height: SizeApp.h80);

  /// [INFO]
  /// Gaps for custom width or height outside the 8 pixel rules
  static customGapWidth(double value) => SizedBox(width: value.w);
  static customGapHeight(double value) => SizedBox(height: value.h);

  /// [INFO]
  /// to get BuildContext.viewPadding.bottom
  /// used for give the empty space to fill the Bottom Outside SafeArea
  static bottomPadding(BuildContext context) {
    return customGapHeight(context.bottomPadding);
  }
}
