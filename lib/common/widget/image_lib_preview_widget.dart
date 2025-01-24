import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/common/widget/svg_image_render_widget.dart';
import 'package:record_keeping/core/constants/app_colors.dart';
import 'package:record_keeping/core/constants/assets_source.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';

class ImageLibPreviewWidget extends StatelessWidget {
  final String imageUrl;
  final void Function() onTap;

  const ImageLibPreviewWidget({
    super.key,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          color: getColorByTheme(
            context: context,
            colorClass: AppColors.borderColor,
          ),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topRight,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(2.r),
            child: CachedNetworkImage(
              height: 100.h,
              width: 100.w,
              imageUrl: imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SvgImageRenderWidget(
            svgImagePath: AssetsSource.closeIconSvg,
            svgColor: AppColors.errorColor,
          ).padRight(right: 2.w).padTop(top: 2.h).onTap(() => onTap()),
        ],
      ),
    );
  }
}
