import 'package:camulator/src/features/domain.dart';

class CalculationState {
  final Operator selectedOperator;
  
  const CalculationState({
    this.selectedOperator = Operator.addition,
  });

  CalculationState copyWith({
    Operator? selectedOperator,
  }) {
    return CalculationState(
      selectedOperator: selectedOperator ?? this.selectedOperator,
    );
  }
}
