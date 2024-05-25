
import 'package:easy_localization/easy_localization.dart';

extension NumberFormatExt on num {
  String get formatN => NumberFormat.currency(
    symbol: '',
      decimalDigits: 0)
      .format(this);
}
