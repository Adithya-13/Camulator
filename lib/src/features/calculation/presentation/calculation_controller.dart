import 'package:camulator/src/features/domain.dart';
import 'package:camulator/src/features/presentation.dart';
import 'package:camulator/src/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculationController extends StateNotifier<CalculationState> {
  CalculationController() : super(const CalculationState());

  void setSelectedOperator(Operator operator) {
    if (state.prevOperator != operator) {
      state = state.copyWith(
        prevOperator: state.selectedOperator,
      );
    }
    state = state.copyWith(
      selectedOperator: operator,
    );
  }

  void setAddedNumber(double? number) {
    state = state.copyWith(
      addedNumber: Wrapped.value(number),
    );
  }

  void insertCalculation(
      {double? number, Function(double? result)? onCalculated}) async {
    setAddedNumber(number);
    if (number == null) return;

    if (state.operations.isEmpty ||
        state.prevOperator != state.selectedOperator) {
      final operation =
          Operation(operator: state.selectedOperator, numbers: []);
      operation.numbers.add(number);

      final templist = List<Operation>.from(state.operations, growable: true);
      templist.add(operation);

      setOperations(templist);

      state = state.copyWith(
        prevOperator: state.selectedOperator,
      );
    } else {
      final operation = state.operations.last;
      operation.numbers.add(number);

      final templist = List<Operation>.from(state.operations, growable: true);
      templist.last = operation;

      setOperations(templist);
    }

    calculateResult();

    onCalculated != null ? onCalculated(state.result) : () {};
  }

  void calculateResult() {
    double total = 0;
    for (var operation in state.operations) {
      total = operation.total(total);
    }
    state = state.copyWith(
      result: Wrapped.value(total),
    );
  }

  void setOperations(List<Operation> operations) {
    state = state.copyWith(
      operations: operations,
    );
  }

  void reset() {
    state = state.copyWith(
      prevOperator: state.selectedOperator,
      addedNumber: const Wrapped.value(null),
      result: const Wrapped.value(null),
      operations: const [],
    );
  }

  void rollback() {
    if (state.operations.isEmpty) {
      calculateResult();
      return;
    }

    final templist = List<Operation>.from(state.operations, growable: true);
    if (templist.last.numbers.length == 1) {
      templist.removeLast();
    } else {
      templist.last.numbers.removeLast();
    }

    setOperations(templist);

    calculateResult();

    state = state.copyWith(
      addedNumber: const Wrapped.value(null),
      selectedOperator: state.prevOperator,
    );
  }

  void deleteNumber(int operationIndex, int index) {
    final templist = List<Operation>.from(state.operations, growable: true);
    final selectedOperation = templist[operationIndex];
    if (selectedOperation.numbers.length == 1) {
      templist.removeAt(operationIndex);
    } else {
      selectedOperation.numbers.removeAt(index);
      templist[operationIndex] = selectedOperation;
    }

    setOperations(templist);

    calculateResult();

    state = state.copyWith(
      addedNumber: const Wrapped.value(null),
      selectedOperator: state.prevOperator,
    );
  }
}

final calculationControllerProvider =
    StateNotifierProvider.autoDispose<CalculationController, CalculationState>(
        (ref) {
  return CalculationController();
});
