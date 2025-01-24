import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/common/widget/svg_image_render_widget.dart';
import 'package:record_keeping/common/widget/text/normal_text_widget.dart';
import 'package:record_keeping/core/constants/assets_source.dart';

class NoDataFoundWidget extends StatelessWidget {
  final String? msg;

  const NoDataFoundWidget({super.key, this.msg});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgImageRenderWidget(
            svgImagePath: AssetsSource.defaultAssetsSource.noDataSvg,
            height: 80.h,
            width: 80.w,
          ),
          10.verticalSpace,
          NormalTextWidget(text: msg ?? 'No Data Found')
        ],
      ),
    );
  }
}
