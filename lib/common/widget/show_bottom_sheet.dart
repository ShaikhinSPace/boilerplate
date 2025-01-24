import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/core/config/di/di_injectable.dart';
import 'package:record_keeping/core/constants/app_colors.dart';
import 'package:record_keeping/core/routing/navigation_service.dart';

Future showCustomBottomSheet({
  required Widget Function(BuildContext) builder,
  bool isScrollControlled = false,
}) {
  return showModalBottomSheet(
    context: getIt<NavigationService>().getNavigationContext(),
    isScrollControlled: isScrollControlled,
    backgroundColor: getColorByTheme(
      context: getIt<NavigationService>().getNavigationContext(),
      colorClass: AppColors.secondaryColor,
    ),
    useSafeArea: true,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(6.r),
      topRight: Radius.circular(6.r),
    )),
    builder: builder,
  );
}

// DraggableScrollableSheet showCustomDraggableBottomSheet({
//   required Widget Function(BuildContext, ScrollController) builder,
//   DraggableScrollableController? controller,
//   bool isScrollControlled = false,
// }) {
//   return DraggableScrollableSheet(
//     builder: builder,
//     controller: controller,

//   );
// }
