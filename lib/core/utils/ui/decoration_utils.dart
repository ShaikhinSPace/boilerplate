import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/common/model/responsive_value_model.dart';
import 'package:record_keeping/core/extensions/responsive_context_extension.dart';
import 'package:record_keeping/core/extensions/text_theme_extension.dart';
import 'package:record_keeping/core/typedef/sociair_type_def.dart';

import '../../constants/app_colors.dart';

InputDecoration inputDecoration({
  VoidCallbackWithValue<bool>? passwordCallBack,
  required BuildContext context,
  String? labelText,
  String? hintText,
  Widget? prefixIcon,
  Widget? suffixIcon,
  bool isPassword = false,
  TextStyle? hintStyle,
}) {
  return InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(
      15.w,
      10.w,
      8.w,
      10.w,
    ),
    labelText: labelText,
    labelStyle: context.textTheme.bodySmall,
    hintText: hintText,
    prefixIcon: prefixIcon,
    hintStyle: hintStyle ??
        context.textTheme.bodySmall!.copyWith(
          color: getColorByTheme(
            context: context,
            colorClass: AppColors.greyShadeColor,
          ),
        ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: getColorByTheme(
          context: context,
          colorClass: AppColors.borderColor,
        ),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(5.r),
      ),
    ),
    errorStyle: context.textTheme.bodySmall!.copyWith(
      color: getColorByTheme(
        context: context,
        colorClass: AppColors.errorColor,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: getColorByTheme(
          context: context,
          colorClass: AppColors.errorColor,
        ),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(5.r),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: getColorByTheme(
          context: context,
          colorClass: AppColors.borderColor,
        ),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(5.r),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: getColorByTheme(
          context: context,
          colorClass: AppColors.greyColor,
        ),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(5.r),
      ),
    ),
    suffixIcon: isPassword
        ? PasswordSuffixIcon(
            passwordCallBack: passwordCallBack,
          )
        : suffixIcon,
    suffixIconConstraints: BoxConstraints(
      minWidth: context.getResponsiveValueByDeviceType(
        responsiveValue: ResponsiveValueModel(
          col2Value: 24.w,
          col4Value: 24.w,
          col6Value: 24.w,
          col8Value: 24.w,
          col10Value: 24.w,
          col12Value: 0.75.w,
        ),
      ),
      minHeight: context.getResponsiveValueByDeviceType(
        responsiveValue: ResponsiveValueModel(
          col2Value: 24.w,
          col4Value: 24.w,
          col6Value: 24.w,
          col8Value: 24.w,
          col10Value: 24.w,
          col12Value: 0.75.w,
        ),
      ),
    ),
  );
}

class PasswordSuffixIcon extends StatefulWidget {
  final VoidCallbackWithValue<bool> passwordCallBack;

  const PasswordSuffixIcon({super.key, this.passwordCallBack});

  @override
  State<PasswordSuffixIcon> createState() => _PasswordSuffixIconState();
}

class _PasswordSuffixIconState extends State<PasswordSuffixIcon> {
  bool _isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
      ),
      onPressed: () {
        setState(() {
          _isPasswordVisible = !_isPasswordVisible;
        });
        widget.passwordCallBack!(_isPasswordVisible);
      },
    );
  }
}
