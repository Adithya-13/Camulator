import 'package:camulator/gen/assets.gen.dart';
import 'package:camulator/src/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum Operator {
  addition,
  subtraction,
  multiplication,
  division,
}

extension XOperator on Operator {
  SvgPicture get asset {
    switch (this) {
      case Operator.addition:
        return Assets.svgs.additionIcon.svg(
          fit: BoxFit.fitWidth,
          width: SizeApp.w16,
        );
      case Operator.subtraction:
        return Assets.svgs.subtractionIcon.svg(
          fit: BoxFit.fitWidth,
          width: SizeApp.w16,
        );
      case Operator.multiplication:
        return Assets.svgs.multiplicaitionIcon.svg(
          fit: BoxFit.fitWidth,
          width: SizeApp.w16,
        );
      case Operator.division:
        return Assets.svgs.divisionIcon.svg(
          fit: BoxFit.fitWidth,
          width: SizeApp.w16,
        );
    }
  }

  String get name {
    switch (this) {
      case Operator.addition:
        return 'Addition';
      case Operator.subtraction:
        return 'Subtraction';
      case Operator.multiplication:
        return 'Division';
      case Operator.division:
        return 'Division';
    }
  }

  Color get color {
    switch (this) {
      case Operator.addition:
        return ColorApp.darkGreen;
      case Operator.subtraction:
        return ColorApp.darkRed;
      case Operator.multiplication:
        return ColorApp.darkYellow;
      case Operator.division:
        return ColorApp.darkBlue;
    }
  }
}
