import 'package:flutter/material.dart';
import 'package:record_keeping/core/extensions/responsive_context_extension.dart';

import '../../enums/sociair_enums.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget col2View;
  final Widget col4View;
  final Widget col6View;
  final Widget col8View;
  final Widget col10View;
  final Widget col12View;

  const ResponsiveWidget({
    super.key,
    required this.col2View,
    required this.col4View,
    required this.col6View,
    required this.col8View,
    required this.col10View,
    required this.col12View,
  });

  @override
  Widget build(BuildContext context) {
    switch (context.getResponsiveDeviceType()) {
      case ResponsiveDeviceType.col12:
        return col12View;
      case ResponsiveDeviceType.col10:
        return col10View;
      case ResponsiveDeviceType.col8:
        return col8View;
      case ResponsiveDeviceType.col6:
        return col6View;
      case ResponsiveDeviceType.col4:
        return col4View;
      default:
        return col2View;
    }
  }
}
