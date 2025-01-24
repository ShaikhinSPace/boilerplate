import 'package:flutter/material.dart';

import '../enums/sociair_enums.dart';
import 'dark_theme.dart';
import 'light_theme.dart';

Map<AppTheme, ThemeData> get  appThemeData => <AppTheme, ThemeData>{
      AppTheme.lightTheme: lightTheme,
      AppTheme.darkTheme: darkTheme,
    };
