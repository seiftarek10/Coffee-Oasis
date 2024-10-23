import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class StorageService {
  final FirebaseStorage _firebaseStorage;

  StorageService(this._firebaseStorage);

  Future<String?> uploadPhoto({
    required File photo,
    required String folderName,
  }) async {
    try {
      String photoName = basename(photo.path);
      Reference ref = _firebaseStorage.ref(folderName).child(photoName);
      await ref.putFile(photo);
      return await ref.getDownloadURL();
    } catch (e) {
      return null;
    }
  }

  Future<void> deletePhoto({required String url}) async {
    await _firebaseStorage.refFromURL(url).delete();
  }
}
