import 'dart:io';

import 'package:image_picker/image_picker.dart';

class CustomFilePicker {
  final ImagePicker filePicker;

  CustomFilePicker(this.filePicker);

  Future<List<File>> pickMultiImage() async {
    final filePickerResult = await filePicker.pickMultiImage();
    if (filePickerResult == null) {
      return [];
    }
    return filePickerResult.map((e) => File(e.path)).toList();
  }
}
