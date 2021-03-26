// ******************************************************************************
//  Archivo encargado de manejar toda la logica  de subir una entidad a Firestore
// *****************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_bloc_practica/Place/model/place.dart';
import 'package:platzi_bloc_practica/User/model/usuario.dart';

class CloudFirestoreAPI {
  // Decalaracion de Variables constantes (Mayusculas) para las colleciones
  final String USUARIOS = 'usuarios';
  final String PLACES = 'places';
  String obtenerUsuario;

  // Obtener la inicializacion o conecxion con el API (Obtener la entidad BD)
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Stream<User> _auth = FirebaseAuth.instance.authStateChanges();

  // Declaracion del Metodo para actualizaer el Usuario con el uid
  void updateUserData(Usuario usuario) async {
    this.obtenerUsuario = usuario.uid;

    DocumentReference ref = _db.collection(USUARIOS).doc(usuario.uid);

    print('ID DEL USUARIO: ${usuario.uid}');

    // Setear los valores obtenidos con el uid del usuario
    return await ref.set({
      'uid': usuario.uid,
      'name': usuario.name,
      'email': usuario.email,
      'photoURL': usuario.photoUrl,
      'state': true,
      'myPlaces': usuario.myPlaces,
      'myFavoritePlaces': usuario.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    }, SetOptions(merge: true));
  }

  // ***************** Controlar al subida del place **************
  Future<void> updatePlaceData(Place place) async {
    print('ENTRO A ACTUALIZAR');
    // accediendo a la data para subir un place

    // Con esta linea el firebase asigna el id automatico
    CollectionReference refPlaces = _db.collection(PLACES);
    print('Valor de la referencia: ${refPlaces.firestore}');
    await refPlaces
        .add({
          'name': place.name,
          'description': place.description,
          'urlImage': place.urlImage,
          'likes': place.likes,
          'userOwner': "$USUARIOS/${place.userOwner.uid}" //reference
        })
        .then((docRef) => {print('Documento creado con ID:  ${docRef.id}')})
        .catchError(
            (error) => {print('Error al agregar el documento:  $error')});
  }
}
