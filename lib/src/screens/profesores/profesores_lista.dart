import 'package:flutter/material.dart';
import 'profesores_info.dart';
import 'profesores_detalles_screen.dart';
import 'profesores_cards.dart';
import 'perspective_list_view.dart';
import 'busqueda_profesores.dart';
import 'package:appscom/src/screens/global_menu/custom_drawer.dart';

class ContactListPage extends StatefulWidget {
  static const String routeName ='/profesores';
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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            // Navegar a la pantalla de BusquedaProfesores
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BusquedaProfesores()),
            );
          },
          icon: const Icon(Icons.search),
        ),
      ],
      title: const Text('Profesores'),
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
                  // Aquí se usa el degradado
                  final gradient = LinearGradient(
                    colors: [
                      Colors.blue,
                      const Color.fromARGB(255, 58, 15, 99),
                    ], // Degradado azul-morado
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (_) => ContactDetailScreen(
                        contact: _contacts[index!],
                        gradient: gradient, // Usar el mismo degradado aquí
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
                        const Color.fromARGB(255, 58, 15, 99),
                      ], // Degradado azul-morado
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  );
                }),
              ),
        ),
  ); 
}


  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
       actions: [
            IconButton(
              onPressed: () {
                // Navegar a la pantalla de BusquedaProfesores
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BusquedaProfesores()),
                );
              },
              icon: const Icon(Icons.search),
            ),
          ],

        title: const Text('Profesores'),
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
                    final color = Colors.accents[index! % Colors.accents.length]; 
                    Navigator.push(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (_) => ContactDetailScreen(
                          contact: _contacts[index],
                          color: color,
                        ),
                      ),
                    );
                  },                    

                  children: List.generate(_contacts.length, (index) {
                  //  final borderColor = Colors.accents[index % Colors.accents.length];
                    final contact = _contacts[index];
                    return ContactCard(
                      // borderColor: null,
                      contact: contact,
                       gradient: LinearGradient(
                        colors: [Colors.blue, const Color.fromARGB(255, 58, 15, 99)], // Degradado azul-morado
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                    ),
                    );
                  }),
                ),
     //drawer: _buildDrawer(),
    );
  }*/

  /*Widget _buildDrawer() {
    return Drawer(
      child: Material(
        textStyle: const TextStyle(color: Colors.white, fontSize: 16),
        child: Container(
          color: const Color(0xFF5B4382),
          padding: const EdgeInsets.all(20),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.settings_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    Text(
                      ' Settings',
                      style: TextStyle(
                        fontSize: 26,
                      ),
                    ),
                  ],
                ),
                const Divider(height: 40),
                Row(
                  children: [
                    const Icon(
                      Icons.visibility_rounded,
                      color: Colors.white,
                      size: 16,
                    ),
                    const Text(
                      ' Visible items',
                      style: TextStyle(),
                    ),
                    Expanded(
                      child: Slider(
                        value: _visibleItems!.toDouble(),
                        min: 1,
                        max: 15,
                        divisions: 15,
                        label: '$_visibleItems',
                        activeColor: Colors.deepPurple[200],
                        inactiveColor: Colors.deepPurple[400],
                        onChanged: (value) {
                          setState(() {
                            _visibleItems = value.toInt();
                          });
                        },
                      ),
                    )
                  ],
                ),
                const Divider(height: 40),
                Row(
                  children: [
                    const Icon(
                      Icons.widgets,
                      color: Colors.white,
                      size: 16,
                    ),
                    const Text(
                      ' Item Extent',
                      style: TextStyle(),
                    ),
                    Expanded(
                      child: Slider(
                        value: _itemExtent!,
                        min: 270,
                        max: MediaQuery.of(context).size.height * .8,
                        label: '$_itemExtent',
                        activeColor: Colors.deepPurple[200],
                        inactiveColor: Colors.deepPurple[400],
                        onChanged: (value) {
                          setState(() {
                            _itemExtent = value;
                          });
                        },
                      ),
                    )
                  ],
                ),
                const Divider(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }*/
}