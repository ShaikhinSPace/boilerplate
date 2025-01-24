import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/common/appbar/sociair_appbar.dart';
import 'package:record_keeping/common/widget/list_view_widget.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';
import 'package:record_keeping/core/utils/map/map_utils.dart';
import 'package:record_keeping/core/utils/ui/abs_normal_view.dart';
import 'package:record_keeping/feature/home/presentation/cubit/library_detail_by_id_cubit.dart';
import 'package:record_keeping/feature/home/presentation/screen/home_screen.dart';

import '../../../../common/widget/text/medium_title_widget.dart';
import '../../../../core/config/di/di_injectable.dart';
import '../../../../core/enums/sociair_enums.dart';
import '../../../../core/routing/navigation_service.dart';
import '../../../../core/routing/route_name.dart';
import '../../../../core/utils/abs_state/abs_normal_state.dart';
import '../../../image_library/presentation/screens/image_preview_screen.dart';
import '../../domain/dao/image_remarks_model.dart';

class LibraryDetailScreen extends StatefulWidget {
  final ImageRemarksModel imageRemarksModel;

  const LibraryDetailScreen({
    super.key,
    required this.imageRemarksModel,
  });

  @override
  State<LibraryDetailScreen> createState() => _LibraryDetailScreenState();
}

class _LibraryDetailScreenState extends State<LibraryDetailScreen> {
  @override
  void initState() {
    _loadLibraryDetailById();
    super.initState();
  }

  void _loadLibraryDetailById() {
    context.read<LibraryDetailByIdCubit>().getLibraryDetailById(
          libraryId: widget.imageRemarksModel.id.toString(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SociairAppBar(
        action: <Widget>[
          const MediumTitleWidget(
            title: 'View on map',
            textDecoration: TextDecoration.underline,
            maxLines: 80,
            fontWeight: FontWeight.w400,
          ).onTap(() {
            // MapUtils.openMap(
            //   latitude: widget.imageRemarksModel.latitude,
            //   longitude: widget.imageRemarksModel.longitude,
            // );
          }),
          10.horizontalSpace
        ],
      ),
      body: BlocBuilder<LibraryDetailByIdCubit,
          AbsNormalState<ImageRemarksModel?>>(
        builder: (BuildContext ctx, AbsNormalState<ImageRemarksModel?> state) {
          ImageRemarksModel? imageRemarksModel = state.data;
          List<String> images = imageRemarksModel?.images ?? <String>[];
          return AbsNormalView(
            onTapToRefresh: () => _loadLibraryDetailById(),
            errorWidget: ErrorViewWidget(
              onRetry: () => _loadLibraryDetailById(),
            ),
            absNormalStatus: state.absNormalStatus,
            child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: MediumTitleWidget(
                    title: imageRemarksModel?.remarks ?? '',
                    maxLines: 80,
                    fontWeight: FontWeight.w400,
                  ).padHorizontal(),
                ),
                SliverToBoxAdapter(child: 10.verticalSpace),
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: MediumTitleWidget(
                          title: 'Latitude: ${imageRemarksModel?.latitude}',
                          maxLines: 80,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      5.horizontalSpace,
                      Expanded(
                        child: MediumTitleWidget(
                          title: 'Longitude: ${imageRemarksModel?.longitude}',
                          maxLines: 80,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ).padHorizontal(),
                ),
                SliverToBoxAdapter(child: 10.verticalSpace),
                SliverToBoxAdapter(
                  child: ListViewWidget(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    separatorWidget: 10.verticalSpace,
                    items: images,
                    itemBuilder: (String ctx, int i) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(4.r),
                        child: CachedNetworkImage(
                          imageUrl: images[i],
                        ),
                      ).onTap(() {
                        getIt<NavigationService>().pushNamed(
                            RouteName.imagePreviewScreenRoute,
                            extra: <AttachmentModel>[
                              AttachmentModel(
                                attachmentType: AttachmentType.image,
                                id: imageRemarksModel?.id ?? -1,
                                path: images[i],
                              )
                            ]);
                      });
                    },
                    itemCount: images.length,
                  ),
                ),
                SliverToBoxAdapter(child: 50.verticalSpace),
              ],
            ),
          );
        },
      ),
    );
  }
}
