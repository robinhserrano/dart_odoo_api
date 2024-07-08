// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_tasks_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectTasksImpl _$$ProjectTasksImplFromJson(Map<String, dynamic> json) =>
    _$ProjectTasksImpl(
      id: (json['id'] as num?)?.toInt(),
      name: const BoolStringConverter().fromJson(json['name']),
      dateDeadline:
          const BoolDateTimeConverter().fromJson(json['date_deadline']),
      saleLineId:
          const BoolRefferedByConverter().fromJson(json['sale_line_id']),
    );

Map<String, dynamic> _$$ProjectTasksImplToJson(_$ProjectTasksImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': const BoolStringConverter().toJson(instance.name),
      'date_deadline':
          const BoolDateTimeConverter().toJson(instance.dateDeadline),
      'sale_line_id': _$JsonConverterToJson<dynamic, DisplayNameModel>(
          instance.saleLineId, const BoolRefferedByConverter().toJson),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
