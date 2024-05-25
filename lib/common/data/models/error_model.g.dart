// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) => ErrorModel(
      detail: json['detail'] == null
          ? const ErrorItemEntity()
          : const ErrorItemConverter().fromJson(json['detail'] as Map<String, dynamic>?),
    );
