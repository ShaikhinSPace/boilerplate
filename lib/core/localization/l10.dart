import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../config/di/di_injectable.dart';
import '../routing/navigation_service.dart';

AppLocalizations get l10 =>
    AppLocalizations.of(getIt<NavigationService>().getNavigationContext())!;
