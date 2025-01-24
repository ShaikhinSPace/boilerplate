import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/common/model/color_model.dart';
import 'package:record_keeping/common/widget/text/normal_text_widget.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';
import 'package:record_keeping/core/typedef/sociair_type_def.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/ui/decoration_utils.dart';

class TextFieldWidget extends StatefulWidget {
  final String? Function(String? value)? validator;
  final int? maxLines;
  final TextStyle? textStyle;
  final VoidCallback? onTap;
  final bool obscureText;
  final TextAlign textAlign;
  final double? labelFontSize;
  final bool enabled;
  final VoidCallbackWithValue<String> onSaved;
  final VoidCallbackWithValue<String> onFieldSubmitted;
  final VoidCallbackWithValue<String> onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool readOnly;
  final int? minLines;
  final int? maxLength;
  final InputDecoration? decoration;
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool showCursor;
  final ColorModel? labelTextColor;
  final FontWeight? fontWeight;
  final TextStyle? hintStyle;

  const TextFieldWidget({
    super.key,
    this.validator,
    this.maxLines,
    this.textStyle,
    this.labelFontSize,
    this.onTap,
    this.obscureText = false,
    this.textAlign = TextAlign.start,
    this.enabled = true,
    this.onSaved,
    this.onFieldSubmitted,
    this.onChanged,
    this.inputFormatters,
    this.controller,
    this.initialValue,
    this.keyboardType,
    this.minLines,
    this.maxLength,
    this.readOnly = false,
    this.decoration,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.focusNode,
    this.textInputAction,
    this.showCursor = false,
    this.labelTextColor,
    this.fontWeight,
    this.hintStyle,
  }) : assert(
            !(initialValue != null && controller != null),
            'IF value has been set on initialValue then,'
            ' controller value must be null'
            'or, IF value has been set on controller then,'
            ' initial value must be null');

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final ValueNotifier<TextEditingController?> _controller =
      ValueNotifier<TextEditingController?>(null);

  final ValueNotifier<String?> _initialValue = ValueNotifier<String?>(null);
  final ValueNotifier<bool> _isToShowPassword = ValueNotifier<bool>(false);

  @override
  void initState() {
    _controller.value = widget.controller;
    _initialValue.value = widget.initialValue;
    _isToShowPassword.value = widget.isPassword;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TextFieldWidget oldWidget) {
    if (oldWidget.controller != widget.controller) {
      _controller.value = widget.controller;
    }
    if (oldWidget.initialValue != widget.initialValue) {
      _initialValue.value = widget.initialValue;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingController?>(
        valueListenable: _controller,
        builder: (_, TextEditingController? controller, __) {
          return ValueListenableBuilder<String?>(
              valueListenable: _initialValue,
              builder: (_, String? initialValue, __) {
                return ValueListenableBuilder<bool>(
                    valueListenable: _isToShowPassword,
                    builder: (_, bool isToShowPassword, __) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          if (widget.labelText != null &&
                              widget.labelText!.isNotEmpty) ...<Widget>{
                            NormalTextWidget(
                              text: widget.labelText ?? '',
                              fontColor: widget.enabled
                                  ? widget.labelTextColor
                                  : AppColors.greyColor,
                              fontWeight: widget.fontWeight ?? FontWeight.w600,
                              fontSize: widget.labelFontSize,
                            ),
                            5.verticalSpace,
                          },
                          TextFormField(
                            onTapOutside: (PointerDownEvent event) =>
                                FocusScope.of(context).unfocus(),
                            validator: widget.validator,
                            maxLines: widget.maxLines,
                            style: widget.textStyle ??
                                TextStyle(
                                  color: getColorByTheme(
                                    context: context,
                                    colorClass: AppColors.blackColor,
                                  ),
                                ),
                            onTap: widget.onTap,
                            obscureText: isToShowPassword,
                            textAlign: widget.textAlign,
                            enabled: widget.enabled,
                            inputFormatters: widget.inputFormatters,
                            onSaved: widget.onSaved,
                            controller: controller,
                            initialValue: initialValue,
                            onFieldSubmitted: widget.onFieldSubmitted,
                            keyboardType: widget.keyboardType,
                            maxLength: widget.maxLength,
                            minLines: widget.minLines,
                            onChanged: widget.onChanged,
                            readOnly: widget.readOnly,
                            showCursor: widget.showCursor,
                            focusNode: widget.focusNode,
                            textInputAction: widget.textInputAction,
                            decoration: widget.decoration ??
                                inputDecoration(
                                  context: context,
                                  passwordCallBack: (bool? value) {
                                    if (value != null) {
                                      _isToShowPassword.value = value;
                                    }
                                  },
                                  hintStyle: widget.hintStyle,
                                  hintText: widget.hintText,
                                  isPassword: widget.isPassword,
                                  prefixIcon: widget.prefixIcon,
                                  suffixIcon:
                                      widget.suffixIcon?.padRight(right: 6.w),
                                ),
                          ),
                        ],
                      );
                    });
              });
        });
  }
}
