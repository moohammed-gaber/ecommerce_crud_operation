import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

class CustomFilePicker {
  final FilePicker filePicker;

  CustomFilePicker(this.filePicker);

  Future<List<PlatformFile>> pickMultiImage() async {
    final filePickerResult = await filePicker.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (filePickerResult == null) {
      return [];
    }
    return filePickerResult.files;
  }
}
