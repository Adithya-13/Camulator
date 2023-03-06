import 'package:camulator/src/constants/constants.dart';
import 'package:camulator/src/features/domain.dart';
import 'package:camulator/src/features/presentation.dart';
import 'package:camulator/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultWidget extends ConsumerWidget {
  const ResultWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calculationState = ref.watch(calculationControllerProvider);
    final calculationController =
        ref.read(calculationControllerProvider.notifier);

    return Container(
      padding: EdgeInsets.all(SizeApp.h12),
      margin: EdgeInsets.symmetric(
        horizontal: context.screenWidthPercentage(0.12),
      ),
      decoration: BoxDecoration(
        color: ColorApp.black,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Result',
            style: TypographyTheme.caption,
          ),
          Gap.h4,
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      calculationState.result.toString(),
                      style: TypographyTheme.title,
                    ),
                    Gap.h4,
                    if (calculationState.addedNumber != null)
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(
                              SizeApp.customHeight(2),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: calculationState.prevOperator.color,
                            ),
                            height: SizeApp.h16,
                            width: SizeApp.h16,
                            child: calculationState.prevOperator.asset,
                          ),
                          Gap.w4,
                          Expanded(
                            child: Text(
                              calculationState.addedNumber.toString(),
                              style: TypographyTheme.caption,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              Gap.w12,
              GestureDetector(
                onTap: calculationController.reset,
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
