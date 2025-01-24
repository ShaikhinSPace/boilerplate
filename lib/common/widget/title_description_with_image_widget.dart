import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/common/widget/author_list_tile_widget.dart';
import 'package:record_keeping/common/widget/text/normal_text_widget.dart';
import 'package:record_keeping/common/widget/text/title_widget.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/sociair_default_constants.dart';
import '../../core/utils/ui/network_image/sociair_cached_network_widget.dart';

class TitleDescriptionWithImageWidget extends StatelessWidget {
  final String title;
  final String description;
  final bool isBorderRequired;
  final bool isToDisplayImage;
  final bool isToDisplayImageAtTop;
  final bool isToDisplayImageAtBottom;
  final String? imageUrl;
  final bool hasAuthor;
  final AuthorListTileModel? authorListTileModel;

  const TitleDescriptionWithImageWidget({
    super.key,
    required this.title,
    required this.description,
    this.isBorderRequired = true,
    this.isToDisplayImage = false,
    this.isToDisplayImageAtTop = false,
    this.imageUrl,
    this.isToDisplayImageAtBottom = false,
    this.hasAuthor = false,
    this.authorListTileModel,
  })  : assert(
          !(isToDisplayImage &&
              !(isToDisplayImageAtTop || isToDisplayImageAtBottom) &&
              imageUrl != null),
          'If isToDisplayImage is true,'
          'isToDisplayImageAtTop or '
          'isToDisplayImageAtBottom must also be true.',
        ),
        assert(
          !(!hasAuthor && authorListTileModel != null),
          'If hasAuthor is true,'
          'value must be set on authorListTileModel',
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: isBorderRequired
            ? BorderRadius.all(Radius.circular(kDefaultBorderRadius))
            : null,
        border: isBorderRequired
            ? Border.all(
                width: kDefaultBorderWidth,
                color: getColorByTheme(
                  context: context,
                  colorClass: AppColors.borderColor,
                ),
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (hasAuthor && authorListTileModel != null) ...<Widget>{
            AuthorListTileWidget(
              authorListTileModel: authorListTileModel!,
            ),
            defaultVerticalSpace,
          },
          if (isToDisplayImageAtTop) ...<Widget>{
            SociairCachedNetworkImage(
              imageUrl: imageUrl ?? '',
              height: 200.h,
              fit: BoxFit.cover,
            ),
            defaultVerticalSpace,
          },
          TitleWidget(title: title),
          defaultVerticalSpace,
          NormalTextWidget(text: description, maxLines: 3),
          if (isToDisplayImageAtBottom) ...<Widget>{
            defaultVerticalSpace,
            SociairCachedNetworkImage(
              imageUrl: imageUrl ?? '',
              height: 200.h,
              fit: BoxFit.cover,
            ),
            defaultVerticalSpace,
          },
        ],
      ).padAll(),
    );
  }
}
