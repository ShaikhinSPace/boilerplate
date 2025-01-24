import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/common/model/color_model.dart';
import 'package:record_keeping/common/widget/text/normal_text_widget.dart';
import 'package:record_keeping/core/typedef/sociair_type_def.dart';

import '../../core/constants/app_colors.dart';

class SwitchWidget extends StatefulWidget {
  final bool isSelected;
  final String title;
  final ColorModel? inactiveThumbColor;
  final double? switchSize;
  final VoidCallbackWithValue<bool> onSelected;

  const SwitchWidget({
    super.key,
    this.isSelected = false,
    required this.title,
    this.onSelected,
    this.inactiveThumbColor,
    this.switchSize,
  });

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  final ValueNotifier<bool> _selectedValue = ValueNotifier<bool>(false);

  @override
  void initState() {
    _selectedValue.value = widget.isSelected;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SwitchWidget oldWidget) {
    if (oldWidget.isSelected != widget.isSelected) {
      _selectedValue.value = widget.isSelected;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        NormalTextWidget(text: widget.title),
        5.horizontalSpace,
        SizedBox(
          height: widget.switchSize ?? 20.h,
          child: FittedBox(
            fit: BoxFit.fill,
            child: ValueListenableBuilder<bool>(
                valueListenable: _selectedValue,
                builder: (BuildContext ctx, bool isSelected, _) {
                  return Switch(
                    onChanged: (bool value) {
                      _selectedValue.value = value;
                      widget.onSelected!(value);
                    },
                    value: isSelected,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    activeColor: getColorByTheme(
                      context: context,
                      colorClass: AppColors.secondaryColor,
                    ),
                    inactiveThumbColor: getColorByTheme(
                      context: context,
                      colorClass:
                          widget.inactiveThumbColor ?? AppColors.greyColor,
                    ),
                    inactiveTrackColor: getColorByTheme(
                      context: context,
                      colorClass: AppColors.whiteColor,
                    ),
                    trackOutlineColor: WidgetStateProperty.resolveWith(
                      (final Set<WidgetState> states) {
                        if (states.contains(WidgetState.selected)) {
                          return null;
                        }
                        return AppColors.greyColor.lightModeColor;
                      },
                    ),
                    activeTrackColor: getColorByTheme(
                      context: context,
                      colorClass: AppColors.infoColor,
                    ),
                    splashRadius: 0,
                  );
                }),
          ),
        ),
      ],
    );
  }
}
