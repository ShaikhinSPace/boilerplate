import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:record_keeping/core/permission/permission_denied_popup.dart';
import 'package:record_keeping/core/permission/sociair_permission_handler.dart';

import '../../feature/image_library/presentation/screens/image_picker_screen.dart';
import '../config/di/di_injectable.dart';
import '../enums/sociair_enums.dart';
import '../routing/navigation_service.dart';
import '../routing/route_name.dart';
import '../services/file_picker.dart';
import '../services/image_compress_service.dart';
import '../services/shared_prefs_service.dart';

mixin PermissionHandlerMx {
  Future<void> permissionChecker({
    required PermissionFor permissionFor,
    required BuildContext context,
    Function(List<File>?)? getFiles,
    Function()? recordingFun,
    int maxImage = 3,
    bool noImgLimit = false,
    bool isToCompressImage = true,
    int compressSize = 5,
  }) async {
    switch (permissionFor) {
      case PermissionFor.camera:
        int camCounter =
            SharedPrefsService.permissionService.getCameraPermissionCount;

        PermissionStatus status = await PermissionHandler()
            .checkPermission(permissionFor: permissionFor);

        if (status == PermissionStatus.granted) {
          File? file = await getIt<NavigationService>().pushNamed(
            RouteName.cameraScreenRoute,
          );

          if (file != null) {
            List<File> files = <File>[];

            if (isToCompressImage) {
              File? compressedFile = await ImageCompressService.compressImage(
                  file: file, minFileSize: compressSize);

              if (compressedFile != null) {
                files.add(compressedFile);
              } else {
                files.add(file);
              }
            } else if (noImgLimit) {
              int fileSizeInBytes = await file.length();
              double fileSizeInMB = fileSizeInBytes / (1024 * 1024);
              if (fileSizeInMB > 5) {
                File? compressedFile = await ImageCompressService.compressImage(
                  file: file,
                  minFileSize: compressSize,
                );
                if (compressedFile != null) {
                  files.add(compressedFile);
                } else {
                  files.add(file);
                }
              }
            }
            if (getFiles != null) {
              getFiles(files);
            }
          }
        } else {
          if (status == PermissionStatus.permanentlyDenied || camCounter > 3) {
            await ShowPermissionDeniedPopup()
                .showAlertPopUp(ctx: context, permissionFor: permissionFor);
          } else if (status == PermissionStatus.denied) {
            SharedPrefsService.permissionService.setCameraPermissionCount();
          }
        }
        break;

      case PermissionFor.gallery:
        int galleryCounter =
            SharedPrefsService.permissionService.getGalleryPermissionCount;

        PermissionStatus status = await PermissionHandler()
            .checkPermission(permissionFor: permissionFor);

        if (status == PermissionStatus.granted) {
          List<AssetEntity>? selectedMedia =
              await getIt<NavigationService>().pushNamed(
            RouteName.imagePickerScreenRoute,
            extra: ImagePickerViewModel(
              type: RequestType.image,
              maxImage: maxImage,
              noImgLimit: noImgLimit,
            ),
          );
          if (selectedMedia != null) {
            List<File> compressedFiles = <File>[];
            for (AssetEntity element in selectedMedia) {
              File? file = await element.file;
              if (isToCompressImage) {
                File? compressedFile = await ImageCompressService.compressImage(
                    file: file!, minFileSize: compressSize);
                if (compressedFile != null) {
                  compressedFiles.add(compressedFile);
                } else {
                  compressedFiles.add(file);
                }
              }
            }
            if (getFiles != null) {
              getFiles(compressedFiles);
            }
          }
        } else {
          if (status == PermissionStatus.permanentlyDenied ||
              galleryCounter > 2) {
            await ShowPermissionDeniedPopup()
                .showAlertPopUp(ctx: context, permissionFor: permissionFor);
          } else if (status == PermissionStatus.denied) {
            SharedPrefsService.permissionService.setGalleryPermissionCount();
          }
        }
        break;

      case PermissionFor.microPhone:
        int microPhoneCounter =
            SharedPrefsService.permissionService.getMicroPhonePermissionCount;
        PermissionStatus status = await PermissionHandler()
            .checkPermission(permissionFor: permissionFor);
        if (status == PermissionStatus.granted) {
          SharedPrefsService.permissionService.setCameraPermissionGranted(true);
          SharedPrefsService.permissionService
              .setCameraPermissionCount(value: 0);
          if (recordingFun != null) {
            recordingFun();
          }
        } else {
          if (status == PermissionStatus.permanentlyDenied ||
              microPhoneCounter > 3) {
            await ShowPermissionDeniedPopup()
                .showAlertPopUp(ctx: context, permissionFor: permissionFor);
          } else if (status == PermissionStatus.denied) {
            SharedPrefsService.permissionService.setMicroPhonePermissionCount();
          }
        }
        break;

      case PermissionFor.storage:
        int storageCounter =
            SharedPrefsService.permissionService.getStoragePermissionCount;

        PermissionStatus status = await PermissionHandler()
            .checkPermission(permissionFor: permissionFor);
        if (status == PermissionStatus.granted) {
          List<File>? selectedMedia = await FilePickerService.pickFiles(
            allowedExtensions: <String>['pdf'],
            maxLength: 1,
          );

          if (selectedMedia.isNotEmpty && getFiles != null) {
            int fileSizeInBytes = selectedMedia.first.lengthSync();
            double fileSizeInMB = fileSizeInBytes / (1024 * 1024);
            if (fileSizeInMB < 11) {
              getFiles(selectedMedia);
            } else {
              // showToast("File size should be less then 10 MB",
              //     toastType: ToastType.error);
            }
          }
        } else {
          if (status == PermissionStatus.permanentlyDenied ||
              storageCounter > 3) {
            await ShowPermissionDeniedPopup().showAlertPopUp(
              ctx: context,
              permissionFor: permissionFor,
            );
          } else if (status == PermissionStatus.denied) {
            SharedPrefsService.permissionService.setStoragePermissionCount();
          }
        }
        break;

      default:
        break;
    }
  }

  // Future<bool> permissionLocationChecker(
  //     {required BuildContext context}) async {
  //   bool serviceEnabled;
  //   // LocationPermission permission;
  //
  //   // Test if location services are enabled.
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     // Location services are not enabled don't continue
  //     // accessing the position and request users of the
  //     // App to enable the location services.
  //     log('Location services are disabled.');
  //     return false;
  //   }
  //
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       // Permissions are denied, next time you could try
  //       // requesting permissions again (this is also where
  //       // Android's shouldShowRequestPermissionRationale
  //       // returned true. According to Android guidelines
  //       // your App should show an explanatory UI now.
  //       log('Location permissions are denied');
  //       return false;
  //     }
  //   }
  //
  //   if (permission == LocationPermission.deniedForever) {
  //     await ShowPermissionDeniedPopup().showAlertPopUp(
  //         ctx: context,
  //         permissionFor: PermissionFor.location,
  //         onSettingOpened: () {
  //           // _getCurrentLocationLatLong();
  //         });
  //     // Geolocator.openAppSettings();
  //     // Permissions are denied forever, handle appropriately.
  //     log('Location permissions are permanently denied, we cannot request permissions.');
  //     return false;
  //   }
  //
  //   bool isGranted = permission == LocationPermission.always ||
  //       permission == LocationPermission.whileInUse;
  //   log('location permission: $permission');
  //   return isGranted;
  // }
}
