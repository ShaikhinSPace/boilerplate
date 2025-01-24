import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record_keeping/core/extensions/widget_extension.dart';
import 'package:record_keeping/feature/ui_template/presentation/widget/text_field_widget.dart';

import '../../core/constants/app_colors.dart';

// ignore: must_be_immutable
class SearchTextFieldWidget extends StatefulWidget {
  final Function(String val)? onChanged;
  final Function(String?)? onFieldSubmitted;
  final Function(String?)? onSaved;
  final Function(String?)? onSearchCleared;
  final String? hintText;
  final TextEditingController? textEditingController;
  final EdgeInsets? contentPadding;
  String? initialVal;
  final FocusNode? focusNode;
  final VoidCallback? onTapToTextField;
  final bool showCursor;

  SearchTextFieldWidget({
    super.key,
    this.onChanged,
    this.onFieldSubmitted,
    this.onSaved,
    this.onSearchCleared,
    this.hintText,
    this.textEditingController,
    this.contentPadding,
    this.initialVal,
    this.focusNode,
    this.onTapToTextField,
    this.showCursor = false,
  });

  @override
  State<SearchTextFieldWidget> createState() => _SearchTextFieldWidgetState();
}

class _SearchTextFieldWidgetState extends State<SearchTextFieldWidget> {
  final ValueNotifier<String> _searchQuery = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
        valueListenable: _searchQuery,
        builder: (BuildContext context, String search, _) {
          return TextFieldWidget(
            showCursor: widget.showCursor,
            onTap: widget.onTapToTextField,
            focusNode: widget.focusNode,
            initialValue: widget.initialVal,
            textInputAction: TextInputAction.done,
            onSaved: widget.onSaved,
            onFieldSubmitted: widget.onFieldSubmitted,
            controller: widget.textEditingController,
            decoration: InputDecoration(
              hintText: widget.hintText ?? 'Search...',
              contentPadding: widget.contentPadding ??
                  EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
              isDense: true,
              suffixIcon: ValueListenableBuilder<String?>(
                  valueListenable: _searchQuery,
                  builder: (_, String? searchQuery, __) {
                    bool isSearchQueryNotEmpty =
                        searchQuery != null && searchQuery.isNotEmpty;
                    return IconButton(
                      onPressed: () {
                        widget.textEditingController?.clear();
                        _searchQuery.value = '';
                        if (widget.onSearchCleared != null) {
                          widget.onSearchCleared!(searchQuery);
                        }
                      },
                      icon: Icon(
                        isSearchQueryNotEmpty ? Icons.clear : Icons.search,
                        size: 28.w,
                        color: getColorByTheme(
                          context: context,
                          colorClass: isSearchQueryNotEmpty
                              ? AppColors.errorColor
                              : AppColors.greyColor,
                        ),
                      ),
                    ).visible(search.isNotEmpty &&
                        (widget.textEditingController?.text.isNotEmpty ??
                            false));
                  }),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0.1,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0.4,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 0.3),
              ),
            ),
            onChanged: (String? val) {
              _searchQuery.value = val ?? '';
              if (widget.onChanged != null) {
                widget.onChanged!(val ?? '');
              }
            },
          );
        });
  }
}
