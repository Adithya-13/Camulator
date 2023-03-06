import 'package:camulator/src/features/domain.dart';
import 'package:camulator/src/utils/utils.dart';

class CalculationState {
  final List<Operation> operations;
  final double? result;
  final Operator selectedOperator;
  final Operator prevOperator;
  final double? addedNumber;

  const CalculationState({
    this.operations = const [],
    this.result,
    this.selectedOperator = Operator.addition,
    this.prevOperator = Operator.addition,
    this.addedNumber,
  });

  CalculationState copyWith({
    List<Operation>? operations,
    Wrapped<double?>? result,
    Operator? selectedOperator,
    Operator? prevOperator,
    Wrapped<double?>? addedNumber,
  }) {
    return CalculationState(
      operations: operations ?? this.operations,
      result: result != null ? result.value : this.result,
      selectedOperator: selectedOperator ?? this.selectedOperator,
      prevOperator: prevOperator ?? this.prevOperator,
      addedNumber: addedNumber != null ? addedNumber.value : this.addedNumber,
    );
  }
}
