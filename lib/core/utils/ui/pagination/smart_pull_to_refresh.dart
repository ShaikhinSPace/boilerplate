import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'newton_cradle/newton_cradle.dart';

class SmartPullToRefresh extends StatefulWidget {
  final Widget child;
  final Function() onRefresh;
  final ScrollController? scrollController;
  final bool isToEnablePullToRefresh;

  const SmartPullToRefresh({
    super.key,
    required this.child,
    required this.onRefresh,
    this.scrollController,
    this.isToEnablePullToRefresh = true,
  });

  @override
  State<SmartPullToRefresh> createState() => _SmartPullToRefreshState();
}

class _SmartPullToRefreshState extends State<SmartPullToRefresh> {
  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      physics: !widget.isToEnablePullToRefresh
          ? const NeverScrollableScrollPhysics()
          : null,
      scrollController: widget.scrollController,
      controller: _refreshController,
      enablePullUp: false,
      enablePullDown: widget.isToEnablePullToRefresh,
      onRefresh: widget.isToEnablePullToRefresh
          ? () async {
              widget.onRefresh();
              _refreshController.refreshCompleted();
            }
          : null,
      header: WaterDropHeader(
        completeDuration: const Duration(milliseconds: 100),
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
