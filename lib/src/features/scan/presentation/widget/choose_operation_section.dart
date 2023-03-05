import 'package:camulator/src/common_widgets/common_widgets.dart';
import 'package:camulator/src/constants/constants.dart';
import 'package:camulator/src/features/domain.dart';
import 'package:camulator/src/features/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChooseOperationSection extends ConsumerWidget {
  const ChooseOperationSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(calculationControllerProvider);
    final controller = ref.read(calculationControllerProvider.notifier);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        OperatorChipWidget(
          isSelected: state.selectedOperator == Operator.addition,
          operator: Operator.addition,
          onTap: () {
            controller.setSelectedOperator(Operator.addition);
          },
        ),
        Gap.w32,
        OperatorChipWidget(
          isSelected: state.selectedOperator == Operator.subtraction,
          operator: Operator.subtraction,
          onTap: () {
            controller.setSelectedOperator(Operator.subtraction);
          },
        ),
        Gap.w32,
        OperatorChipWidget(
          isSelected: state.selectedOperator == Operator.multiplication,
          operator: Operator.multiplication,
          onTap: () {
            controller.setSelectedOperator(Operator.multiplication);
          },
        ),
        Gap.w32,
        OperatorChipWidget(
          isSelected: state.selectedOperator == Operator.division,
          operator: Operator.division,
          onTap: () {
            controller.setSelectedOperator(Operator.division);
          },
        ),
      ],
    );
  }
}
