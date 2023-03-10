import 'package:camulator/src/constants/constants.dart';
import 'package:flutter/material.dart';

class CloseButtonWidget extends StatelessWidget {
  const CloseButtonWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const ShapeDecoration(
          shape: CircleBorder(),
          color: ColorApp.grey,
        ),
        padding: EdgeInsets.all(SizeApp.h4),
        child: Icon(
          Icons.close_rounded,
          color: ColorApp.white,
          size: SizeApp.w16,
        ),
      ),
    );
  }
}
