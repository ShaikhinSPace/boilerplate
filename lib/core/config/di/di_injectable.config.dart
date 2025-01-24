// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../common/navigation_cubit/bottom_nav_cubit.dart' as _i550;
import '../../../feature/auth/data/repo_impl/auth_repo_impl.dart' as _i590;
import '../../../feature/auth/domain/repo/auth_repo.dart' as _i249;
import '../../../feature/auth/presentation/cubit/login_form_cubit.dart'
    as _i500;
import '../../../feature/auth/presentation/cubit/profile/my_profile_cubit.dart'
    as _i500;
import '../../../feature/home/data/repo_impl/library_repo_impl.dart' as _i770;
import '../../../feature/home/domain/repo/library_repo.dart' as _i105;
import '../../../feature/home/presentation/cubit/library_list_cubit.dart'
    as _i597;
import '../../../feature/image_library/presentation/cubit/image_library_cubit.dart'
    as _i456;
import '../../../feature/upload_image/data/repo_impl/upload_image_repo_impl.dart'
    as _i37;
import '../../../feature/upload_image/domain/repo/upload_image_repo.dart'
    as _i745;
import '../../localization/language_cubit.dart' as _i928;
import '../../network/base_api_request.dart' as _i476;
import '../../network/internet/internet_cubit.dart' as _i794;
import '../../routing/navigation_service.dart' as _i366;
import '../../theme/theme_cubit.dart' as _i502;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i476.BaseApiRequest>(() => _i476.BaseApiRequest());
    gh.lazySingleton<_i794.InternetCubit>(() => _i794.InternetCubit());
    gh.lazySingleton<_i502.ThemeCubit>(() => _i502.ThemeCubit());
    gh.lazySingleton<_i366.NavigationService>(() => _i366.NavigationService());
    gh.lazySingleton<_i928.LanguageCubit>(() => _i928.LanguageCubit());
    gh.lazySingleton<_i550.BottomNavCubit>(() => _i550.BottomNavCubit());
    gh.lazySingleton<_i597.LibraryListCubit>(() => _i597.LibraryListCubit());
    gh.lazySingleton<_i500.LoginFormCubit>(() => _i500.LoginFormCubit());
    gh.lazySingleton<_i500.MyProfileCubit>(() => _i500.MyProfileCubit());
    gh.lazySingleton<_i456.ImageLibraryCubit>(() => _i456.ImageLibraryCubit());
    gh.lazySingleton<_i105.LibraryRepo>(() => _i770.LibraryRepoImpl());
    gh.lazySingleton<_i745.UploadImageRepo>(() => _i37.UploadImageRepoImpl());
    gh.lazySingleton<_i249.AuthRepo>(() => _i590.AuthRepoImpl());
    return this;
  }
}
