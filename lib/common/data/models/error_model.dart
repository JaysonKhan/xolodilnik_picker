import 'package:json_annotation/json_annotation.dart';
import 'package:xolodilnik_picker/common/domain/entities/error_entity.dart';
import 'package:xolodilnik_picker/common/domain/entities/error_item_entity.dart';

part 'error_model.g.dart';

@JsonSerializable(createToJson: false)
class ErrorModel extends ErrorEntity {
  const ErrorModel({
    required super.detail,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) => _$ErrorModelFromJson(json);
}
