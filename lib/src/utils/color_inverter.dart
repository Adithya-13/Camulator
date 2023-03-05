import 'package:flutter/widgets.dart';

class ColorInverter extends StatelessWidget {
  final Widget child;
  final bool isInverted;

  const ColorInverter({
    Key? key,
    required this.child,
    this.isInverted = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isInverted) return child;
    return ColorFiltered(
      colorFilter: const ColorFilter.matrix([
        -1, //RED
        0,
        0,
        0,
        255, //GREEN
        0,
        -1,
        0,
        0,
        255, //BLUE
        0,
        0,
        -1,
        0,
        255, //ALPHA
        0,
        0,
        0,
        1,
        0,
      ]),
      child: child,
    );
  }
}
