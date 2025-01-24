// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:pdf_render/pdf_render.dart' as doc;
import 'package:pdf_render/pdf_render_widgets.dart';
import 'package:record_keeping/common/appbar/sociair_appbar.dart';

class PdfArgumentModel {
  final String? title;
  final String? docPath;
  PdfArgumentModel({
    this.title,
    this.docPath,
  });
}

class PDFViewerScreen extends StatefulWidget {
  final PdfArgumentModel model;
  const PDFViewerScreen({super.key, required this.model});

  @override
  State<PDFViewerScreen> createState() => _PDFViewerScreenState();
}

class _PDFViewerScreenState extends State<PDFViewerScreen> {
  late doc.PdfDocument _document;
  bool _isLoading = true;

  @override
  void initState() {
    _loadDocument();
    super.initState();
  }

  @override
  void dispose() {
    _document.dispose();
    super.dispose();
  }

  Future<void> _loadDocument() async {
    final http.Response response =
        await http.get(Uri.parse(widget.model.docPath!));
    final Uint8List bytes = response.bodyBytes;

    final Directory dir = await getTemporaryDirectory();
    final File file = File('${dir.path}/document.pdf');
    await file.writeAsBytes(bytes);

    _document = await doc.PdfDocument.openFile(file.path);
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SociairAppBar(
        title: widget.model.title ?? 'PDF View',
        isCenterTitle: false,
        titleFontSize: 16.sp,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : PdfViewer(
              doc: _document,
            ),
    );
  }
}
