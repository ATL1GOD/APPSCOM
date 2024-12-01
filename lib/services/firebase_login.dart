 /*
 import 'package:cloud_firestore/cloud_firestore.dart';
 import 'package:flutter/material.dart';
 
 void _submitForm(BuildContext context) async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      try {
        // Consulta a Firebase
        final userDoc = await FirebaseFirestore.instance
            .collection('Alumno') // Cambia a tu colección en Firebase
            .where('boleta', isEqualTo: boleta)
            .where('curp', isEqualTo: curp)
            .get();

        if (userDoc.docs.isNotEmpty) {
          // Inicio de sesión exitoso
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Inicio de sesión exitoso")),
          );
          // Navegar a otra pantalla, si es necesario
        } else {
          // Credenciales no válidas
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Credenciales incorrectas")),
          );
        }
      } catch (e) {
        // Manejo de errores
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${e.toString()}")),
        );
      }
    }
 }*/