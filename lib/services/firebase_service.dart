import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db =FirebaseFirestore.instance;

Future<List> getAlumno() async {
  List alumno = [];
  CollectionReference collectionReferenceAlumno = db.collection('Alumno');

  QuerySnapshot queryAlumno = await collectionReferenceAlumno.get();

  for (var documento in queryAlumno.docs) {
    alumno.add(documento.data());
  }


  return alumno;
}