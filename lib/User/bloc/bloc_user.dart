// desde este archivo se hara el llamado a las repository
// La responsabilidad de este archivo es manejar todos los casos de uso del Usuario

import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_bloc_practica/User/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  // Elecutar signOut
  signOut() {
    _auth_repository.signOut();
  }

  @override
  void dispose() {}
}
