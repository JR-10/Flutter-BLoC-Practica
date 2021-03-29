// Swicheat la fuente de datos
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platzi_bloc_practica/Place/model/place.dart';
import 'package:platzi_bloc_practica/User/model/usuario.dart';
import 'package:platzi_bloc_practica/User/repository/cloud_firestore_api.dart';
import 'package:platzi_bloc_practica/User/ui/widgets/profile_place.dart';

class CloudFirestoreRepository {
  // Instancia de la clase CloudFirestoreAPI
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  // llamada Metodo
  void updateUserDataFirestore(Usuario usuario) =>
      _cloudFirestoreAPI.updateUserData(usuario);

  Future<void> updatePlaceDate(Place place) =>
      _cloudFirestoreAPI.updatePlaceData(place);

  List<ProfilePlace> buildPlaces(List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreAPI.buildPlaces(placesListSnapshot);
}
