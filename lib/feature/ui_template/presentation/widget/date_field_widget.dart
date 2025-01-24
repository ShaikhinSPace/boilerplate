import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:record_keeping/common/model/color_model.dart';
import 'package:record_keeping/common/widget/text/normal_text_widget.dart';
import 'package:record_keeping/core/constants/app_colors.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';
import 'package:record_keeping/core/utils/ui/responsive_widget.dart';
import 'package:record_keeping/feature/ui_template/presentation/widget/text_field_widget.dart';

class DateFieldWidget extends StatefulWidget {
  final String? labelText;
  final ColorModel? labelTextColor;
  final TextEditingController? controller;
  final double? fontSize;
  final ColorModel? iconColor;
  final String? initialValue;
  final DateFormat? dateFormat;
  final bool isChangeDateFormat;
  final String? hintText;
  final Function(String?)? validator;
  final FontWeight? labelFontWeight;
  final DateTime? lastDate;
  final Function(String val)? onChanged;

  final DateTime? firstDate;
  final Function()? furtherOnTapFunction;

  const DateFieldWidget(
      {this.labelText,
      this.labelTextColor,
      this.controller,
      this.fontSize,
      this.iconColor,
      this.initialValue,
      this.dateFormat,
      this.isChangeDateFormat = false,
      this.hintText,
      this.validator,
      this.lastDate,
      this.labelFontWeight,
      this.firstDate,
      this.furtherOnTapFunction,
      this.onChanged,
      super.key});

  @override
  State<DateFieldWidget> createState() => _DateFieldWidgetState();
}

class _DateFieldWidgetState extends State<DateFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      col2View: smallScreenView(),
      col4View: smallScreenView(),
      col6View: largeScreenView(),
      col8View: largeScreenView(),
      col10View: largeScreenView(),
      col12View: largeScreenView(),
    );
  }

  Widget smallScreenView({
    double? iconSize,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Visibility(
          visible: widget.labelText != null,
          child: ResponsiveTextWidget(
            text: widget.labelText ?? '',
            fontWeight: widget.labelFontWeight,
            fontColor: widget.labelTextColor,
          ).padBottom(bottom: 5.h),
        ),
        TextFieldWidget(
          hintText: widget.hintText ?? '',
          initialValue: widget.initialValue,
          controller: widget.controller,
          textStyle: TextStyle(
            color: getColorByTheme(
              context: context,
              colorClass: AppColors.blackColor,
            ),
          ),

          onTap: () async {
            DateTime? date = await showDatePicker(
              context: context,
              firstDate: widget.firstDate ??
                  DateTime.now().subtract(const Duration(
                    days: 360,
                  )),
              lastDate: widget.lastDate ?? DateTime.now(),
              initialDate: DateTime.now(),
            );
            if (date != null) {
              widget.controller?.text = (widget.isChangeDateFormat
                  ? widget.dateFormat?.format(date).toString()
                  : DateFormat('yyyy-MM-dd').format(date).toString())!;
              if (widget.furtherOnTapFunction != null) {
                widget.furtherOnTapFunction!();
              }
            }

            if (widget.onChanged != null) {
              widget.onChanged!(widget.controller?.text ?? '');
            }
          },
          readOnly: true,
          fontWeight: FontWeight.normal,
          // labelText: widget.labelText ?? '',
          labelTextColor: widget.labelTextColor ?? AppColors.darkGreyColor,
          labelFontSize: widget.fontSize,
          suffixIcon: Icon(
            Icons.calendar_month,
            size: iconSize ?? 25.sp,
            color: getColorByTheme(
              context: context,
              colorClass: widget.iconColor ?? AppColors.darkGreyColor,
            ),
          ),
          validator: (String? val) {
            return widget.validator!(val);
          },
        ),
      ],
    );
  }

  Widget largeScreenView() {
    return smallScreenView(iconSize: 20.h);
  }
}
