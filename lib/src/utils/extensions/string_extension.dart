import 'package:easy_localization/easy_localization.dart';

extension XString on String? {
  bool get isNumeric {
    if (this == null) {
      return false;
    }
    return num.tryParse(this!) != null;
  }

  double? get toDoubleWithCommas {
    if (this == null) return null;
    try {
      return NumberFormat().parse(this?.replaceAll('.', '') ?? '').toDouble();
    } catch (e) {
      return null;
    }
  }
}
