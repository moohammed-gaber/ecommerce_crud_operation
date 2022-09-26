import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/foundation.dart';

class CustomFilePicker {
  final ImagePicker filePicker;

  CustomFilePicker(this.filePicker);

  Future<List<File>> pickMultiImage() async {
    final filePickerResult = await filePicker.pickMultiImage(
    );
    if (filePickerResult == null) {
      return [];
    }
    return filePickerResult.map((e) => File(e.path)).toList();
  }
}
