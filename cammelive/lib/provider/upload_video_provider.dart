import 'dart:io';

import 'package:cammelive/helper/helper.dart';
import 'package:cammelive/services/upload_video_service.dart';
import 'package:cammelive/utils/extension.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as fileUtil;

class UploadVideoProvider extends ChangeNotifier {
  XFile? videoFile;
  FilePickerResult? multiVideoFile;
  List filePath = [];
  List fileNameList = [];
  double progressValue = 0.3;
  int progressPercentValue = 23;

  void pickVideo(context) async {
    try {
      videoFile = await ImagePicker().pickVideo(source: ImageSource.gallery);
      print(videoFile!.path);
    } on PlatformException catch (e) {
      errorMessage(context, "Failed to pick the video");

      print('Failed to pick image: $e');
    } catch (e) {
      errorMessage(context, "Please, select the video!!");
      print(e);
    }
    notifyListeners();
  }

  void pickMultiVideo(context) async {
    try {
      multiVideoFile = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['mp4', 'mov', 'avi'],
        allowMultiple: true,
      );
      filePath = multiVideoFile!.paths;
      fileNameList = [];
      getFileName(filePath);
    } on PlatformException catch (e) {
      errorMessage(context, "Failed to pick the video");

      print('Failed to pick image: $e');
    } catch (e) {
      errorMessage(context, "Please, select the video!!");
      print(e);
    }
    notifyListeners();
  }

  void getFileName(List paths) {
    for (String path in paths) {
      List breakPath = path.split("/");
      fileNameList.add(breakPath.last);
      print(breakPath.last);
    }
  }

  void uploadFile(File video, context) async {
    // _setUploadProgress(0, 0);

    try {
      await UploadVideoService.fileUploadMultipart(
          video: video, onUploadProgress: _setUploadProgress);
      errorMessage(context, "File uploaded - ${fileUtil.basename(video.path)}");
    } catch (e) {
      errorMessage(context, e.toString());
    }
  }

  void _setUploadProgress(int sentBytes, int totalBytes) {
    double progressValue =
        Extension.remap(sentBytes.toDouble(), 0, totalBytes.toDouble(), 0, 1);

    progressValue = double.parse(progressValue.toStringAsFixed(2));

    if (progressValue != progressValue) {
      progressValue = progressValue;
      progressPercentValue = (progressValue * 100.0).toInt();
    }
    notifyListeners();
  }
}
