// Archivo que contiene toda la logica respecto a la conecxion con firebase

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {
  // *************** declaracion de variables globales ***********************

  // variable que contiene la instancia de firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // variable que contiene la instancia de google SingIn
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // *************** Metodo para el Inicio de Sesion *****************
  Future<User> currentUser() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    GoogleAuthCredential credential = GoogleAuthProvider.credential(
        idToken: gSA.idToken, accessToken: gSA.accessToken);

    UserCredential authResult = await _auth.signInWithCredential(credential);
    User user = authResult.user;

    return user;
  }

  // *************** Metodo para el Cierre de Sesion *****************
  signOut() async {
    await _auth.signOut().then((value) => print("Sesion Cerrada"));

    // cerrar sesion en google google
    googleSignIn.signOut();
    print('Sesiones Cerradas');
  }

  /*
  // *************** creacion del metodo **********************
  // se coloca (asUync) por que esta ejecutando una conexion en segundo plano
  Future<FirebaseUser> SignIn() async {
    // *********************  autenticacion con Google *************************

    // abrir caja de dialogo cuando orimimos el boton de iniciar sesion
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

    // obtener las credeciales de la cuenta con que nos registramos
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    // **********************  autenticacion con Firebase ***************
    // FirebaseUser user = await _auth.signInWithCredential(GoogleAuthProvider.getCredential(idToken: gSA.idToken, accessToken: gSA.accessToken));
    FirebaseUser user = await _auth.signInWithCredential(
        GoogleAuthProvider.credential(
            idToken: gSA.idToken, accessToken: gSA.accessToken));

    return user;
  }*/
}
