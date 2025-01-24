import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../feature/home/constants/home_screen_constant.dart';

@lazySingleton
class BottomNavCubit extends Cubit<(int currentIndex, String activeSlug)> {
  BottomNavCubit()
      : super(
          (
            0,
            HomeScreenConstants.homeScreenSlug,
          ),
        );

  void updateBottomNavBar({
    required int currentIndex,
    required String activeSlug,
  }) {
    emit((
      currentIndex,
      activeSlug,
    ));
  }

  void resetState() {
    emit((
      0,
      HomeScreenConstants.homeScreenSlug,
    ));
  }
}
