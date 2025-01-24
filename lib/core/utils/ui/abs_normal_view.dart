import 'package:flutter/material.dart';
import 'package:record_keeping/common/widget/no_data_found_widget.dart';
import 'package:record_keeping/core/utils/ui/pagination/smart_pull_to_refresh.dart';

import '../../enums/sociair_enums.dart';

class AbsNormalView extends StatelessWidget {
  final AbsNormalStatus absNormalStatus;
  final List<dynamic>? data;
  final Widget? errorWidget;
  final Widget? loadingWidget;
  final Widget? noDataWidget;
  final Widget child;
  final void Function() onTapToRefresh;
  final bool isToEnablePullToRefresh;

  const AbsNormalView({
    super.key,
    required this.absNormalStatus,
    required this.onTapToRefresh,
    required this.child,
    this.data,
    this.errorWidget,
    this.loadingWidget,
    this.noDataWidget,
    this.isToEnablePullToRefresh = true,
  });

  @override
  Widget build(BuildContext context) {
    switch (absNormalStatus) {
      case AbsNormalStatus.initial:
        return const SizedBox.shrink();
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
        return data != null && data!.isEmpty
            ? Center(
                child: noDataWidget ?? const NoDataFoundWidget(),
              )
            : isToEnablePullToRefresh
                ? SmartPullToRefresh(
                    isToEnablePullToRefresh: isToEnablePullToRefresh,
                    onRefresh: onTapToRefresh,
                    child: child,
                  )
                : child;
      default:
        return const SizedBox.shrink();
    }
  }
}
