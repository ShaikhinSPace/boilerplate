import 'package:flutter/material.dart';
import 'package:record_keeping/core/constants/assets_source.dart';
import 'package:record_keeping/core/localization/l10.dart';
import 'package:record_keeping/core/routing/route_name.dart';

import '../../../common/widget/svg_image_render_widget.dart';

class BottomNavBarModel {
  final String title;
  final String slug;
  final String? darkModeImage;
  final String? lightModeImage;

  BottomNavBarModel({
    required this.title,
    required this.slug,
    this.darkModeImage,
    this.lightModeImage,
  });
}

class HomeScreenConstants {
  HomeScreenConstants._();

  static const String homeScreenSlug = RouteName.landingScreenRoute;
  static const String profileScreenSlug = RouteName.profileRoute;

  static List<String> get homeScreenSlugList => <String>[
        homeScreenSlug,
        profileScreenSlug,
      ];

  static String getSlugByIndex(int index) => homeScreenSlugList[index];

  static int getIndexBySlug(String slug) => homeScreenSlugList.indexOf(slug);

  static BottomNavigationBarItem getNavBarBySlug({
    required BottomNavBarModel bottomNavBarModel,
  }) {
    switch (bottomNavBarModel.slug) {
      case homeScreenSlug:
        return BottomNavigationBarItem(
          icon: SvgImageRenderWidget(
            svgImagePath: AssetsSource.bottomNavAssetsSource.homeSvg,
          ),
          activeIcon: SvgImageRenderWidget(
            svgImagePath: AssetsSource.bottomNavAssetsSource.activeHomeSvg,
          ),
          label: bottomNavBarModel.title,
        );
      case profileScreenSlug:
      default:
        return BottomNavigationBarItem(
          icon: SvgImageRenderWidget(
            svgImagePath: AssetsSource.bottomNavAssetsSource.profileSvg,
          ),
          activeIcon: SvgImageRenderWidget(
            svgImagePath: AssetsSource.bottomNavAssetsSource.activeProfileSvg,
          ),
          label: bottomNavBarModel.title,
        );
    }
  }

  static List<BottomNavigationBarItem> get navBarList =>
      <BottomNavigationBarItem>[
        getNavBarBySlug(
          bottomNavBarModel: BottomNavBarModel(
            title: l10.library,
            slug: homeScreenSlug,
          ),
        ),
        getNavBarBySlug(
          bottomNavBarModel: BottomNavBarModel(
            title: l10.profile,
            slug: profileScreenSlug,
          ),
        ),
      ];
}
