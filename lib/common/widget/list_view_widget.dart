import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/core/constants/app_colors.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';

class ListViewWidget<T> extends StatelessWidget {
  final List<T> items;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final Widget Function(T item, int index) itemBuilder;
  final Widget? separatorWidget;
  final int? itemCount;
  final EdgeInsetsGeometry? padding;
  final bool reverse;

  const ListViewWidget({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.shrinkWrap = true,
    this.physics,
    this.separatorWidget,
    this.itemCount,
    this.padding,
    this.reverse = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      reverse: reverse,
      addAutomaticKeepAlives: true,
      addRepaintBoundaries: true,
      physics: physics ?? const NeverScrollableScrollPhysics(),
      padding: padding,
      itemBuilder: (BuildContext ctx, int index) {
        return itemBuilder(items[index], index);
      },
      separatorBuilder: (BuildContext ctx, int index) =>
          separatorWidget ??
          Divider(
            thickness: 0.5,
            color: getColorByTheme(
                    colorClass: AppColors.lightGreyColor, context: context)
                .withOpacity(0.2),
            height: 0,
          ).padVertical(
            vertical: 4.h,
          ),
      itemCount: itemCount ?? items.length,
    );
  }
}
