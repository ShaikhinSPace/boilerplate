// // import 'package:flutter/material.dart';
// // import 'package:quill_html_editor/quill_html_editor.dart';
//
// // class HtmlContentAddWidget extends StatefulWidget {
// //     QuillEditorController controller;
// //    HtmlContentAddWidget({
// //     required this.controller,
// //     super.key});
//
// //   @override
// //   State<HtmlContentAddWidget> createState() => _HtmlContentAddWidgetState();
// // }
//
// // class _HtmlContentAddWidgetState extends State<HtmlContentAddWidget> {
// //   // late QuillEditorController controller;
//
// //   ///[customToolBarList] pass the custom toolbarList to show only selected styles in the editor
//
// //   final customToolBarList = [
// //     ToolBarStyle.bold,
// //     ToolBarStyle.italic,
// //     ToolBarStyle.align,
// //     ToolBarStyle.color,
// //     ToolBarStyle.background,
// //     ToolBarStyle.listBullet,
// //     ToolBarStyle.listOrdered,
// //     ToolBarStyle.clean,
// //     ToolBarStyle.addTable,
// //     ToolBarStyle.editTable,
// //   ];
//
// //   final _toolbarColor = Colors.grey.shade200;
// //   final _backgroundColor = Colors.white70;
// //   final _toolbarIconColor = Colors.black87;
// //   final _editorTextStyle = const TextStyle(
// //       fontSize: 18,
// //       color: Colors.black,
// //       fontWeight: FontWeight.normal,
// //       fontFamily: 'Roboto');
// //   final _hintTextStyle = const TextStyle(
// //       fontSize: 18, color: Colors.black38, fontWeight: FontWeight.normal);
//
// //   bool _hasFocus = false;
//
// //   @override
// //   void initState() {
// //     widget.controller = QuillEditorController();
// //     widget.controller.onTextChanged((text) {
// //       debugPrint('listening to $text');
// //     });
// //     widget.controller.onEditorLoaded(() {
// //       debugPrint('Editor Loaded :)');
// //     });
// //     widget.controller.focus();
// //     super.initState();
// //   }
//
// //   @override
// //   void dispose() {
// //     /// please do not forget to dispose the controller
// //    widget. controller.dispose();
// //     super.dispose();
// //   }
//
// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //           children: [
// //             ToolBar(
// //               toolBarColor: _toolbarColor,
// //               padding: const EdgeInsets.all(8),
// //               iconSize: 25,
// //               iconColor: _toolbarIconColor,
// //               activeIconColor: Colors.greenAccent.shade400,
// //               controller: widget.controller,
// //               crossAxisAlignment: WrapCrossAlignment.start,
// //               direction: Axis.horizontal,
// //               customButtons: [
// //                 Container(
// //                   width: 25,
// //                   height: 25,
// //                   decoration: BoxDecoration(
// //                       color: _hasFocus ? Colors.green : Colors.grey,
// //                       borderRadius: BorderRadius.circular(15)),
// //                 ),
// //                 InkWell(
// //                     onTap: () => unFocusEditor(),
// //                     child: const Icon(
// //                       Icons.favorite,
// //                       color: Colors.black,
// //                     )),
// //                 InkWell(
// //                     onTap: () async {
// //                       var selectedText = await widget.controller.getSelectedText();
// //                       debugPrint('selectedText $selectedText');
// //                       var selectedHtmlText =
// //                           await widget.controller.getSelectedHtmlText();
// //                       debugPrint('selectedHtmlText $selectedHtmlText');
// //                     },
// //                     child: const Icon(
// //                       Icons.add_circle,
// //                       color: Colors.black,
// //                     )),
// //               ],
// //             ),
// //             Expanded(
// //               child: QuillHtmlEditor(
//
// //                 text: "<h1>Hello</h1>This is a quill html editor example 😊",
// //                 hintText: 'Hint text goes here',
// //                 controller: widget.controller,
// //                 isEnabled: true,
// //                 ensureVisible: false,
// //                 minHeight: 500,
// //                 autoFocus: false,
// //                 textStyle: _editorTextStyle,
// //                 hintTextStyle: _hintTextStyle,
// //                 hintTextAlign: TextAlign.start,
// //                 padding: const EdgeInsets.only(left: 10, top: 10),
// //                 hintTextPadding: const EdgeInsets.only(left: 20),
// //                 backgroundColor: _backgroundColor,
// //                 inputAction: InputAction.newline,
// //                 onEditingComplete: (s) => debugPrint('Editing completed $s'),
// //                 loadingBuilder: (context) {
// //                   return const Center(
// //                       child: CircularProgressIndicator(
// //                     strokeWidth: 1,
// //                     color: Colors.red,
// //                   ));
// //                 },
// //                 onFocusChanged: (focus) {
// //                   debugPrint('has focus $focus');
// //                   setState(() {
// //                     _hasFocus = focus;
// //                   });
// //                 },
// //                 onTextChanged: (text) => debugPrint('widget text change $text'),
// //                 onEditorCreated: () {
// //                   debugPrint('Editor has been loaded');
// //                   setHtmlText('Testing text on load');
// //                 },
// //                 onEditorResized: (height) =>
// //                     debugPrint('Editor resized $height'),
// //                 onSelectionChanged: (sel) =>
// //                     debugPrint('index ${sel.index}, range ${sel.length}'),
// //               ),
// //             ),
// //           ],
// //         );
// //         // bottomNavigationBar: Container(
// //         //   width: double.maxFinite,
// //         //   color: _toolbarColor,
// //         //   padding: const EdgeInsets.all(8),
// //         //   child: Wrap(
// //         //     children: [
// //         //       textButton(
// //         //           text: 'Set Text',
// //         //           onPressed: () {
// //         //             setHtmlText('This text is set by you 🫵');
// //         //           }),
// //         //       textButton(
// //         //           text: 'Get Text',
// //         //           onPressed: () {
// //         //             getHtmlText();
// //         //           }),
// //         //       textButton(
// //         //           text: 'Insert Video',
// //         //           onPressed: () {
// //         //             ////insert
// //         //             insertVideoURL(
// //         //                 'https://www.youtube.com/watch?v=4AoFA19gbLo');
// //         //             insertVideoURL('https://vimeo.com/440421754');
// //         //             insertVideoURL(
// //         //                 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4');
// //         //           }),
// //         //       textButton(
// //         //           text: 'Insert Image',
// //         //           onPressed: () {
// //         //             insertNetworkImage('https://i.imgur.com/0DVAOec.gif');
// //         //           }),
// //         //       textButton(
// //         //           text: 'Insert Index',
// //         //           onPressed: () {
// //         //             insertHtmlText("This text is set by the insertText method",
// //         //                 index: 10);
// //         //           }),
// //         //       textButton(
// //         //           text: 'Undo',
// //         //           onPressed: () {
// //         //             controller.undo();
// //         //           }),
// //         //       textButton(
// //         //           text: 'Redo',
// //         //           onPressed: () {
// //         //             controller.redo();
// //         //           }),
// //         //       textButton(
// //         //           text: 'Clear History',
// //         //           onPressed: () async {
// //         //             controller.clearHistory();
// //         //           }),
// //         //       textButton(
// //         //           text: 'Clear Editor',
// //         //           onPressed: () {
// //         //             controller.clear();
// //         //           }),
// //         //       textButton(
// //         //           text: 'Get Delta',
// //         //           onPressed: () async {
// //         //             var delta = await controller.getDelta();
// //         //             debugPrint('delta');
// //         //             debugPrint(jsonEncode(delta));
// //         //           }),
// //         //       textButton(
// //         //           text: 'Set Delta',
// //         //           onPressed: () {
// //         //             final Map<dynamic, dynamic> deltaMap = {
// //         //               "ops": [
// //         //                 {
// //         //                   "insert": {
// //         //                     "video":
// //         //                         "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
// //         //                   }
// //         //                 },
// //         //                 {
// //         //                   "insert": {
// //         //                     "video": "https://www.youtube.com/embed/4AoFA19gbLo"
// //         //                   }
// //         //                 },
// //         //                 {"insert": "Hello"},
// //         //                 {
// //         //                   "attributes": {"header": 1},
// //         //                   "insert": "\n"
// //         //                 },
// //         //                 {"insert": "You just set the Delta text 😊\n"}
// //         //               ]
// //         //             };
// //         //             controller.setDelta(deltaMap);
// //         //           }),
// //         //     ],
// //         //   ),
// //         // ),
// //   }
//
// //   Widget textButton({required String text, required VoidCallback onPressed}) {
// //     return Padding(
// //       padding: const EdgeInsets.all(8.0),
// //       child: MaterialButton(
// //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
// //           color: _toolbarIconColor,
// //           onPressed: onPressed,
// //           child: Text(
// //             text,
// //             style: TextStyle(color: _toolbarColor),
// //           )),
// //     );
// //   }
//
// //   ///[getHtmlText] to get the html text from editor
// //   void getHtmlText() async {
// //     String? htmlText = await widget.controller.getText();
// //     debugPrint(htmlText);
// //   }
//
// //   ///[setHtmlText] to set the html text to editor
// //   void setHtmlText(String text) async {
// //     await widget.controller.setText(text);
// //   }
//
// //   ///[insertNetworkImage] to set the html text to editor
// //   void insertNetworkImage(String url) async {
// //     await widget.controller.embedImage(url);
// //   }
//
// //   ///[insertVideoURL] to set the video url to editor
// //   ///this method recognises the inserted url and sanitize to make it embeddable url
// //   ///eg: converts youtube video to embed video, same for vimeo
// //   void insertVideoURL(String url) async {
// //     await widget.controller.embedVideo(url);
// //   }
//
// //   /// to set the html text to editor
// //   /// if index is not set, it will be inserted at the cursor postion
// //   void insertHtmlText(String text, {int? index}) async {
// //     await widget.controller.insertText(text, index: index);
// //   }
//
// //   /// to clear the editor
// //   void clearEditor() => widget.controller.clear();
//
// //   /// to enable/disable the editor
// //   void enableEditor(bool enable) =>widget. controller.enableEditor(enable);
//
// //   /// method to un focus editor
// //   void unFocusEditor() => widget.controller.unFocus();
//
// // }
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:quill_html_editor/quill_html_editor.dart';
// import 'package:record_keeping/common/widget/text/normal_text_widget.dart';
// import 'package:record_keeping/core/constants/app_colors.dart';
// import 'package:record_keeping/core/extensions/widget_extension.dart';
//
// class HtmlContentAddWidget extends StatefulWidget {
//   final QuillEditorController controller;
//   final bool isValid;
//
//   const HtmlContentAddWidget({
//     required this.controller,
//     this.isValid = false,
//     super.key,
//   });
//
//   @override
//   State<HtmlContentAddWidget> createState() => _HtmlContentAddWidgetState();
// }
//
// class _HtmlContentAddWidgetState extends State<HtmlContentAddWidget> {
//   final List<ToolBarStyle> customToolBarList = <ToolBarStyle>[
//     ToolBarStyle.bold,
//     ToolBarStyle.italic,
//     ToolBarStyle.align,
//     ToolBarStyle.color,
//     ToolBarStyle.background,
//     ToolBarStyle.listBullet,
//     ToolBarStyle.listOrdered,
//     ToolBarStyle.clean,
//     ToolBarStyle.addTable,
//     ToolBarStyle.editTable,
//   ];
//
//   final Color _toolbarColor = Colors.grey.shade200;
//   final Color _backgroundColor = Colors.white70;
//   final Color _toolbarIconColor = Colors.black87;
//   final TextStyle _editorTextStyle = const TextStyle(
//       fontSize: 18, color: Colors.black, fontWeight: FontWeight.normal);
//   final TextStyle _hintTextStyle = const TextStyle(
//       fontSize: 18, color: Colors.black38, fontWeight: FontWeight.normal);
//   final ValueNotifier<bool> hasFocus = ValueNotifier<bool>(false);
//
//   @override
//   void initState() {
//     widget.controller.focus();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     widget.controller.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         ToolBar(
//           toolBarColor: _toolbarColor,
//           padding: const EdgeInsets.all(8),
//           iconSize: 25,
//           iconColor: _toolbarIconColor,
//           activeIconColor: Colors.greenAccent,
//           controller: widget.controller,
//           crossAxisAlignment: WrapCrossAlignment.start,
//           direction: Axis.horizontal,
//           customButtons: <Widget>[
//             Container(
//               width: 25,
//               height: 25,
//               decoration: BoxDecoration(
//                   color: hasFocus.value ? Colors.green : Colors.grey,
//                   borderRadius: BorderRadius.circular(15)),
//             ),
//             InkWell(
//                 onTap: () => unFocusEditor(),
//                 child: const Icon(
//                   Icons.favorite,
//                   color: Colors.black,
//                 )),
//             InkWell(
//                 onTap: () async {
//                   var selectedText = await widget.controller.getSelectedText();
//                   var selectedHtmlText =
//                       await widget.controller.getSelectedHtmlText();
//                 },
//                 child: const Icon(
//                   Icons.add_circle,
//                   color: Colors.black,
//                 )),
//           ],
//         ),
//         Expanded(
//           child: ValueListenableBuilder<bool>(
//               valueListenable: hasFocus,
//               builder: (BuildContext context, bool focus, Widget? child) {
//                 return Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: getColorByTheme(
//                           context: context, colorClass: AppColors.greyColor),
//                     ),
//                     borderRadius: BorderRadius.circular(4.r),
//                   ),
//                   child: QuillHtmlEditor(
//                     hintText: 'Add Daily Update',
//                     controller: widget.controller,
//                     isEnabled: true,
//                     ensureVisible: false,
//                     minHeight: 500.h,
//                     autoFocus: false,
//                     textStyle: _editorTextStyle,
//                     hintTextStyle: _hintTextStyle,
//                     hintTextAlign: TextAlign.start,
//                     padding: const EdgeInsets.only(left: 10, top: 10),
//                     hintTextPadding: const EdgeInsets.only(left: 20),
//                     backgroundColor: _backgroundColor,
//                     inputAction: InputAction.newline,
//                     onFocusChanged: (bool focus) {
//                       hasFocus.value = focus;
//                     },
//                     onEditorCreated: () {
//                       setHtmlText('');
//                     },
//                   ),
//                 ).padVertical(vertical: 2.h);
//               }),
//         ),
//         Visibility(
//           visible: widget.isValid,
//           child: ResponsiveTextWidget(
//             text: 'Description is required',
//             fontColor: AppColors.errorColor,
//           ),
//         ),
//       ],
//     );
//   }
//
//   void getHtmlText() async {
//     String? htmlText = await widget.controller.getText();
//     debugPrint(htmlText);
//   }
//
//   void setHtmlText(String text) async {
//     await widget.controller.setText(text);
//   }
//
//   void insertNetworkImage(String url) async {
//     await widget.controller.embedImage(url);
//   }
//
//   void insertVideoURL(String url) async {
//     await widget.controller.embedVideo(url);
//   }
//
//   void insertHtmlText(String text, {int? index}) async {
//     await widget.controller.insertText(text, index: index);
//   }
//
//   void clearEditor() => widget.controller.clear();
//
//   void enableEditor(bool enable) => widget.controller.enableEditor(enable);
//
//   void unFocusEditor() => widget.controller.unFocus();
// }
