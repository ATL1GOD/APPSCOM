import 'package:flutter/material.dart';
import 'contact.dart';

class SearchDialog extends StatefulWidget {
  final List<Contact> contacts;
  final Function(List<Contact>) onSearch;

  const SearchDialog({
    super.key,
    required this.contacts,
    required this.onSearch,
  });

  @override
  State<SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchDialog> {
  String _searchText = '';
  String _selectedCriterion = 'nombre'; // Criterio por defecto
  List<Contact> _filteredContacts = [];

  @override
  void initState() {
    super.initState();
    _filteredContacts = widget.contacts;
  }

  void _performSearch() {
    setState(() {
      _filteredContacts = widget.contacts.where((contact) {
        switch (_selectedCriterion) {
          case 'nombre':
            return contact.nombre.toLowerCase().contains(_searchText.toLowerCase());
          case 'cubiculo':
            return contact.aula.toLowerCase().contains(_searchText.toLowerCase());
          case 'academia':
            return contact.academia.toLowerCase().contains(_searchText.toLowerCase());
          default:
            return false;
        }
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Buscar Contacto"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: "Término de búsqueda",
            ),
            onChanged: (value) {
              _searchText = value;
              _performSearch();
            },
          ),
          const SizedBox(height: 10),
          DropdownButton<String>(
            value: _selectedCriterion,
            onChanged: (value) {
              setState(() {
                _selectedCriterion = value!;
                _performSearch();
              });
            },
            items: const [
              DropdownMenuItem(value: 'nombre', child: Text('Nombre')),
              DropdownMenuItem(value: 'cubiculo', child: Text('Cubículo')),
              DropdownMenuItem(value: 'academia', child: Text('Academia')),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancelar"),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onSearch(_filteredContacts);
            Navigator.pop(context);
          },
          child: const Text("Aplicar"),
        ),
      ],
    );
  }
}
