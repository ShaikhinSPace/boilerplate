import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/common/model/color_model.dart';
import 'package:record_keeping/common/widget/svg_image_render_widget.dart';
import 'package:record_keeping/core/extensions/string_extension.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';
import 'package:record_keeping/core/utils/ui/network_image/avatar_box_decoration.dart';
import 'package:record_keeping/core/utils/ui/network_image/default_name_image_widget.dart';

class CircularCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final String? fallBackString;
  final double? size;
  final BoxFit? fit;
  final PlaceholderWidgetBuilder? placeholder;
  final LoadingErrorWidgetBuilder? errorWidget;
  final bool isToEnableBorder;
  final ColorModel? bgColor;
  final String? defaultAsset;

  const CircularCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.fallBackString,
    this.size,
    this.fit,
    this.placeholder,
    this.errorWidget,
    this.isToEnableBorder = false,
    this.bgColor,
    this.defaultAsset,
  });

  @override
  Widget build(BuildContext context) {
    return AvatarBoxDecorationWidget(
      height: size,
      width: size,
      isToEnableBorder: isToEnableBorder,
      child: CachedNetworkImage(
        cacheKey: imageUrl,
        imageUrl: imageUrl,
        fit: fit ?? BoxFit.cover,
        placeholder: placeholder,
        errorWidget: errorWidget ??
            (BuildContext context, String url, Object error) => defaultAsset !=
                    null
                ? AvatarBoxDecorationWidget(
                    child: SvgImageRenderWidget(
                      svgImagePath: defaultAsset!,
                    ).padAll(value: 4.r),
                  )
                : DefaultNameImageWidget(
                    name: fallBackString?.toUpperCase().firstLetter() ?? 'N/A',
                    size: size,
                    bgColor: bgColor,
                  ),
      ),
    );
  }
}
