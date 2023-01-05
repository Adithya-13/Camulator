import 'package:easy_localization/easy_localization.dart';

extension XNum on num {

  String get toThousandFormat {
    final formatter = NumberFormat('#,###');
    return formatter.format(this);
  }
}
