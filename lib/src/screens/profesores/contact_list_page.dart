import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'contact.dart';

class ContactListPage extends StatefulWidget {
  const ContactListPage({super.key});

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
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
        title: const Text('Lista de Profesores'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Buscar',
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
                return ListTile(
                  title: Text(contact.nombre),
                  subtitle: Text(contact.academia),
                  trailing: Text(contact.email),
                  onTap: () {
                    // Manejar clic en contacto
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


/*
import 'package:flutter/material.dart';
import 'contact.dart';
import 'contact_detail_screen.dart';
import 'profesores_cards.dart';
import 'perspective_list_view.dart';

class ContactListPage extends StatefulWidget {
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
    _visibleItems = 8;
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
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text('TEMPLATE GALLERY'),
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
                        colors: [Colors.blue, const Color.fromARGB(255, 46, 7, 138)], // Degradado azul-morado
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                    ),
                    );
                  }),
                ),
     // drawer: _buildDrawer(),
    );
  }

  Widget _buildDrawer() {
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
  }
}
*/