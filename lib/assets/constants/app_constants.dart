import 'package:easy_localization/easy_localization.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppConstants {
  static const baseUrl = 'https://xolodilnik-erp.uicgroup.tech/fastapi/';

  // static const baseUrl = 'https://d2cd-86-62-2-250.ngrok-free.app/fastapi/';

  // static const baseUrl = 'https://web.xolodilnikgo.uz/fastapi/';
  static final phoneFormatter = MaskTextInputFormatter(mask: '## ### ## ##', filter: {"#": RegExp(r'\d')});
  static const yandexApiKey = "9737e8c9-ff2e-4c6f-b727-9f85b7a9f0dd";
  static final numberFormatter = NumberFormat('###,000');
}
