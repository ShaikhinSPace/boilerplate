import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/common/widget/text/medium_title_widget.dart';
import 'package:record_keeping/common/widget/text/normal_text_widget.dart';
import 'package:record_keeping/core/extensions/responsive_context_extension.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';
import 'package:record_keeping/core/services/tabbar_count_service.dart';
import 'package:record_keeping/core/utils/ui/responsive_widget.dart';

import '../../../../common/model/color_model.dart';
import '../../../../common/model/responsive_value_model.dart';
import '../../../../common/model/tab_bar_model.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/sociair_default_constants.dart';
import '../../../../core/enums/sociair_enums.dart';
import '../../../../core/typedef/sociair_type_def.dart';

class TabBarWidget extends StatefulWidget {
  final List<TabBarModel> tabItems;
  final int selectedTabIndex;
  final ColorModel? borderColor;
  final ColorModel? selectedBorderColor;
  final ColorModel? backgroundColor;
  final ColorModel? dividerColor;
  final ColorModel? fontColor;
  final ColorModel? selectedFontColor;
  final ResponsiveValueModel dividerThickness;
  final TabType tabType;
  final VoidCallbackWithValue<TabBarModel>? onTap;
  final bool showCount;

  const TabBarWidget({
    super.key,
    required this.tabItems,
    this.selectedTabIndex = 0,
    this.dividerThickness = const ResponsiveValueModel(
      col2Value: 3,
      col4Value: 3,
      col6Value: 3,
      col8Value: 3,
      col10Value: 3,
      col12Value: 3,
    ),
    this.borderColor,
    this.selectedBorderColor,
    this.backgroundColor,
    this.dividerColor,
    this.fontColor,
    this.selectedFontColor,
    this.tabType = TabType.normal,
    this.onTap,
    this.showCount = false,
  });

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  @override
  void initState() {
    _selectedIndex.value = widget.selectedTabIndex;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TabBarWidget oldWidget) {
    if (oldWidget.selectedTabIndex != widget.selectedTabIndex) {
      _selectedIndex.value = widget.selectedTabIndex;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.getResponsiveValueByDeviceType(
        responsiveValue: ResponsiveValueModel(
          col2Value: widget.tabType == TabType.normal ? 25.h : 22.h,
          col4Value: widget.tabType == TabType.normal ? 45.h : 28.h,
          col6Value: widget.tabType == TabType.normal ? 45.h : 42.h,
          col8Value: widget.tabType == TabType.normal ? 50.h : 55.h,
          col10Value: widget.tabType == TabType.normal ? 50.h : 55.h,
          col12Value: widget.tabType == TabType.normal ? 25.h : 25.h,
        ),
      ),
      child: ListView.separated(
        separatorBuilder: (BuildContext ctx, int index) =>
            widget.tabType == TabType.normal
                ? 0.horizontalSpace
                : ResponsiveWidget(
                    col2View: 10.horizontalSpace,
                    col4View: 10.horizontalSpace,
                    col6View: 10.horizontalSpace,
                    col8View: 10.horizontalSpace,
                    col10View: 10.horizontalSpace,
                    col12View: 2.horizontalSpace,
                  ),
        itemBuilder: (BuildContext ctx, int index) {
          TabBarModel tabItemModel = widget.tabItems[index];
          return ValueListenableBuilder<int>(
              valueListenable: _selectedIndex,
              builder: (BuildContext ctx, int selectedIndex, __) {
                final bool isSelected = selectedIndex == index;
                return Container(
                  margin: EdgeInsets.zero,
                  decoration: widget.tabType == TabType.normal
                      ? null
                      : BoxDecoration(
                          color: isSelected && widget.backgroundColor != null
                              ? getColorByTheme(
                                  context: context,
                                  colorClass: widget.backgroundColor!)
                              : null,
                          border: widget.borderColor != null &&
                                  widget.selectedBorderColor != null
                              ? Border.all(
                                  color: isSelected
                                      ? getColorByTheme(
                                          context: context,
                                          colorClass:
                                              widget.selectedBorderColor!)
                                      : getColorByTheme(
                                          context: context,
                                          colorClass: widget.borderColor!),
                                  width: 1.w,
                                )
                              : null,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              kDefaultBorderRadius - 4.r,
                            ),
                          ),
                        ),
                  child: IntrinsicWidth(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            MediumTitleWidget(
                              title: tabItemModel.title,
                              fontColor:
                                  isSelected && widget.selectedFontColor != null
                                      ? widget.selectedFontColor!
                                      : widget.fontColor,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                            ).padHorizontal(
                              horizontal:
                                  // widget.tabType == TabType.normal ? 8.w : 5.w,
                                  widget.tabType == TabType.normal
                                      ? 8.w
                                      : context.getResponsiveValueByDeviceType(
                                          responsiveValue: ResponsiveValueModel(
                                            col2Value: 5.w,
                                            col4Value: 5.w,
                                            col6Value: 5.w,
                                            col8Value: 5.w,
                                            col10Value: 5.w,
                                            col12Value: 0.025.w,
                                          ),
                                        ),
                            ),
                            NormalTextWidget(
                              text: '(${TabbarCountService.convertIntoThousands(
                                tabItemModel.count,
                              )})',
                              fontColor:
                                  isSelected && widget.selectedFontColor != null
                                      ? widget.selectedFontColor!
                                      : widget.fontColor,
                            ).visible(widget.showCount &&
                                (tabItemModel.count != null)),
                          ],
                        ),
                        if (widget.tabType == TabType.normal) ...<Widget>{
                          2.verticalSpace,
                          Container(
                            height: context.getResponsiveValueByDeviceType(
                              responsiveValue: widget.dividerThickness,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected && widget.dividerColor != null
                                  ? getColorByTheme(
                                      context: context,
                                      colorClass: widget.dividerColor!)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(kDefaultBorderRadius),
                                topRight: Radius.circular(kDefaultBorderRadius),
                              ),
                            ),
                          ),
                        },
                      ],
                    ).padHorizontal(horizontal: 5.w),
                  ),
                ).onTap(
                  () {
                    _selectedIndex.value = index;
                    if (widget.onTap != null) {
                      widget.onTap!(tabItemModel);
                    }
                  },
                );
              });
        },
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: widget.tabItems.length,
      ),
    );
  }
}
