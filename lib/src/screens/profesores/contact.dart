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


















/*
class Contact {
  const Contact(
    this.name,
    this.role,
    this.address,
    this.phone,
    this.email,
    this.website,
  );

  final String name;
  final String role;
  final String address;
  final String phone;
  final String email;
  final String website;

  static const contacts = [
    Contact(
      'Bette Gracey',
      'Biostatistician IV',
      '1 Cherokee Parkway',
      '804-575-0381',
      'bgracey0@feed.pl',
      'utexas.edu',
    ),
    Contact(
      'Somerset Yosselevitch',
      'Mechanical Systems Engineer',
      '654 Monument Hill',
      '786-374-1734',
      'syosselevitch1@weebly.com',
      'fda.gov',
    ),
    Contact(
      'Laurette Bertolaccini',
      'Information Systems Manager',
      '64962 Bashford Court',
      '314-318-3639',
      'lbertolaccini2@hostgator.com',
      'bing.com',
    ),
    Contact(
      'Maisey Oficer',
      'Staff Accountant IV',
      '23 Meadow Vale Point',
      '337-125-3557',
      'mofficer3@state.gov',
      'auda.org.au',
    ),
    Contact(
      'Enrico Clementet',
      'Account Executive',
      '96 Fallview Terrace',
      '613-601-9077',
      'eclementet4@walmart.com',
      'nature.com',
    ),
    Contact(
      'Shawnee Lemary',
      'Recruiting Manager',
      '7105 Red Cloud Drive',
      '336-308-8202',
      'slemary5@opensource.org',
      'nba.com',
    ),
    Contact(
      'Rutledge Manion',
      'Biostatistician II',
      '9 Rusk Crossing',
      '538-602-3301',
      'rmanion6@google.com.au',
      'deviantart.com',
    ),
    Contact(
      'Rebekkah Maplesden',
      'Associate Professor',
      '49957 Michigan Drive',
      '371-946-7606',
      'rmaplesden7@gizmodo.com',
      'icq.com',
    ),
    Contact(
      'Demetrius Ianittello',
      'Account Representative II',
      '6952 Almo Court',
      '909-544-6130',
      'dianittello8@nationalgeographic.com',
      'slate.com',
    ),
    Contact(
      'Jordanna Michelin',
      'Design Engineer',
      '7569 Pond Lane',
      '155-907-8226',
      'jmichelina@toplist.cz',
      'hexun.com',
    ),
    Contact(
      'Ardelle Moxted',
      'Budget/Accounting Analyst IV',
      '745 Gateway Court',
      '937-551-4302',
      'amoxted9@fda.gov',
      'state.gov',
    ),
    Contact(
      'Harwell Tainton',
      'Media Manager II',
      '8403 Talmadge Drive',
      '175-331-5930',
      'htaintonb@webeden.co.uk',
      'dot.gov',
    ),
    Contact(
      'Lem Wiseman',
      'Analyst Programmer',
      '6 Morning Pass',
      '790-575-5543',
      'lwisemanc@usatoday.com',
      'biglobe.ne.jp',
    ),
    Contact(
      'Lucio Shakle',
      'Software Engineer IV',
      '47858 Monument Terrace',
      '619-672-8470',
      'lshakled@exblog.jp',
      'blog.com',
    ),
    Contact(
      'Genna Losebie',
      'Account Coordinator',
      '32 Kropf Place',
      '839-854-2730',
      'glosebiee@google.co.jp',
      'latimes.com',
    ),
    Contact(
      'Yolande Cyster',
      'Web Developer I',
      '337 Saint Paul Center',
      '636-156-8613',
      'ycysterf@dot.gov',
      'shinystat.com',
    ),
    Contact(
      'Jennee Bencher',
      'Programmer Analyst II',
      '27 Sauthoff Crossing',
      '715-609-7880',
      'jbencherg@japanpost.jp',
      'google.com.br',
    ),
    Contact(
      'Dyane Kairns',
      'Dental Hygienist',
      '02 3rd Lane',
      '455-267-0183',
      'dkairnsh@jalbum.net',
      'posterous.com',
    ),
    Contact(
      'Jonas Warlowe',
      'Recruiting Manager',
      '7888 Hallows Road',
      '968-821-6047',
      'jwarlowei@macromedia.com',
      'examiner.com',
    ),
    Contact(
      'Mildrid Largan',
      'Electrical Engineer',
      '936 Jana Crossing',
      '322-722-6715',
      'mlarganj@geocities.jp',
      'hp.com',
    ),
  ];
}*/
