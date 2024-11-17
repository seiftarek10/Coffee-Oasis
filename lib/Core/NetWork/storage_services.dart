import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

class StorageService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<String?> uploadPhoto({
    required File photo,
    required String folderName,
  }) async {
    try {
      String photoName = basename(photo.path);
      String timeStamp = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
      Reference ref =
          _firebaseStorage.ref(folderName).child('$photoName $timeStamp');
      await ref.putFile(photo);
      return await ref.getDownloadURL();
    } catch (e) {
      return null;
    }
  }

  Future<void> deletePhoto({required String? url}) async {
    if (url == null) {
      return;
    }
    await _firebaseStorage.refFromURL(url).delete();
  }
}
