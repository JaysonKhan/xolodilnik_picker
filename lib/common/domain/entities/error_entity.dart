import 'package:xolodilnik_picker/common/domain/entities/error_item_entity.dart';

class ErrorEntity {
  @ErrorItemConverter()
  final ErrorItemEntity detail;

  const ErrorEntity({this.detail = const ErrorItemEntity()});
}
