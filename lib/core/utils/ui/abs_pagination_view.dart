import 'package:flutter/material.dart';
import 'package:record_keeping/common/widget/no_data_found_widget.dart';
import 'package:record_keeping/core/utils/ui/pagination/smart_listview_with_pagination.dart';

import '../../enums/sociair_enums.dart';

class AbsPaginationView<T> extends StatelessWidget {
  final bool isToHideRefresh;
  final AbsNormalStatus absNormalStatus;
  final Widget? initialWidget;
  final Widget? errorWidget;
  final Widget? loadingWidget;
  final Widget? noDataWidget;
  final Widget child;
  final void Function() onTapToRefresh;
  final void Function() onLoadMore;
  final List<T> data;

  const AbsPaginationView({
    super.key,
    required this.absNormalStatus,
    required this.data,
    required this.onTapToRefresh,
    required this.onLoadMore,
    required this.child,
    this.errorWidget,
    this.loadingWidget,
    this.isToHideRefresh = false,
    this.noDataWidget,
    this.initialWidget,
  });

  @override
  Widget build(BuildContext context) {
    switch (absNormalStatus) {
      case AbsNormalStatus.initial:
        if (initialWidget != null) {
          return initialWidget!;
        } else {
          return Center(
            child: loadingWidget ?? const CircularProgressIndicator(),
          );
        }
      case AbsNormalStatus.loading:
        if (loadingWidget != null) {
          return loadingWidget!;
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      case AbsNormalStatus.error:
        if (errorWidget != null) {
          return errorWidget!;
        } else {
          return const Text('Error');
        }
      case AbsNormalStatus.success:
        if (data.isEmpty && noDataWidget != null) {
          return noDataWidget!;
        } else if (data.isEmpty && noDataWidget == null) {
          return const NoDataFoundWidget();
        } else {
          return SmartListViewWithPagination<T>(
            showRefresh: !isToHideRefresh,
            onRefresh: onTapToRefresh,
            onLoading: onLoadMore,
            child: child,
          );
        }
      default:
        return const SizedBox.shrink();
    }
  }
}
