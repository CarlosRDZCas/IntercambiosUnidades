import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart ';
import 'package:path/path.dart' as path;

class Camara {
  static Future<XFile?> takePhoto({required bool isVideo}) async {
    final ImagePicker picker = ImagePicker();
    final directory =
        '${(await getApplicationDocumentsDirectory()).path}\\EditImages';
    if (!await Directory(directory).exists()) {
      await Directory(directory).create(recursive: true);
    }
    if (isVideo) {
      final XFile? video = await picker.pickVideo(source: ImageSource.camera);
      String newPath = path.join(directory, video!.name);
      File file = await File(video.path).copy(newPath);
      return XFile(file.path);
    } else {
      final XFile? photo = await picker.pickImage(source: ImageSource.camera);
      String newPath = path.join(directory, photo!.name);
      File file = await File(photo.path).copy(newPath);
      return XFile(file.path);
    }
  }

  static Future<XFile?> takePhotoFromGallery({required bool isVideo}) async {
    final ImagePicker picker = ImagePicker();
    final directory =
        '${(await getApplicationDocumentsDirectory()).path}\\EditImages';
    if (!await Directory(directory).exists()) {
      await Directory(directory).create(recursive: true);
    }
    if (!Platform.isWindows) {
      if (isVideo) {
        final XFile? video =
            await picker.pickVideo(source: ImageSource.gallery);
        String newPath = path.join(directory, video!.name);
        File file = await File(video.path).copy(newPath);
        return XFile(file.path);
      } else {
        final XFile? photo =
            await picker.pickImage(source: ImageSource.gallery);
        String newPath = path.join(directory, photo!.name);
        File file = await File(photo.path).copy(newPath);
        return XFile(file.path);
      }
    } else {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          'jpg',
          'png',
          'jepg',
          'mp4',
          'mov',
        ],
      );
      if (result != null) {
        String newPath = path.join(directory, result.files.single.path!);
        File file = await File(result.files.single.path!).copy(newPath);
        return XFile(file.path, bytes: file.readAsBytesSync());
      } else {
        return null;
      }
    }
  }
}
