import 'package:flutter/material.dart';

class UploadCSVProvider extends ChangeNotifier {
  String message = "";

  void updateMessage(String msg) {
    message = msg;
    notifyListeners();
  }

  void cleanMessage() {
    message = "";
    notifyListeners();
  }

  String getMessage() {
    return message;
  }
}
