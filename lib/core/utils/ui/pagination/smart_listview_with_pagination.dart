import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'newton_cradle/newton_cradle.dart';


class SmartListViewWithPagination<T> extends StatefulWidget {
  final Function() onRefresh;
  final Function() onLoading;
  final bool isScrollable;
  final Widget child;
  final bool showRefresh;

  const SmartListViewWithPagination({
    super.key,
    required this.onRefresh,
    required this.onLoading,
    required this.child,
    this.showRefresh = true,
    this.isScrollable = true,
  });

  @override
  State<SmartListViewWithPagination<T>> createState() =>
      _SmartListViewWithPaginationState<T>();
}

class _SmartListViewWithPaginationState<T>
    extends State<SmartListViewWithPagination<T>> {
  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      enablePullUp: true,
      enablePullDown: widget.showRefresh,
      onRefresh: () async {
        widget.onRefresh();
        _refreshController.refreshCompleted();
      },
      onLoading: () async {
        widget.onLoading();
        _refreshController.loadComplete();
      },
      // enablePullDown: !widget.isChat,
      header: WaterDropHeader(
        complete: const SizedBox(),
        waterDropColor: Theme.of(context).primaryColor,
      ),
      footer: CustomFooter(
        loadStyle: LoadStyle.ShowWhenLoading,
        builder: (BuildContext context, LoadStatus? mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body =
                NewtonCradle(size: 50.w, color: Theme.of(context).primaryColor);
          } else if (mode == LoadStatus.loading) {
            body =
                NewtonCradle(size: 50.w, color: Theme.of(context).primaryColor);
          } else if (mode == LoadStatus.failed) {
            body = const Text('Load Failed! Click retry!');
          } else if (mode == LoadStatus.canLoading) {
            body =
                NewtonCradle(size: 50.w, color: Theme.of(context).primaryColor);
          } else {
            body = const SizedBox();
          }
          return SizedBox(
            height: 55.0.h,
            child: Center(child: body),
          );
        },
      ),

      child: widget.child,
    );
  }
}
