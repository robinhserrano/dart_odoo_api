import 'package:dart_odoo_api/models/sales_record_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class BoolStringConverter extends JsonConverter<String, dynamic> {
  const BoolStringConverter();

  @override
  String fromJson(dynamic json) {
    if (json is String) return json;
    return '';
  }

  @override
  dynamic toJson(String object) => object;
}

class BoolRefferedByConverter extends JsonConverter<DisplayNameModel, dynamic> {
  const BoolRefferedByConverter();

  @override
  DisplayNameModel fromJson(dynamic json) {
    if (json is Map<String, dynamic>) return DisplayNameModel.fromJson(json);
    return const DisplayNameModel(displayName: '');
  }

  @override
  dynamic toJson(DisplayNameModel object) => object;
}
