import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

interface class ILocalizationService {
  Iterable<LocalizationsDelegate<dynamic>> get localizationsDelegates =>
      <LocalizationsDelegate<dynamic>>[
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  Iterable<Locale> get supportedLocales => <Locale>[
        const Locale('en', 'US'),
        const Locale('ne', 'NP'),
      ];

  Locale getCurrentLocales(bool isEng) {
    return isEng ? supportedLocales.first : supportedLocales.last;
  }
}

class LocalizationService extends ILocalizationService {}
