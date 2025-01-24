import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/constants/app_colors.dart';

enum ShimmerType {
  basicCard,
  cardInfo,
  basicListItem,
  listItemInfo,
  authorInfo,
  callListItem,
  messageList
}

class ShimmerWidget extends StatelessWidget {
  final ShimmerType shimmerType;

  const ShimmerWidget({super.key, required this.shimmerType});

  @override
  Widget build(BuildContext context) {
    switch (shimmerType) {
      case ShimmerType.basicCard:
        return const _BasicCardShimmer();
      case ShimmerType.cardInfo:
        return const _CardInfoShimmer();
      case ShimmerType.basicListItem:
        return const _ListItemShimmer();
      case ShimmerType.listItemInfo:
        return const _ListItemInfoShimmer();
      case ShimmerType.callListItem:
        return const _CallListItemShimmer();
      case ShimmerType.authorInfo:
        return const _AuthorInfoShimmer();
      case ShimmerType.messageList:
        return const _MessageListShimmer();
      default:
        return const SizedBox.shrink();
    }
  }
}

class _BasicCardShimmer extends StatelessWidget {
  const _BasicCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: getColorByTheme(
        context: context,
        colorClass: AppColors.greyShadeColor,
      ),
      highlightColor: getColorByTheme(
        context: context,
        colorClass: AppColors.lightGreyColor,
      ),
      child: Container(
        width: double.infinity,
        height: 150.h,
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: getColorByTheme(
            context: context,
            colorClass: AppColors.lightGreyColor,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }
}

class _CardInfoShimmer extends StatelessWidget {
  const _CardInfoShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: getColorByTheme(
        context: context,
        colorClass: AppColors.greyShadeColor,
      ),
      highlightColor: getColorByTheme(
        context: context,
        colorClass: AppColors.lightGreyColor,
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 150.h,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              color: getColorByTheme(
                context: context,
                colorClass: AppColors.lightGreyColor,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          8.verticalSpace,
          Container(
            height: 30.h,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              color: getColorByTheme(
                context: context,
                colorClass: AppColors.lightGreyColor,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          8.verticalSpace,
          Container(
            height: 20.h,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              color: getColorByTheme(
                context: context,
                colorClass: AppColors.lightGreyColor,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ],
      ),
    );
  }
}

class _ListItemInfoShimmer extends StatelessWidget {
  const _ListItemInfoShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: getColorByTheme(
        context: context,
        colorClass: AppColors.greyShadeColor,
      ),
      highlightColor: getColorByTheme(
        context: context,
        colorClass: AppColors.lightGreyColor,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          children: <Widget>[
            Container(
              height: 80.w,
              width: 120.w,
              decoration: BoxDecoration(
                color: getColorByTheme(
                  context: context,
                  colorClass: AppColors.lightGreyColor,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            10.horizontalSpace,
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 50.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: getColorByTheme(
                        context: context,
                        colorClass: AppColors.lightGreyColor,
                      ),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                  8.verticalSpace,
                  Container(
                    height: 20.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: getColorByTheme(
                        context: context,
                        colorClass: AppColors.lightGreyColor,
                      ),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ListItemShimmer extends StatelessWidget {
  const _ListItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: getColorByTheme(
        context: context,
        colorClass: AppColors.greyShadeColor,
      ),
      highlightColor: getColorByTheme(
        context: context,
        colorClass: AppColors.lightGreyColor,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        height: 80.w,
        width: double.infinity,
        decoration: BoxDecoration(
          color: getColorByTheme(
            context: context,
            colorClass: AppColors.lightGreyColor,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }
}

class _AuthorInfoShimmer extends StatelessWidget {
  const _AuthorInfoShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: getColorByTheme(
        context: context,
        colorClass: AppColors.greyShadeColor,
      ),
      highlightColor: getColorByTheme(
        context: context,
        colorClass: AppColors.lightGreyColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 75.w,
            width: 75.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: getColorByTheme(
                context: context,
                colorClass: AppColors.lightGreyColor,
              ),
            ),
          ),
          10.verticalSpace,
          Container(
            height: 10.h,
            width: 100.w,
            color: getColorByTheme(
              context: context,
              colorClass: AppColors.lightGreyColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _CallListItemShimmer extends StatelessWidget {
  const _CallListItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: getColorByTheme(
        context: context,
        colorClass: AppColors.greyShadeColor,
      ),
      highlightColor: getColorByTheme(
        context: context,
        colorClass: AppColors.lightGreyColor,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          children: <Widget>[
            Container(
              height: 70.w,
              width: 70.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: getColorByTheme(
                  context: context,
                  colorClass: AppColors.lightGreyColor,
                ),
              ),
            ),
            10.horizontalSpace,
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 20.h,
                          decoration: BoxDecoration(
                            color: getColorByTheme(
                              context: context,
                              colorClass: AppColors.lightGreyColor,
                            ),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                      ),
                      10.horizontalSpace,
                      Expanded(
                        child: Container(
                          height: 20.h,
                          decoration: BoxDecoration(
                            color: getColorByTheme(
                              context: context,
                              colorClass: AppColors.lightGreyColor,
                            ),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                      ),
                    ],
                  ),
                  8.verticalSpace,
                  Container(
                    height: 18.h,
                    decoration: BoxDecoration(
                      color: getColorByTheme(
                        context: context,
                        colorClass: AppColors.lightGreyColor,
                      ),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                  8.verticalSpace,
                  Container(
                    height: 18.h,
                    decoration: BoxDecoration(
                      color: getColorByTheme(
                        context: context,
                        colorClass: AppColors.lightGreyColor,
                      ),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MessageListShimmer extends StatelessWidget {
  const _MessageListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: getColorByTheme(
          context: context,
          colorClass: AppColors.greyShadeColor,
        ),
        highlightColor: getColorByTheme(
          context: context,
          colorClass: AppColors.lightGreyColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: getColorByTheme(
                      context: context,
                      colorClass: AppColors.lightGreyColor,
                    ),
                    radius: 15,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadiusDirectional.only(
                            topStart: Radius.circular(0),
                            topEnd: Radius.circular(20),
                            bottomEnd: Radius.circular(20),
                            bottomStart: Radius.circular(20)),
                        color: getColorByTheme(
                          context: context,
                          colorClass: AppColors.lightGreyColor,
                        ),
                      ),
                      width: 200.w,
                      child: const ListTile()),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadiusDirectional.only(
                            topStart: Radius.circular(0),
                            topEnd: Radius.circular(20),
                            bottomEnd: Radius.circular(20),
                            bottomStart: Radius.circular(20)),
                        color: getColorByTheme(
                          context: context,
                          colorClass: AppColors.lightGreyColor,
                        ),
                      ),
                      width: 200.w,
                      child: const ListTile()),
                  SizedBox(
                    width: 10.w,
                  ),
                  CircleAvatar(
                    backgroundColor: getColorByTheme(
                      context: context,
                      colorClass: AppColors.lightGreyColor,
                    ),
                    radius: 15,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: getColorByTheme(
                      context: context,
                      colorClass: AppColors.lightGreyColor,
                    ),
                    radius: 15,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadiusDirectional.only(
                            topStart: Radius.circular(0),
                            topEnd: Radius.circular(20),
                            bottomEnd: Radius.circular(20),
                            bottomStart: Radius.circular(20)),
                        color: getColorByTheme(
                          context: context,
                          colorClass: AppColors.lightGreyColor,
                        ),
                      ),
                      width: 200.w,
                      child: const ListTile()),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadiusDirectional.only(
                            topStart: Radius.circular(0),
                            topEnd: Radius.circular(20),
                            bottomEnd: Radius.circular(20),
                            bottomStart: Radius.circular(20)),
                        color: getColorByTheme(
                          context: context,
                          colorClass: AppColors.lightGreyColor,
                        ),
                      ),
                      width: 200.w,
                      child: const ListTile()),
                  SizedBox(
                    width: 10.w,
                  ),
                  CircleAvatar(
                    backgroundColor: getColorByTheme(
                      context: context,
                      colorClass: AppColors.lightGreyColor,
                    ),
                    radius: 15,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: getColorByTheme(
                      context: context,
                      colorClass: AppColors.lightGreyColor,
                    ),
                    radius: 15,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadiusDirectional.only(
                            topStart: Radius.circular(0),
                            topEnd: Radius.circular(20),
                            bottomEnd: Radius.circular(20),
                            bottomStart: Radius.circular(20)),
                        color: getColorByTheme(
                          context: context,
                          colorClass: AppColors.lightGreyColor,
                        ),
                      ),
                      width: 200.w,
                      child: const ListTile()),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadiusDirectional.only(
                            topStart: Radius.circular(0),
                            topEnd: Radius.circular(20),
                            bottomEnd: Radius.circular(20),
                            bottomStart: Radius.circular(20)),
                        color: getColorByTheme(
                          context: context,
                          colorClass: AppColors.lightGreyColor,
                        ),
                      ),
                      width: 200.w,
                      child: const ListTile()),
                  SizedBox(
                    width: 10.w,
                  ),
                  CircleAvatar(
                    backgroundColor: getColorByTheme(
                      context: context,
                      colorClass: AppColors.lightGreyColor,
                    ),
                    radius: 15,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: getColorByTheme(
                      context: context,
                      colorClass: AppColors.lightGreyColor,
                    ),
                    radius: 15,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadiusDirectional.only(
                            topStart: Radius.circular(0),
                            topEnd: Radius.circular(20),
                            bottomEnd: Radius.circular(20),
                            bottomStart: Radius.circular(20)),
                        color: getColorByTheme(
                          context: context,
                          colorClass: AppColors.lightGreyColor,
                        ),
                      ),
                      width: 200.w,
                      child: const ListTile()),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadiusDirectional.only(
                            topStart: Radius.circular(0),
                            topEnd: Radius.circular(20),
                            bottomEnd: Radius.circular(20),
                            bottomStart: Radius.circular(20)),
                        color: getColorByTheme(
                          context: context,
                          colorClass: AppColors.lightGreyColor,
                        ),
                      ),
                      width: 200.w,
                      child: const ListTile()),
                  SizedBox(
                    width: 10.w,
                  ),
                  CircleAvatar(
                    backgroundColor: getColorByTheme(
                      context: context,
                      colorClass: AppColors.lightGreyColor,
                    ),
                    radius: 15,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: getColorByTheme(
                      context: context,
                      colorClass: AppColors.lightGreyColor,
                    ),
                    radius: 15,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadiusDirectional.only(
                            topStart: Radius.circular(0),
                            topEnd: Radius.circular(20),
                            bottomEnd: Radius.circular(20),
                            bottomStart: Radius.circular(20)),
                        color: getColorByTheme(
                          context: context,
                          colorClass: AppColors.lightGreyColor,
                        ),
                      ),
                      width: 200.w,
                      child: const ListTile()),
                ],
              ),
            ],
          ),
        ));
  }
}
