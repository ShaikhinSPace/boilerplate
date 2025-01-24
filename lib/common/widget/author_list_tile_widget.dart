import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/common/model/color_model.dart';
import 'package:record_keeping/common/widget/text/medium_title_widget.dart';
import 'package:record_keeping/common/widget/text/normal_text_widget.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/sociair_default_constants.dart';
import '../../core/utils/ui/network_image/circular_cached_network_image.dart';

class AuthorTitleConfig {
  final String? title;
  final double? titleFontSize;
  final FontWeight? titleFontWeight;
  final ColorModel? titleFontColor;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final Widget? spaceWidget;
  final int maxLines;

  AuthorTitleConfig({
    this.titleFontSize,
    this.title,
    this.prefixWidget,
    this.suffixWidget,
    this.spaceWidget,
    this.titleFontColor,
    this.titleFontWeight,
    this.maxLines = 2,
  });
}

class AuthorImageConfig {
  final String? authorName;
  final String? imageUrl;
  final String? assetImage;
  final String? placeholderSvgImage;
  final double? imageSize;
  final bool isToDisplayAuthor;
  final bool removeAuthorImagePadding;

  AuthorImageConfig({
    this.imageUrl,
    this.assetImage,
    this.placeholderSvgImage,
    this.imageSize,
    this.isToDisplayAuthor = true,
    this.removeAuthorImagePadding = false,
    this.authorName,
  });
}

class AuthorDecorationConfig {
  final ColorModel? borderColor;
  final ColorModel? backgroundColor;
  final double? borderSize;
  final double? borderRadius;
  final bool isBorderRequired;

  AuthorDecorationConfig({
    this.borderColor,
    this.backgroundColor,
    this.borderSize,
    this.borderRadius,
    this.isBorderRequired = false,
  });
}

class AuthorListTileModel {
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final Widget? suffixWidget;
  final Widget? bottomWidget;
  final AuthorTitleConfig? titleConfig;
  final AuthorTitleConfig? descConfig;
  final AuthorImageConfig? authorImageConfig;
  final AuthorDecorationConfig? authorDecorationConfig;

  AuthorListTileModel({
    this.suffixWidget,
    this.bottomWidget,
    this.titleConfig,
    this.descConfig,
    this.authorImageConfig,
    this.authorDecorationConfig,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
  });
}

class AuthorListTileWidget extends StatefulWidget {
  final AuthorListTileModel authorListTileModel;

  const AuthorListTileWidget({
    super.key,
    required this.authorListTileModel,
  });

  @override
  State<AuthorListTileWidget> createState() => _AuthorListTileWidgetState();
}

class _AuthorListTileWidgetState extends State<AuthorListTileWidget> {
  AuthorTitleConfig? titleConfig;
  AuthorTitleConfig? descConfig;
  AuthorImageConfig? authorImageConfig;

  bool removeAuthorImagePadding = false;
  AuthorDecorationConfig? authorDecorationConfig;
  bool isBorderRequired = false;

  @override
  Widget build(BuildContext context) {
    titleConfig = widget.authorListTileModel.titleConfig;
    descConfig = widget.authorListTileModel.descConfig;
    authorImageConfig = widget.authorListTileModel.authorImageConfig;
    removeAuthorImagePadding =
        authorImageConfig?.removeAuthorImagePadding ?? false;
    authorDecorationConfig = widget.authorListTileModel.authorDecorationConfig;
    isBorderRequired = authorDecorationConfig?.isBorderRequired ?? false;
    return Container(
      decoration: BoxDecoration(
        color: authorDecorationConfig?.backgroundColor != null
            ? getColorByTheme(
                context: context,
                colorClass: authorDecorationConfig!.backgroundColor!,
              )
            : null,
        borderRadius: isBorderRequired
            ? BorderRadius.all(
                Radius.circular(
                  authorDecorationConfig?.borderRadius ?? kDefaultBorderRadius,
                ),
              )
            : null,
        border: isBorderRequired
            ? Border.all(
                width:
                    authorDecorationConfig?.borderSize ?? kDefaultBorderWidth,
                color: getColorByTheme(
                  context: context,
                  colorClass: authorDecorationConfig?.borderColor != null
                      ? authorDecorationConfig!.borderColor!
                      : AppColors.borderColor,
                ),
              )
            : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (widget.authorListTileModel.suffixWidget != null) ...<Widget>{
            widget.authorListTileModel.suffixWidget!,
          },
          Expanded(
            child: Row(
              crossAxisAlignment:
                  widget.authorListTileModel.crossAxisAlignment ??
                      CrossAxisAlignment.start,
              mainAxisAlignment: widget.authorListTileModel.mainAxisAlignment ??
                  MainAxisAlignment.start,
              children: <Widget>[
                if (authorImageConfig?.isToDisplayAuthor ?? false)
                  CircularCachedNetworkImage(
                    size: authorImageConfig?.imageSize ?? 40.w,
                    imageUrl: authorImageConfig?.imageUrl ?? '',
                    fallBackString: titleConfig?.title,
                    defaultAsset: authorImageConfig?.assetImage,
                  )
                      .padLeft(
                          left: removeAuthorImagePadding
                              ? 0
                              : kDefault10HorizontalSpace)
                      .padTop(
                        top: removeAuthorImagePadding
                            ? 0
                            : kDefault10VerticalSpace,
                      )
                      .padBottom(
                        bottom: removeAuthorImagePadding
                            ? 0
                            : kDefault10VerticalSpace,
                      ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          if (titleConfig?.prefixWidget != null) ...<Widget>{
                            titleConfig!.prefixWidget!,
                            2.horizontalSpace,
                          },
                          Expanded(
                            child: MediumTitleWidget(
                              title: titleConfig?.title ?? '',
                              maxLines: titleConfig?.maxLines,
                              fontWeight: titleConfig?.titleFontWeight,
                              fontColor: titleConfig?.titleFontColor,
                              fontSize: titleConfig?.titleFontSize,
                            ),
                          ),
                          if (titleConfig?.suffixWidget != null) ...<Widget>{
                            2.horizontalSpace,
                            titleConfig!.suffixWidget!,
                          },
                        ],
                      ).visible(widget.authorListTileModel.titleConfig != null),
                      widget.authorListTileModel.titleConfig?.spaceWidget ??
                          const SizedBox(),
                      if (descConfig?.title != null) ...<Widget>{
                        2.verticalSpace,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            if (descConfig?.prefixWidget != null) ...<Widget>{
                              descConfig!.prefixWidget!,
                              2.horizontalSpace,
                            },
                            Expanded(
                              child: NormalTextWidget(
                                text: descConfig?.title ?? '',
                                maxLines: descConfig?.maxLines,
                                fontColor: descConfig?.titleFontColor,
                                fontWeight: descConfig?.titleFontWeight,
                                fontSize: descConfig?.titleFontSize,
                              ),
                            ),
                            if (descConfig?.suffixWidget != null) ...<Widget>{
                              2.horizontalSpace,
                              descConfig!.suffixWidget!,
                            },
                          ],
                        ),
                      },
                      widget.authorListTileModel.descConfig?.spaceWidget ??
                          const SizedBox(),
                      if (widget.authorListTileModel.bottomWidget !=
                          null) ...<Widget>{
                        2.verticalSpace,
                        widget.authorListTileModel.bottomWidget!,
                      },
                    ],
                  ).padAll(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
