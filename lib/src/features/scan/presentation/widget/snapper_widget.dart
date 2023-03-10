import 'package:camulator/src/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SnapperWidget extends StatelessWidget {
  const SnapperWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: SizeApp.h4,
        width: SizeApp.w40,
        decoration: BoxDecoration(
          color: ColorApp.grey,
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }
}
