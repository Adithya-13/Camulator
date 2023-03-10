import 'package:easy_localization/easy_localization.dart';

extension XNum on num {
  String get toThousandFormat {
    final formatter = NumberFormat('#,##0.${"#" * 3}');
    return formatter.format(this);
  }
}
