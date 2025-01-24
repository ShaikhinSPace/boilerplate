import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:record_keeping/core/local_storage/shared_prefs_keys.dart';

import '../local_storage/shared_prefs_func.dart';

@lazySingleton
class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(getBool(key: SharedPrefsKeys.appThemeKey) ?? true);

  void toggleTheme() async {
    bool toggledValue = !state;
    emit(toggledValue);
    setBool(key: SharedPrefsKeys.appThemeKey, value: toggledValue);
  }
}
