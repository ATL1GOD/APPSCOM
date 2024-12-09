import 'package:cloud_firestore/cloud_firestore.dart';

class Contact {
  const Contact(
    this.nombre,
    this.role,
    this.academia,
    this.aula,
    this.email,
    this.empleado,
    this.lunes,
    this.martes,
    this.miercoles,
    this.jueves,
    this.viernes,
  );

  final String nombre;
  final String role;
  final String academia;
  final String aula;
  final String email;
  final String empleado;
  final String lunes;
  final String martes;
  final String miercoles;
  final String jueves;
  final String viernes;

  // Método para crear un Contact desde Firestore
  factory Contact.fromFirestore(Map<String, dynamic> data) {
    return Contact(
      '${data['nombre']} ${data['primerApellido']} ${data['segundoApellido']}', // Nombre completo
      'Profesor', // Puedes personalizar esto
      '${data['academia']} (${data['siglasAcademia']})', // Siglas de la academia
      '${data['aula']}', // Aula
      '${data['email']}', // Email
      '${data['numEmpleado']}', // Teléfono
      '${data['lunes'] ?? 'No disponible'}', // Lunes
      '${data['martes'] ?? 'No disponible'}', // Martes
      '${data['miercoles'] ?? 'No disponible'}', // Miércoles
      '${data['jueves'] ?? 'No disponible'}', // Jueves
      '${data['viernes'] ?? 'No disponible'}', // Viernes
    );
  }
}

Future<List<Contact>> fetchContacts() async {
  // Obtén la colección 'Profesor' de Firestore
  final snapshot = await FirebaseFirestore.instance.collection('Profesor').get();

  // Convierte los documentos en objetos Contact
  return snapshot.docs.map((doc) {
    return Contact.fromFirestore(doc.data() as Map<String, dynamic>);
  }).toList();
}

void loadContacts() async {
  final contacts = await fetchContacts();
  contacts.forEach((contact) {
    print(contact.nombre); // Imprime los nombres en la consola
  });
}





















