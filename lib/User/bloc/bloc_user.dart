// desde este archivo se hara el llamado a las repository
// La responsabilidad de este archivo es manejar todos los casos de uso del Usuario

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_bloc_practica/Place/model/place.dart';
import 'package:platzi_bloc_practica/Place/repository/firebase_storage_repository.dart';
import 'package:platzi_bloc_practica/Place/ui/widgets/card_image.dart';
import 'package:platzi_bloc_practica/User/model/usuario.dart';
import 'package:platzi_bloc_practica/User/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_bloc_practica/User/repository/cloud_firestore_api.dart';
import 'package:platzi_bloc_practica/User/repository/cloud_firestore_repository.dart';
import 'package:platzi_bloc_practica/User/ui/widgets/profile_place.dart';

class UserBloc implements Bloc {
  // ******* declaracion de variable para llamar al metodo SignIn *******
  final _auth_repository = AuthRepository();

  // ********* Flujo de datos - Streams ********
  // Stream - Firebase => definir la clase (StreamController => para definir nuestro propio flujo de datos o alterarlo)
  Stream<User> streamFirebase = FirebaseAuth.instance.authStateChanges();

  // validar el estado de la autenticacion
  Stream<User> get authStatus => streamFirebase;

  // *******  Casos de Uso de la aplicacion **********
  // 1 = SignIn con Google
  Future<User> signIn() {
    return _auth_repository.signInFirebase();
  }

  // 2 = Registrar Usuario en BD
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(Usuario usuario) =>
      _cloudFirestoreRepository.updateUserDataFirestore(usuario);

  // 3 = Registrar Places en BD
  Future<void> updatePlaceData(Place place) =>
      _cloudFirestoreRepository.updatePlaceDate(place);

  // Stream para mantener la escucha de los places alamcenados en la BD y mantenerlos actualizados cuando se haga un cambio
  Stream<QuerySnapshot> placesListStream = FirebaseFirestore.instance
      .collection(CloudFirestoreAPI().PLACES)
      .snapshots();

  // Stream para acceder al stream anterior
  Stream<QuerySnapshot> get placesStream => placesListStream;

  // revisar codigo
  List<CardImage> buildPlaces(List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreRepository.buildPlaces(placesListSnapshot);

  // Metodo para realizar un filtrado de datos
  Stream<QuerySnapshot> myPLacesListStream(String uid) => FirebaseFirestore
      .instance
      .collection(CloudFirestoreAPI().PLACES)
      .where("userOwner",
          isEqualTo: FirebaseFirestore.instance
              .doc("${CloudFirestoreAPI().USUARIOS}/${uid}"))
      .snapshots();

  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreRepository.buildMyPlaces(placesListSnapshot);

  // 4 =
  final _firebaseStoreRepository = FirebaseStorageRepository();
  Future<UploadTask> uploadFile(String path, File image) =>
      _firebaseStoreRepository.uploadFile(path, image);

  // cerrar sesion Elecutar signOut
  signOut() {
    _auth_repository.signOut();
  }

  @override
  void dispose() {}
}
