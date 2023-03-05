import 'package:camulator/src/features/domain.dart';
import 'package:camulator/src/features/presentation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculationController extends StateNotifier<CalculationState> {
  CalculationController() : super(const CalculationState());

  void setSelectedOperator(Operator operator) {
    state = state.copyWith(
      selectedOperator: operator,
    );
  }
}

final calculationControllerProvider =
    StateNotifierProvider.autoDispose<CalculationController, CalculationState>(
        (ref) {
  return CalculationController();
});
