// Swicheat la fuente de datos
import 'package:platzi_bloc_practica/User/model/usuario.dart';
import 'package:platzi_bloc_practica/User/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository {
  // Instancia de la clase CloudFirestoreAPI
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  // Metodo
  void updateUserDataFirestore(Usuario usuario) =>
      _cloudFirestoreAPI.updateUserData(usuario);
}
