import 'dart:convert';

import '../global_data/sociair_global_var_data.dart';

void clearSharedPrefsData() async {
  await SociairGlobalVarData.sharedPreferences.clear();
}

bool? getBool({required String key}) {
  try {
    return SociairGlobalVarData.sharedPreferences.getBool(key);
  } catch (error) {
    return null;
  }
}

double? getDouble({required String key}) {
  try {
    return SociairGlobalVarData.sharedPreferences.getDouble(key);
  } catch (error) {
    return null;
  }
}

int? getInt({required String key}) {
  try {
    return SociairGlobalVarData.sharedPreferences.getInt(key);
  } catch (error) {
    return null;
  }
}

String? getString({required String key}) {
  try {
    return SociairGlobalVarData.sharedPreferences.getString(key);
  } catch (error) {
    return null;
  }
}

Future<void> setBool({required String key, required bool value}) async {
  try {
    await SociairGlobalVarData.sharedPreferences.setBool(key, value);
  } catch (error) {
    rethrow;
  }
}

Future<void> setDouble({required String key, required double value}) async {
  try {
    await SociairGlobalVarData.sharedPreferences.setDouble(key, value);
  } catch (error) {
    rethrow;
  }
}

Future<void> setInt({required String key, required int value}) async {
  try {
    await SociairGlobalVarData.sharedPreferences.setInt(key, value);
  } catch (error) {
    rethrow;
  }
}

Future<void> setString({required String key, required String value}) async {
  try {
    await SociairGlobalVarData.sharedPreferences.setString(key, value);
  } catch (error) {
    rethrow;
  }
}

void removeKey({required String key}) async {
  try {
    await SociairGlobalVarData.sharedPreferences.remove(key);
  } catch (error) {
    rethrow;
  }
}

Future<void> setModel<T>({
  required String key,
  required Map<String, dynamic> toJson,
}) async {
  try {
    String encodedValue = jsonEncode(toJson);
    await SociairGlobalVarData.sharedPreferences.setString(key, encodedValue);
  } catch (error) {
    rethrow;
  }
}

T? getModel<T>({
  required String key,
  required Function fromJson,
}) {
  try {
    String? getEncodedValue = getString(key: key);
    if (getEncodedValue != null) {
      var encodedValue = jsonDecode(getEncodedValue);
      return fromJson(encodedValue);
    } else {
      return null;
    }
  } catch (error) {
    rethrow;
  }
}
