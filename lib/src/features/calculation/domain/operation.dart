import 'package:camulator/src/features/domain.dart';

class Operation {
  final Operator operator;
  final List<double> numbers;
  double totalOperation;

  Operation({
    required this.operator,
    required this.numbers,
    this.totalOperation = 0,
  });

  double total(double initialValue) {
    switch (operator) {
      case Operator.addition:
        totalOperation = numbers.fold(
            initialValue, (previousValue, element) => previousValue + element);
        return totalOperation;
      case Operator.subtraction:
        totalOperation = numbers.fold(
            initialValue, (previousValue, element) => previousValue - element);
        return totalOperation;
      case Operator.multiplication:
        totalOperation = numbers.fold(
            initialValue, (previousValue, element) => previousValue * element);
        return totalOperation;
      case Operator.division:
        totalOperation = numbers.fold(
            initialValue, (previousValue, element) => previousValue / element);
        return totalOperation;
    }
  }
}
