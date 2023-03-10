import 'package:camulator/src/constants/constants.dart';
import 'package:camulator/src/features/presentation.dart';
import 'package:camulator/src/utils/utils.dart';
import 'package:flutter/material.dart';

class PermissionSection extends StatelessWidget {
  const PermissionSection({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ScanController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Permission denied',
          style: TypographyTheme.title,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: controller.getPermissionStatus,
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorApp.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Text(
            'Give permission',
            style: TypographyTheme.body.white,
          ),
        ),
      ],
    );
  }
}
