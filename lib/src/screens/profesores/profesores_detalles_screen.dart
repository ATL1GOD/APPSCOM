import 'package:flutter/material.dart';
import 'profesores_info.dart';
import 'profesores_cards.dart';

class ContactDetailScreen extends StatelessWidget {
  const ContactDetailScreen({
    super.key,
    required this.contact,
    required this.gradient,
  });

  final Contact contact;
  final LinearGradient? gradient;

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
              colors: [gradient?.colors.first.withOpacity(0.5) ?? Colors.transparent, gradient?.colors.last ?? Colors.transparent],
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
