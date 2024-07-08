// ignore_for_file: invalid_annotation_target, always_put_required_named_parameters_first

import 'package:dart_odoo_api/models/bool_to_string_converter.dart';
import 'package:dart_odoo_api/models/sales_record_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'project_tasks_model.freezed.dart';
part 'project_tasks_model.g.dart';

@freezed
class ProjectTasks with _$ProjectTasks {
  const factory ProjectTasks({
    required int? id,
    @BoolStringConverter() required String name,
    @JsonKey(name: 'date_deadline')
    @BoolDateTimeConverter()
    required DateTime? dateDeadline,
    @JsonKey(name: 'sale_line_id')
    @BoolRefferedByConverter()
    required DisplayNameModel? saleLineId,
  }) = _ProjectTasks;

  factory ProjectTasks.fromJson(Map<String, dynamic> json) =>
      _$ProjectTasksFromJson(json);
}

// @freezed
// class DisplayNameModel with _$DisplayNameModel {
//   const factory DisplayNameModel({
//     required int? id,
//     @JsonKey(name: 'display_name')
//     @BoolStringConverter()
//     required String displayName,
//   }) = _DisplayNameModel;

//   factory DisplayNameModel.fromJson(Map<String, dynamic> json) =>
//       _$DisplayNameModelFromJson(json);
// }
