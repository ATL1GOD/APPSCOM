import 'package:flutter/material.dart';
import 'profesores_info.dart';
import 'profesores_detalles_screen.dart';
import 'profesores_cards.dart';
import 'perspective_list_view.dart';
import 'busqueda_profesores.dart';
import 'package:appscom/src/screens/global_menu/custom_drawer.dart';

class ContactListPage extends StatefulWidget {
  static const String routeName = '/profesores';
  const ContactListPage({super.key});

  @override
  ContactListPageState createState() => ContactListPageState();
}

class ContactListPageState extends State<ContactListPage> {
  int? _visibleItems;
  double? _itemExtent;
  List<Contact> _contacts = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _visibleItems = 6;
    _itemExtent = 270.0;
    _loadContacts(); // Cargar contactos al inicializar
  }

  Future<void> _loadContacts() async {
    try {
      final contacts = await fetchContacts();
      setState(() {
        _contacts = contacts..sort((a, b) => b.nombre.compareTo(a.nombre)); // Ordenar por nombre
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = "Error al cargar contactos: $e";
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MenuGlobal(
      selectedIndex: 5,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
          toolbarHeight: 60, //
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Profesores',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 3),
            ],
          ),
          actions: [ //
              Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 2, top: 13 ), 
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BusquedaProfesores()),
                    );
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white, // Fondo translúcido
                      shape: BoxShape.circle, // Forma circular
                    ),
                    child: const Icon(
                      Icons.search,
                      size: 20,
                      color: Color.fromARGB(255, 0, 0, 0), // Color del ícono
                    ),
                  ),
                ),
              ),
            ],
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _errorMessage != null
                ? Center(child: Text(_errorMessage!))
                : PerspectiveListView(
                    visualizedItems: _visibleItems,
                    itemExtent: _itemExtent,
                    initialIndex: 7,
                    enableBackItemsShadow: true,
                    backItemsShadowColor: Theme.of(context).scaffoldBackgroundColor,
                    padding: const EdgeInsets.all(10),
                    onTapFrontItem: (index) {
                      final gradient = LinearGradient(
                        colors: [
                          Colors.blue,
                          const Color.fromARGB(255, 58, 15, 99), // Azul-Morado degradado
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (_) => ContactDetailScreen(
                            contact: _contacts[index!],
                            gradient: gradient,
                          ),
                        ),
                      );
                    },
                    children: List.generate(_contacts.length, (index) {
                      final contact = _contacts[index];
                      return ContactCard(
                        contact: contact,
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue,
                            const Color.fromARGB(255, 58, 15, 99), // Azul-Morado degradado
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      );
                    }),
                  ),
      ),
    );
  }
}
