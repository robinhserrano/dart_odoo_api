import 'package:dart_odoo_api/models/sales_record_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class BoolStringConverter extends JsonConverter<String, dynamic> {
  const BoolStringConverter();

  @override
  String fromJson(dynamic json) {
    // if (json is bool?) return json.toString() ?? 'false';
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

// class BoolDatetimeConverter extends JsonConverter<DateTime?, dynamic> {
//   const BoolDatetimeConverter();

//   @override
//   DateTime? fromJson(dynamic json) {
//     if (json is bool) return null;

//     // if (json is bool?) return json.toString() ?? 'false';
//     return json;
//     //return '';
//   }

//   @override
//   dynamic toJson(DateTime? object) => object;
// }

// class BoolDatetimeConverter extends JsonConverter<String, DateTime?> {
//   const BoolDatetimeConverter();

//   @override
//   DateTime fromJson(dynamic json) {
//     if (json is bool) {
//       return null; // Return null for booleans
//     } else if (json is String) {
//       try {
//         // Parse the string as a DateTime using a suitable format (e.g., RFC3339)
//         return DateTime.parse(json);
//       } on FormatException {
//         throw ArgumentError('Invalid datetime format: $json'); // Informative error
//       }
//     } else {
//       throw ArgumentError('Unexpected value type for BoolDatetimeonverter: ${json.runtimeType}'); // Informative error
//     }
//   }

//   @override
//   String toJson(DateTime? object) => object?.toString() ?? ''; // Encode DateTime as string or empty string
// }

class BoolDateTimeConverter implements JsonConverter<DateTime?, dynamic> {
  const BoolDateTimeConverter();

  @override
  DateTime? fromJson(dynamic json) {
    if (json is bool) {
      return null;
    } else if (json is String) {
      try {
        // Parse the string as a DateTime using a suitable format (e.g., RFC3339)
        return DateTime.parse(json);
      } on FormatException {
        throw ArgumentError(
            'Invalid datetime format: $json'); // Informative error
      }
    } else {
      throw ArgumentError(
          'Unexpected value type for BoolDatetimeonverter: ${json.runtimeType}'); // Informative error
    }
  }

  @override
  dynamic toJson(DateTime? object) => object;
}
