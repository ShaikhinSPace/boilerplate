import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/core/constants/app_colors.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';
import 'package:shimmer/shimmer.dart';

class TableListShimmer extends StatelessWidget {
  final int? itemCount;
  const TableListShimmer({
    this.itemCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor:
          getColorByTheme(context: context, colorClass: AppColors.darkGreyColor)
              .withOpacity(0.2),
      highlightColor:
          getColorByTheme(context: context, colorClass: AppColors.greyColor)
              .withOpacity(0.7),
      enabled: true,
      child: Container(
        width: 1.sw,
        decoration: BoxDecoration(
          color: getColorByTheme(
                  context: context, colorClass: AppColors.darkGreyColor)
              .withOpacity(0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            itemCount ?? 4,
            (index) => Row(
              children: [
                Expanded(
                  child: Container(
                    height: 20.h,
                    decoration: BoxDecoration(
                        color: getColorByTheme(
                                context: context,
                                colorClass: AppColors.darkGreyColor)
                            .withOpacity(0.8)),
                  ).padTop(top: 10.h),
                ),
                5.horizontalSpace,
                Expanded(
                  child: Container(
                    height: 20.h,
                    decoration: BoxDecoration(
                        color: getColorByTheme(
                                context: context,
                                colorClass: AppColors.darkGreyColor)
                            .withOpacity(0.8)),
                  ),
                ),
                5.horizontalSpace,
                Expanded(
                  child: Container(
                    height: 20.h,
                    decoration: BoxDecoration(
                        color: getColorByTheme(
                                context: context,
                                colorClass: AppColors.darkGreyColor)
                            .withOpacity(0.8)),
                  ),
                ),
                5.horizontalSpace,
                Expanded(
                  child: Container(
                    height: 20.h,
                    decoration: BoxDecoration(
                        color: getColorByTheme(
                                context: context,
                                colorClass: AppColors.darkGreyColor)
                            .withOpacity(0.8)),
                  ),
                ),
              ],
            ).padHorizontal(horizontal: 6.w).padBottom(bottom: 5.h),
          ),
        ),
      ),
    );
  }
}
