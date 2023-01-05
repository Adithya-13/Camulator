import 'package:camulator/src/constants/constants.dart';
import 'package:camulator/src/features/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OperatorChipWidget extends StatelessWidget {
  final bool isSelected;
  final Operator operator;
  final VoidCallback onTap;
  const OperatorChipWidget({
    Key? key,
    this.isSelected = false,
    required this.operator,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        alignment: Alignment.centerLeft,
        curve: Curves.easeInOutCubic,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOutCubic,
          decoration: BoxDecoration(
            color: isSelected ? operator.color : Colors.transparent,
            borderRadius: BorderRadius.circular(12.h),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: SizeApp.w12,
            vertical: SizeApp.h4,
          ),
          child: isSelected
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    operator.asset,
                    Gap.w8,
                    Text(
                      operator.name,
                      style: TypographyTheme.body,
                    ),
                  ],
                )
              : operator.asset,
        ),
      ),
    );
  }
}
