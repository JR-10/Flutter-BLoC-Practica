// Contiene la lagica de Repository (Controlar las fuentes de datos), swwuichear con la fuente de datos

import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_bloc_practica/User/repository/firebase_auth_api.dart';

class AuthRepository {
  final _firebaseAuthAPI = FirebaseAuthAPI();

  Future<User> signInFirebase() => _firebaseAuthAPI.currentUser();
}
