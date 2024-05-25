import 'package:dio/dio.dart';

import '../exceptions/exceptions.dart';

extension DioResponseExtension on Response {
  bool get isSuccess => statusCode != null && statusCode! >= 200 && statusCode! < 300;

  ServerException get getServerException => ServerException(statusCode: statusCode ?? 0, errorMessage: "");
}
