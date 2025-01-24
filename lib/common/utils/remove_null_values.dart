import 'dart:convert';

String encodeFilterValues({required Map<String, dynamic>? json}) {
  // first removes key containing null values
  Map<String, dynamic> filteredValues =
      json != null ? (removeNullValues(json: json) ?? {}) : <String, dynamic>{};
  return jsonEncode(filteredValues);
}

Map<String, dynamic>? removeNullValues({required Map<String, dynamic> json}) {
  return json
    ..removeWhere((String key, dynamic value) =>
        value == null || (value is List && value.isEmpty));
}
