import 'package:cammelive/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class UploadVideoProvider extends ChangeNotifier {
  XFile? videoFile;

  void pickVideo(context) async {
    try {
      videoFile = await ImagePicker().pickVideo(source: ImageSource.gallery);
      print(videoFile!.path);
    } on PlatformException catch (e) {
      errorMessage(context, "Failed to pick the image");

      print('Failed to pick image: $e');
    } catch (e) {
      errorMessage(context, "Please, select the image!!");
      print(e);
    }
    notifyListeners();
  }
}
