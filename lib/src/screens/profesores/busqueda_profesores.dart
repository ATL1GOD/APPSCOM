import 'package:flutter/material.dart';
import 'profesores_info.dart';
import 'profesores_detalles_screen.dart';


class BusquedaProfesores extends StatefulWidget {
  const BusquedaProfesores({super.key});

  @override
  State<BusquedaProfesores> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<BusquedaProfesores> {
  List<Contact> contacts = [];
  List<Contact> filteredContacts = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchContacts().then((data) {
      setState(() {
        contacts = data;
        filteredContacts = data;
      });
    });

    searchController.addListener(() {
      filterContacts();
    });
  }

  void filterContacts() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredContacts = contacts.where((contact) {
        return contact.nombre.toLowerCase().contains(query) ||
               contact.academia.toLowerCase().contains(query) ||
               contact.email.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 61, 151, 253), // Azul principal
                  const Color.fromARGB(255, 17, 50, 100), // Azul brillante
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          toolbarHeight: 90, 
          leading: Padding(
                  padding: const EdgeInsets.only(left: 15), // Margen izquierdo
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Acción al presionar
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2), // Fondo translúcido
                        shape: BoxShape.circle, // Forma circular
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new, // Ícono personalizado
                        size: 24,
                        color: Colors.white, // Color del ícono
                      ),
                    ),
                  ),
                ), //
          centerTitle: true,
          title: Text(
                'Buscador Profesores',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
        ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Buscar por Profesor, Academia o Email',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                itemCount: filteredContacts.length,
                itemBuilder: (context, index) {
                  final contact = filteredContacts[index];
                  // Define el degradado aquí
                  final gradient = LinearGradient(
                    colors: [
                      Colors.blue,
                      const Color.fromARGB(255, 58, 15, 99),
                    ], // Degradado azul-morado
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  );

                  return ListTile(
                    title: Text(contact.nombre),
                    subtitle: Text(contact.academia),
                    trailing: Text(contact.email),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (_) => ContactDetailScreen(
                            contact: contact,
                            gradient: gradient, // Pasar el degradado aquí
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}