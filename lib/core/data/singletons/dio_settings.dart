import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:xolodilnik_picker/assets/constants/app_constants.dart';
import 'package:xolodilnik_picker/core/data/interceptors/token_referesh_interceptor.dart';
import '../interceptors/authorization_interceptor.dart';
import '../interceptors/device_id_intercepter.dart';
import '../interceptors/language_interceptor.dart';

class DioSettings {
  final BaseOptions _dioBaseOptions = BaseOptions(
    baseUrl: AppConstants.baseUrl,
    connectTimeout: const Duration(milliseconds: 35000),
    receiveTimeout: const Duration(milliseconds: 35000),
    followRedirects: false,
    validateStatus: (status) => status != null && status <= 500,
  );

  BaseOptions get dioBaseOptions => _dioBaseOptions;

  PrettyDioLogger get _loggerInterceptor => PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
      maxWidth: 90,
      logPrint: (object) => log(object.toString()));

  LanguageInterceptor get _languageInterceptor => LanguageInterceptor();

  DeviceIdInterceptor get _deviceIdInterceptor => DeviceIdInterceptor();

  AuthenticationInterceptor get _authenticationInterceptor => AuthenticationInterceptor();

  Dio get dio {
    final dio = Dio(_dioBaseOptions);
    dio.interceptors
      // ..add(CustomInterceptor(dio: dio))
      ..add(_languageInterceptor)
      ..add(_deviceIdInterceptor)
      ..add(_authenticationInterceptor)
      ..add(_loggerInterceptor);
    return dio;
  }
}
