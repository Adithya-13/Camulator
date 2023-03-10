import 'package:camulator/src/common_widgets/common_widgets.dart';
import 'package:camulator/src/constants/constants.dart';
import 'package:camulator/src/features/domain.dart';
import 'package:camulator/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OperationListTileWidget extends StatelessWidget {
  final Operator operator;
  final double number;
  final VoidCallback onDelete;
  const OperationListTileWidget({
    Key? key,
    required this.operator,
    required this.number,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: SizeApp.h20,
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(SizeApp.h8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: operator.color,
            ),
            height: SizeApp.h32,
            width: SizeApp.h32,
            child: operator.asset,
          ),
          Gap.w12,
          Expanded(
            child: Text(
              number.toThousandFormat,
              style: TypographyTheme.title,
            ),
          ),
          if (operator != Operator.result) ...[
            Gap.w12,
            CloseButtonWidget(
              onTap: onDelete,
            ),
          ],
        ],
      ),
    );
  }
}
