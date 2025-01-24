import 'dart:developer' as log;
import 'dart:io';
import 'dart:math';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

enum FileSizeType { kb, mb }

class ImageCompressService {
  ImageCompressService._();

  static const double _omrFileSizeInKb = 0.78125; // 800kb

  /// FUNC [generateRandomFileNameAndReturnPath] :
  /// Generate random filename, Generate file on temporary directory & Return generate file directory path
  /// File extension is .jpg
  static Future<String> generateRandomFileNameAndReturnPath(
      {File? file}) async {
    final String randomNum = '${Random().nextInt(100)}';
    final String randomV = Random().nextDouble().toStringAsFixed(2);

    final CompressFormat fileFormat = getImageCompressFormat(file?.path ?? '');

    if (file == null) {
      final Directory directory = await getTemporaryDirectory();
      final String pathname = directory.path;
      final String fileName = '$pathname/ag/$randomNum$randomV.jpg';
      await File(fileName).create(recursive: true);
      return fileName;
    } else {
      final String fileName = file.path
          .replaceFirst('.$fileFormat', 'ag$randomNum$randomV.$fileFormat');
      return fileName;
    }
  }

  /// FUNC [checkFileSize] : Check File Size
  /// Required [file]
  /// Default [minFileSize] : 5
  /// Default [fileSizeType] : mb
  /// [isForOMR] : if isForOMR value is true then it ignores file size type and return value in kb
  static Future<(bool, double)> checkFileSize({
    required File file,
    int minFileSize = 5,
    FileSizeType fileSizeType = FileSizeType.mb,
    bool isForOMR = false,
  }) async {
    int size = await file.length();
    double kbSize = size / 1024;
    double mbSize = kbSize / 1024;
    if (isForOMR) {
      log.log('kbSize : $kbSize');
      return (
        kbSize < _omrFileSizeInKb,
        double.parse(kbSize.toStringAsFixed(2))
      );
    } else if (fileSizeType == FileSizeType.mb) {
      return (mbSize < minFileSize, double.parse(mbSize.toStringAsFixed(2)));
    }
    return (kbSize < minFileSize, double.parse(kbSize.toStringAsFixed(2)));
  }

  static Future<File> resizeImageResolution({
    required File file,
    int height = 1600,
    int? width,
  }) async {
    img.Image? image = img.decodeImage(file.readAsBytesSync());

    if (image == null) return file;

    img.Image resizedImage = img.copyResize(
      image,
      height: height,
      width: width,
    );

    int imageQuality = await _getResizedImageQuality(resizedImage);

    // Compress the image with JPEG format
    List<int> compressedBytes = img.encodeJpg(
      resizedImage,
      quality: imageQuality,
    ); // Adjust quality as needed

    String filePath = await generateRandomFileNameAndReturnPath(file: file);

    // Save the compressed image to a file
    File compressedFile = File(filePath);
    compressedFile.writeAsBytesSync(compressedBytes);

    return compressedFile;
  }

  static Future<int> _getResizedImageQuality(img.Image resizedImage) async {
    int size = resizedImage.length;
    double kbSize = size / 1024;
    double mbSize = kbSize / 1024;
    return kbSize < 600 ? 90 : 20;
  }

  static CompressFormat getImageCompressFormat(String path) {
    if (path.contains('.jpg') || path.contains('.jpeg')) {
      return CompressFormat.jpeg;
    } else if (path.contains('.png')) {
      return CompressFormat.png;
    } else if (path.contains('.heic')) {
      return CompressFormat.heic;
    } else {
      return CompressFormat.jpeg;
    }
  }


  static Future<File?> compressImageFile(File file) async {
    final String filePath = file.absolute.path;
    final int lastIndex =
    filePath.lastIndexOf(RegExp(r'\.(jpe?g|png)$', caseSensitive: false));
    final String splitPath = filePath.substring(0, (lastIndex));
    final String outPath = '${splitPath}_out${filePath.substring(lastIndex)}';
    XFile? result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      outPath,
      format:
      file.path.contains('.png') ? CompressFormat.png : CompressFormat.jpeg,
      quality: 40,
    );

    return result?.path != null ? File(result!.path) : null;
  }

  static Future<File?> compressImage({
    required File file,
    int minFileSize = 5,
  }) async {
    (bool, double) compressedValue = await checkFileSize(
      file: file,
      minFileSize: minFileSize,
    );

    log.log('File size is: ${compressedValue.$2}');

    if (compressedValue.$2 > minFileSize) {
      File? comFile = await compressImageFile(
        file,
      );

      if (comFile != null) {
        compressImage(file: comFile);
      }
    } else {
      (bool, double) compressedValue = await checkFileSize(
        file: file,
        minFileSize: minFileSize,
      );

      log.log('Returned File size is: ${compressedValue.$2}');
      return file;
    }
    return null;
  }
}
