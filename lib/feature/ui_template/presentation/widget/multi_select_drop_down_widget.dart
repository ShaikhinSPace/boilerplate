import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/common/widget/check_box_widget.dart';
import 'package:record_keeping/common/widget/text/normal_text_widget.dart';
import 'package:record_keeping/core/constants/app_colors.dart';
import 'package:record_keeping/core/extensions/null_aware_extension.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';
import 'package:record_keeping/core/typedef/sociair_type_def.dart';

class MultiSelectDropDownWidget<T> extends StatefulWidget {
  final List<T> dropdownItems;
  final List<T> selectedItems;
  final String hintText;
  final String? labelText;
  final VoidCallbackWithValue<List<T>> selectedItemsCallback;

  const MultiSelectDropDownWidget({
    super.key,
    required this.dropdownItems,
    required this.selectedItems,
    required this.hintText,
    this.labelText,
    this.selectedItemsCallback,
  });

  @override
  State<MultiSelectDropDownWidget<T>> createState() =>
      _MultiSelectDropDownWidgetState<T>();
}

class _MultiSelectDropDownWidgetState<T>
    extends State<MultiSelectDropDownWidget<T>> {
  final ValueNotifier<List<T>> _dropDownItems = ValueNotifier<List<T>>(<T>[]);
  final ValueNotifier<List<T>> _selectedDropDownItems =
      ValueNotifier<List<T>>(<T>[]);

  @override
  void initState() {
    _dropDownItems.value = widget.dropdownItems;
    _selectedDropDownItems.value = widget.selectedItems;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MultiSelectDropDownWidget<T> oldWidget) {
    if (oldWidget != widget) {
      _dropDownItems.value = widget.dropdownItems;
      _selectedDropDownItems.value = widget.selectedItems;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<T>>(
        valueListenable: _dropDownItems,
        builder: (BuildContext ctx, List<T> dropDownItems, _) {
          return ValueListenableBuilder<List<T>>(
              valueListenable: _selectedDropDownItems,
              builder: (BuildContext ctx, List<T> selectedDropDownItems, _) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (widget.labelText != null &&
                        widget.labelText!.isNotEmpty) ...<Widget>{
                      NormalTextWidget(
                        text: widget.labelText ?? '',
                        fontWeight: FontWeight.w600,
                      ),
                      5.verticalSpace,
                    },
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<T>(
                        isExpanded: true,
                        hint: NormalTextWidget(text: widget.hintText),
                        items: dropDownItems.map((T item) {
                          return DropdownMenuItem<T>(
                            value: item,
                            //disable default onTap to avoid closing menu when selecting an item
                            enabled: false,
                            child: StatefulBuilder(
                              builder: (BuildContext ctx, menuSetState) {
                                bool isSelected = _selectedDropDownItems.value
                                        .firstWhereOrNull((p0) =>
                                            p0.toString() == item.toString()) !=
                                    null;

                                return Container(
                                  color: getColorByTheme(
                                    context: context,
                                    colorClass: AppColors.backgroundColor,
                                  ),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.w),
                                  child: Row(
                                    children: <Widget>[
                                      CheckBoxWidget(
                                        onChanged: (bool? value) {},
                                        isSelected: isSelected,
                                      ),
                                      2.horizontalSpace,
                                      Expanded(
                                        child: NormalTextWidget(
                                          text: item.toString(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ).onTap(() {
                                  isSelected
                                      ? _selectedDropDownItems.value
                                          .remove(item)
                                      : _selectedDropDownItems.value = <T>[
                                          ..._selectedDropDownItems.value,
                                          item
                                        ];

                                  setState(() {});
                                  menuSetState(() {});
                                  widget.selectedItemsCallback!(
                                      _selectedDropDownItems.value);
                                });
                              },
                            ),
                          );
                        }).toList(),
                        //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
                        value: selectedDropDownItems.isEmpty
                            ? null
                            : selectedDropDownItems.first,
                        onChanged: (T? value) {},
                        selectedItemBuilder: (BuildContext bCtx) {
                          return selectedDropDownItems.map(
                            (T item) {
                              return Align(
                                alignment: Alignment.centerLeft,
                                child: NormalTextWidget(
                                  text: selectedDropDownItems.join(', '),
                                ),
                              );
                            },
                          ).toList();
                        },
                        buttonStyleData: ButtonStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 10.w)
                              .copyWith(left: 5.w),
                          height: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: getColorByTheme(
                                context: context,
                                colorClass: AppColors.borderColor,
                              ),
                            ),
                          ),
                          // width: 140,
                        ),
                      ),
                    ),
                  ],
                );
              });
        });
  }
}
