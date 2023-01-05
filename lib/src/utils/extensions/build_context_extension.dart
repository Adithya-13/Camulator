import 'package:flutter/cupertino.dart';

extension XBuildContext on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get screenWidth => MediaQuery.of(this).size.width;
  double screenWidthPercentage(double percentage) => screenWidth * percentage;
  double get screenHeight => MediaQuery.of(this).size.height;
  double screenHeightPercentage(double percentage) => screenHeight * percentage;
  double get bottomPadding => mediaQuery.viewPadding.bottom;
}
