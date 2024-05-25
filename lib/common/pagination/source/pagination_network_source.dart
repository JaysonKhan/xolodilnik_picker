import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:xolodilnik_picker/common/pagination/models/generic_pagination.dart';
import 'package:xolodilnik_picker/core/data/singletons/dio_settings.dart';
import 'package:xolodilnik_picker/core/data/singletons/service_locator.dart';
import 'package:xolodilnik_picker/core/data/singletons/storage.dart';
import 'package:xolodilnik_picker/utils/either.dart';
import 'package:xolodilnik_picker/utils/failures.dart';

class PaginationNetworkSource {
  final _dio = serviceLocator<DioSettings>().dio;

  Future<Either<Failure, GenericPagination<T>>> fetchMore<T>(
      {required String url,
      required T Function(Map<String, dynamic>) fromJson,
      String? next,
      Map<String, dynamic>? queries}) async {
    final token = StorageRepository.getString('token');
    final result = await _dio.get(
      next!.isNotEmpty ? next : url,
      queryParameters: queries,
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    try {
      if (result.statusCode! >= 200 && result.statusCode! < 300) {
        log(':::::::::: stations list data:  ${result.data}  ::::::::::');
        final data = GenericPagination<T>.fromJson((result.data!), (data) => fromJson((data as Map<String, dynamic>)));
        return Right(data);
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      print(e.toString());
      return Left(ServerFailure());
    }
  }
}
