import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/common/widget/text/normal_text_widget.dart';
import 'package:record_keeping/core/constants/app_colors.dart';
import 'package:record_keeping/core/routing/sociair_navigation_observer.dart';

// ignore: must_be_immutable
class DropdownWidget<T> extends StatefulWidget {
  DropdownWidget({
    super.key,
    this.dropdownValue,
    required this.itemList,
    required this.onPressed,
    this.showSelected = false,
    required this.hintText,
    this.initialSelectedValue,
    this.icon = const Icon(
      Icons.more_vert,
    ),
    this.isIconButton = false,
    this.itemToString,
  });

  List<T> itemList;
  void Function(T?) onPressed;
  bool showSelected;
  T? dropdownValue;
  Widget icon;
  bool isIconButton;
  String hintText;
  T? initialSelectedValue;
  String Function(T)? itemToString;

  @override
  State<DropdownWidget<T>> createState() => _DropdownWidgetState<T>();
}

class _DropdownWidgetState<T> extends State<DropdownWidget<T>> {
  final ValueNotifier<T?> _selectedItem = ValueNotifier<T?>(null);

  @override
  void initState() {
    if (widget.initialSelectedValue != null) {
      _selectedItem.value = widget.initialSelectedValue;
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant DropdownWidget<T> oldWidget) {
    if (oldWidget.initialSelectedValue != widget.initialSelectedValue) {
      _selectedItem.value = widget.initialSelectedValue;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<T?>(
      valueListenable: _selectedItem,
      builder: (BuildContext context, T? selectedItem, _) {
        return DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: false,
            child: DropdownButton2<T>(
              onMenuStateChange: (bool isOpen) {
                dropDownNotifier.value = isOpen;
              },
              hint: NormalTextWidget(
                text: widget.hintText,
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 200.h,
                offset: const Offset(0, 0),
                width: 150.w,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: getColorByTheme(
                          context: context, colorClass: AppColors.borderColor)),
                  color: getColorByTheme(
                    context: context,
                    colorClass: AppColors.backgroundColor,
                  ),
                ),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(10),
                  thickness: WidgetStateProperty.all<double>(6),
                  thumbVisibility: WidgetStateProperty.all<bool>(true),
                ),
              ),
              isExpanded: true,
              isDense: true,
              customButton: widget.isIconButton
                  ? widget.icon
                  : Container(
                      constraints: BoxConstraints(
                        minWidth: 230.w,
                        minHeight: 40.h,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          border: Border.all(
                            width: 0.3,
                            color: getColorByTheme(
                              context: context,
                              colorClass: AppColors.greyColor,
                            ),
                          )),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          NormalTextWidget(
                            text: (selectedItem != null
                                    ? widget.itemToString != null
                                        ? widget.itemToString
                                            ?.call(selectedItem)
                                        : selectedItem.toString()
                                    : widget.hintText)
                                .toString(),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: getColorByTheme(
                                context: context,
                                colorClass: AppColors.blackColor),
                          )
                        ],
                      ),
                    ),
              items: widget.itemList
                  .map((T item) => DropdownMenuItem<T>(
                      value: item,
                      child: ValueListenableBuilder<T?>(
                          valueListenable: _selectedItem,
                          builder: (_, T? selectedItem, __) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                NormalTextWidget(
                                    text: widget.itemToString?.call(item) ??
                                        item.toString()),
                                const Spacer(),
                                if (widget.showSelected &&
                                    (selectedItem != null &&
                                        selectedItem == item)) ...<Widget>[
                                  const Icon(Icons.check)
                                ]
                              ],
                            );
                          })))
                  .toList(),
              value: selectedItem,
              onChanged: (T? item) {
                widget.onPressed(item);
                _selectedItem.value = item;
              },
              menuItemStyleData: MenuItemStyleData(
                height: 40.h,
                padding: const EdgeInsets.only(left: 14, right: 14),
              ),
              enableFeedback: true,
            ),
          ),
        );
      },
    );
  }
}
