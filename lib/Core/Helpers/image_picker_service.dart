import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker picker;

  ImagePickerService({required this.picker});
  Future<File?> pickImage({required ImageSource source}) async {
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      return File(image.path);
    } else {
      return null;
    }
  }
}
