import 'package:flutter/material.dart';
import 'package:record_keeping/core/extensions/text_theme_extension.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final int? maxLines;

  const TitleWidget({
    super.key,
    required this.title,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.titleSmall,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
