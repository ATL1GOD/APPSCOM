import 'package:flutter/material.dart';
import 'contact.dart';
import 'profesores_cards.dart';

class ContactDetailScreen extends StatelessWidget {
  const ContactDetailScreen({
    super.key,
    required this.contact,
    required this.color,
  });

  final Contact contact;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contact.nombre),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: ContactCard(
            contact: contact,
            gradient: LinearGradient(
              colors: [color.withOpacity(0.5), color],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            //borderColor: color,
          ),
        ),
      ),
    );
  }
}
