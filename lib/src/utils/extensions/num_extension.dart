import 'package:easy_localization/easy_localization.dart';

extension XNum on num {
  String get toThousandFormat {
    final formatter = NumberFormat('#,###');
    return formatter.format(this);
  }

  String get toThousandFormatWithComma {
    final formatter = NumberFormat('#,###');
    return formatter.format(this).replaceAll('.', ',');
  }

  String get fromDoubleToStringWithComma {
    final value = this as double;
    return value.toString().replaceAll('.', ',');
  }
}
