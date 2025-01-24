import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:record_keeping/core/routing/navigation_service.dart';

Future<dynamic> pickImage({bool showFilePicker = false}) async {
  if (NavigationService.navigatorKey.currentContext != null) {
    var image = await showModalBottomSheet(
        context: NavigationService.navigatorKey.currentContext!,
        builder: (BuildContext context) {
          return ChooseImageDialog(showFilePicker);
        });
    return image;
  }
}

Future<File?> imagePicker({required String source}) async {
  final ImagePicker imagePicker = ImagePicker();
  final XFile? pickedImage = await imagePicker.pickImage(
      source: source == 'camera' ? ImageSource.camera : ImageSource.gallery);
  if (pickedImage != null) {
    log('picked:: ${pickedImage.path}');
    return File(pickedImage.path);
  } else {
    return null;
  }
}

class ChooseImageDialog extends StatefulWidget {
  final bool showFile;
  ChooseImageDialog(this.showFile);
  @override
  _ChooseImageDialogState createState() => _ChooseImageDialogState();
}

class _ChooseImageDialogState extends State<ChooseImageDialog> {
  Widget imageTile(String text, IconData iconData) {
    return InkWell(
      onTap: () async {
        String imageSource = '';
        File? image;
        if (text == 'Camera') {
          imageSource = 'camera';
          image = await imagePicker(source: imageSource);
        } else if (text == 'Camera') {
          imageSource = 'gallery';
          image = await imagePicker(source: imageSource);
        } else {
          FilePickerResult? filePickerResult =
              await FilePicker.platform.pickFiles();
          if (filePickerResult != null) {
            image = File(filePickerResult.files.single.path!);
          }
        }

        Navigator.pop(NavigationService.navigatorKey.currentContext!, image);
      },
      child: Container(
          margin: const EdgeInsets.only(left: 20),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          child: Row(
            children: <Widget>[
              Icon(iconData, color: Theme.of(context).primaryColor),
              10.horizontalSpace,
              Text(
                text,
                // style: TextStyle(color: AppColors.primaryColor),
              ),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        imageTile('Camera', Icons.camera),
        imageTile('Gallery', Icons.photo),
        if (widget.showFile) imageTile('Files', Icons.folder),
        30.verticalSpace,
      ],
    );
  }
}
