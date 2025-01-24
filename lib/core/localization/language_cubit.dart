import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../local_storage/shared_prefs_func.dart';
import '../local_storage/shared_prefs_keys.dart';

@lazySingleton
class LanguageCubit extends Cubit<bool> {
  LanguageCubit()
      : super(getBool(key: SharedPrefsKeys.localizationKey) ?? true);

  void toggleLanguage() async {
    bool toggledValue = !state;
    emit(toggledValue);
    setBool(key: SharedPrefsKeys.localizationKey, value: toggledValue);
  }
}
