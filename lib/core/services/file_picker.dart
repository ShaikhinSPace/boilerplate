import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';

class FilePickerService {
  FilePickerService._();

  static Future<List<File>> pickFiles({
    bool allowMultiple = true,
    bool allowCompress = true,
    int maxLength = 3,
    List<String> allowedExtensions = const <String>[
      'jpg',
      'png',
      'jpeg',
      'pdf',
    ],
  }) async {
    List<PlatformFile>? paths;

    List<File> files = <File>[];

    try {
      paths = (await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: allowMultiple,
        onFileLoading: (FilePickerStatus status) => print(status),
        allowedExtensions: allowedExtensions,
        allowCompression: allowCompress,
      ))
          ?.files;

      paths?.forEach((PlatformFile element) async {
        if (files.length < maxLength) {
          files.add(File(element.path!));
        } else {}
      });
      return files;
    } on PlatformException {
      return files;
    } catch (e) {
      return files;
    }
  }
}
