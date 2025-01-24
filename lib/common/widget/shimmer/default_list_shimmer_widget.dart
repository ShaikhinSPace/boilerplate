import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/common/widget/shimmer/shimmer_widget.dart';

import '../list_view_widget.dart';

class DefaultListShimmerWidget extends StatelessWidget {
  const DefaultListShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListViewWidget<int>(
      items: const <int>[1, 2, 3, 4, 5],
      shrinkWrap: true,
      separatorWidget: 10.verticalSpace,
      itemBuilder: (int ctx, int i) {
        return const ShimmerWidget(
          shimmerType: ShimmerType.basicListItem,
        );
      },
    );
  }
}
