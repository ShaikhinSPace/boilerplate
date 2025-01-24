import 'package:flutter/material.dart';
import 'package:record_keeping/core/typedef/sociair_type_def.dart';

import '../../core/constants/app_colors.dart';

class CheckBoxWidget extends StatefulWidget {
  final bool isSelected;
  final VoidCallbackWithValue<bool> onChanged;

  const CheckBoxWidget({
    super.key,
    required this.onChanged,
    this.isSelected = false,
  });

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  final ValueNotifier<bool> _isSelected = ValueNotifier<bool>(false);

  @override
  void initState() {
    _isSelected.value = widget.isSelected;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CheckBoxWidget oldWidget) {
    if (widget.isSelected != oldWidget.isSelected) {
      _isSelected.value = widget.isSelected;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: _isSelected,
        builder: (_, bool isSelected, __) {
          return Checkbox(
            checkColor: Colors.white,
            materialTapTargetSize: MaterialTapTargetSize.padded,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.0),
              side: WidgetStateBorderSide.resolveWith(
                (Set<WidgetState> states) => BorderSide(
                  width: 1.0,
                  color: getColorByTheme(
                    context: context,
                    colorClass: isSelected
                        ? AppColors.secondaryColor
                        : AppColors.greyColor,
                  ),
                ),
              ),
            ),
            side: WidgetStateBorderSide.resolveWith(
              (Set<WidgetState> states) => BorderSide(
                width: 1.0,
                color: getColorByTheme(
                  context: context,
                  colorClass: isSelected
                      ? AppColors.secondaryColor
                      : AppColors.greyColor,
                ),
              ),
            ),
            activeColor: getColorByTheme(
              context: context,
              colorClass: AppColors.darkGreyColor,
            ),
            value: isSelected,
            onChanged: widget.onChanged,
          );
        });
  }
}
