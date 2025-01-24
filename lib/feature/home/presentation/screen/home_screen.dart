import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
// import 'package:local_auth/local_auth.dart';
import 'package:record_keeping/common/appbar/sociair_appbar.dart';
import 'package:record_keeping/common/widget/author_list_tile_widget.dart';
import 'package:record_keeping/common/widget/button/input_button.dart';
import 'package:record_keeping/common/widget/list_view_widget.dart';
import 'package:record_keeping/common/widget/shimmer/shimmer_widget.dart';
import 'package:record_keeping/common/widget/text/heading_text_widget.dart';
import 'package:record_keeping/common/widget/text/medium_title_widget.dart';
import 'package:record_keeping/common/widget/text/normal_text_widget.dart';
import 'package:record_keeping/core/constants/app_colors.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';
import 'package:record_keeping/core/utils/location_helper.dart';
import 'package:record_keeping/core/utils/ui/abs_pagination_view.dart';
import 'package:record_keeping/core/utils/ui/network_image/sociair_cached_network_widget.dart';
import 'package:record_keeping/feature/home/presentation/cubit/library_list_cubit.dart';

import '../../../../common/widget/svg_image_render_widget.dart';
import '../../../../core/config/di/di_injectable.dart';
import '../../../../core/constants/assets_source.dart';
import '../../../../core/routing/navigation_service.dart';
import '../../../../core/routing/route_name.dart';
import '../../../../core/utils/abs_state/abs_pagination_state.dart';
import '../../domain/dao/image_remarks_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final LocalAuthentication auth = LocalAuthentication();

  @override
  void initState() {
    _loadLibraryListData(isToRefresh: true);

    // auth.isDeviceSupported().then(
    //       (bool isSupported) => setState(() => _supportState = isSupported
    //           ? _SupportState.supported
    //           : _SupportState.unsupported),
    //     );
    // _authenticateWithBiometrics();
    super.initState();
  }

  void _loadLibraryListData({
    bool isToRefresh = false,
  }) {
    getIt<LibraryListCubit>().getLibraryListData(
      isToRefresh: isToRefresh,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SociairAppBar(
        title: 'Library',
        isCenterTitle: false,
        action: <Widget>[
          InkWell(
            onTap: () {
              getIt<NavigationService>()
                  .pushNamed(RouteName.uploadImageScreenRoute);
            },
            child: Container(
              margin: EdgeInsets.only(right: 10.w),
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
                vertical: 2.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(
                  color: getColorByTheme(
                    context: context,
                    colorClass: AppColors.borderColor,
                  ),
                ),
              ),
              child: Row(
                children: <Widget>[
                  SvgImageRenderWidget(
                    svgImagePath: AssetsSource.chatAssetsSource.gallerySvg,
                    height: 15.w,
                    width: 15.w,
                    svgColor: AppColors.borderColor,
                  ),
                  4.horizontalSpace,
                  NormalTextWidget(
                    text: 'Upload Image',
                    fontColor: AppColors.greyColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<LibraryListCubit,
          AbsPaginationState<List<ImageRemarksModel>>>(
        builder: (BuildContext ctx,
            AbsPaginationState<List<ImageRemarksModel>> state) {
          List<ImageRemarksModel> images = <ImageRemarksModel>[...?state.data];
          Map<String, List<ImageRemarksModel>> groupedData = groupBy(
            state.data ?? <ImageRemarksModel>[],
            (ImageRemarksModel key) => DateFormat('dd MMM yyyy').format(
              DateTime.parse(key.createdAt ?? ''),
            ),
          );

          return AbsPaginationView<ImageRemarksModel>(
            onLoadMore: () => _loadLibraryListData(),
            onTapToRefresh: () => _loadLibraryListData(isToRefresh: true),
            errorWidget: ErrorViewWidget(
              onRetry: () => _loadLibraryListData(isToRefresh: true),
            ),
            absNormalStatus: state.absNormalStatus,
            data: images,
            loadingWidget: ListViewWidget<int>(
              shrinkWrap: true,
              items: const <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
              itemCount: 10,
              itemBuilder: (int ctx, int i) =>
                  const ShimmerWidget(shimmerType: ShimmerType.basicListItem),
              separatorWidget: 10.verticalSpace,
            ),
            child: ListViewWidget<ImageRemarksModel>(
              padding:
                  EdgeInsets.symmetric(horizontal: 5.w).copyWith(bottom: 100.h),
              items: images,
              shrinkWrap: true,
              itemCount: groupedData.keys.length,
              separatorWidget: 10.verticalSpace,
              itemBuilder: (ImageRemarksModel ctx, int i) {
                String date = groupedData.keys.elementAt(i);
                List<ImageRemarksModel> groupedListData =
                    groupedData[date] ?? <ImageRemarksModel>[];

                ImageRemarksModel imageRemarksModel = images[i];

                List<String> imagesUrlList =
                    imageRemarksModel.images ?? <String>[];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MediumTitleWidget(
                      title: date,
                    ),
                    4.verticalSpace,
                    ListViewWidget<ImageRemarksModel>(
                      items: groupedListData,
                      itemBuilder: (Object? item, int index) =>
                          AuthorListTileWidget(
                        authorListTileModel: AuthorListTileModel(
                          suffixWidget: (imagesUrlList).isEmpty
                              ? null
                              : Stack(
                                  alignment: Alignment.bottomRight,
                                  clipBehavior: Clip.none,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 100.w,
                                      height: 80.h,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          child: SociairCachedNetworkImage(
                                            imageUrl:
                                                imagesUrlList.firstOrNull ?? '',
                                            placeholder:
                                                (BuildContext ctx, String st) {
                                              return SvgImageRenderWidget(
                                                svgImagePath: AssetsSource
                                                    .defaultAssetsSource
                                                    .placeHolderSvg,
                                              );
                                            },
                                          )
                                          // CachedNetworkImage(
                                          //   width: 100.w,
                                          //   height: 80.h,
                                          //   imageUrl: imagesUrlList.first,
                                          // ),
                                          ),
                                    ),
                                    if (imagesUrlList.length > 1)
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 5.w,
                                          vertical: 2.h,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          color: getColorByTheme(
                                            context: context,
                                            colorClass: AppColors.blackColor,
                                          ),
                                        ),
                                        child: NormalTextWidget(
                                          text:
                                              '+ ${(imageRemarksModel.images ?? <String>[]).length - 1}',
                                          fontWeight: FontWeight.w600,
                                          fontColor: AppColors.whiteColor,
                                        ),
                                      ),
                                  ],
                                ).padLeft(left: 10.w).padRight(right: 5.w),
                          titleConfig: AuthorTitleConfig(
                            title: imageRemarksModel.currentLocation,
                            spaceWidget: 5.verticalSpace,
                          ),
                          descConfig: AuthorTitleConfig(
                            title: DateFormat('h:mm a').format(
                              DateTime.parse(
                                imageRemarksModel.createdAt ?? '',
                              ),
                            ),
                            //  DateFormat('yyyy-MM-ddThh:mm:ss')
                            //     .parse(imageRemarksModel.createdAt ?? '')
                            //     .toString(),
                            spaceWidget: 3.verticalSpace,
                          ),
                          bottomWidget: NormalTextWidget(
                            text: imageRemarksModel.remarks ?? '',
                          ),
                          authorDecorationConfig: AuthorDecorationConfig(
                            isBorderRequired: true,
                            borderRadius: 10.r,
                            backgroundColor: AppColors.lightGreyColor,
                            borderColor: AppColors.transparentColor,
                          ),
                        ),
                      ).onTap(() {
                        getIt<NavigationService>().pushNamed(
                          RouteName.libraryDetailScreen,
                          extra: imageRemarksModel,
                        );
                      }),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ErrorViewWidget extends StatelessWidget {
  final void Function() onRetry;

  const ErrorViewWidget({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        20.verticalSpace,
        Image.asset(
          'assets/png/error.png',
        ),
        20.verticalSpace,
        const HeadingTextWidget(
          title: 'Something went wrong.',
        ),
        5.verticalSpace,
        const MediumTitleWidget(
          title: 'Please ! try again later.',
        ),
        10.verticalSpace,
        InputButtonWidget(
          title: 'Retry',
          onTap: onRetry,
          width: 100.w,
          height: 30.h,
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}
