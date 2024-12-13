import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HorariosScreen extends StatelessWidget {
  final String numEmpleado;

  const HorariosScreen({super.key, required this.numEmpleado});

  Future<List<Map<String, dynamic>>> fetchHorarios() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('Horario')
        .where('numEmpleado', isEqualTo: int.parse(numEmpleado))
        .get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grupos y Horarios'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchHorarios(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar los datos.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No se encontraron horarios.'));
          } else {
            final horarios = snapshot.data!;
            return ListView.builder(
              itemCount: horarios.length,
              itemBuilder: (context, index) {
                final horario = horarios[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text('${horario['materia']} (${horario['grupo']})'),
                    subtitle: Text(
                      'Salón: ${horario['salon']?? 'No asignado aun'}\n'
                      'Lab: ${horario['lab'] ?? 'Laboratorio no asignado'}\n'
                      'Lunes: ${horario['lunes'] ?? 'Sin clase'}\n'
                      'Martes: ${horario['martes'] ?? 'Sin clase'}\n'
                      'Miércoles: ${horario['miercoles'] ?? 'Sin clase'}\n'
                      'Jueves: ${horario['jueves'] ?? 'Sin clase'}\n'
                      'Viernes: ${horario['viernes'] ?? 'Sin clase'}',
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
