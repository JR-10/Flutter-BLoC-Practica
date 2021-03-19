// ******************************************************************************
//  Archivo encargado de manejar toda la logica  de subir una entidad a Firestore
// *****************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platzi_bloc_practica/User/model/usuario.dart';

class CloudFirestoreAPI {
  // Decalaracion de Variables constantes (Mayusculas) para las colleciones
  final String USUARIOS = 'usuarios';
  final String PLACE = 'places';

  // Obtener la inicializacion o conecxion con el API (Obtener la entidad BD)
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Declaracion del Metodo para actualizaer el Usuario con el uid
  void updateUserData(Usuario usuario) async {
    DocumentReference ref = _db.collection(USUARIOS).doc(usuario.uid);

    // Setear los valores obtenidos con el uid del usuario
    return ref.set({
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
}
