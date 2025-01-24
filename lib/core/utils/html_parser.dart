import 'package:flutter/cupertino.dart';
import 'package:html/parser.dart' as parser;
import 'package:record_keeping/common/widget/text/normal_text_widget.dart';

Widget extractHtmlContent({required String content, double? fontSize}) {
  final String? parsedContent = parser.parse(content).documentElement?.text;
  return NormalTextWidget(
    text: parsedContent ?? '',
    fontSize: fontSize,
    textAlign: TextAlign.justify,
    overflow: false,
  );
}
