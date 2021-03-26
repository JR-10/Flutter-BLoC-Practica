import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FirebaseStorageAPI {
  firebase_storage.Reference _storageReference =
      firebase_storage.FirebaseStorage.instance.ref();

  // Metodo para enfocarse a la subida del archivo
  Future<firebase_storage.UploadTask> uploadFile(
      String path, File image) async {
    // path, directory where to save
    // image, real file to store

    return Future.value(_storageReference.child(path).putFile(image));
  }
}
