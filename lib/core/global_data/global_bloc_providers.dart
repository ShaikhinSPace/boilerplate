import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:record_keeping/common/navigation_cubit/bottom_nav_cubit.dart';
import 'package:record_keeping/core/theme/theme_cubit.dart';
import 'package:record_keeping/feature/auth/presentation/cubit/login_form_cubit.dart';
import 'package:record_keeping/feature/image_library/presentation/cubit/image_library_cubit.dart';

import '../../feature/auth/presentation/cubit/profile/my_profile_cubit.dart';
import '../../feature/home/presentation/cubit/library_list_cubit.dart';
import '../config/di/di_injectable.dart';
import '../localization/language_cubit.dart';
import '../network/internet/internet_cubit.dart';

interface class IGlobalBlocProvider {
  List<SingleChildWidget> get globalBlocProvider => <SingleChildWidget>[
        BlocProvider<ThemeCubit>.value(
          value: getIt<ThemeCubit>(),
        ),
        BlocProvider<LanguageCubit>.value(
          value: getIt<LanguageCubit>(),
        ),
        BlocProvider<InternetCubit>.value(
          value: getIt<InternetCubit>(),
        ),
        BlocProvider<LoginFormCubit>.value(
          value: getIt<LoginFormCubit>(),
        ),
        BlocProvider<MyProfileCubit>.value(
          value: getIt<MyProfileCubit>(),
        ),
        BlocProvider<BottomNavCubit>.value(
          value: getIt<BottomNavCubit>(),
        ),
        BlocProvider<ImageLibraryCubit>.value(
          value: getIt<ImageLibraryCubit>(),
        ),
        BlocProvider<LibraryListCubit>.value(
          value: getIt<LibraryListCubit>(),
        ),
      ];
}

class GlobalBlocProvider extends IGlobalBlocProvider {}
