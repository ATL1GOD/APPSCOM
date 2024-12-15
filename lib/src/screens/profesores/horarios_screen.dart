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
          toolbarHeight: 60, 
          leading: Padding(
                  padding: const EdgeInsets.only(left: 10), // Margen izquierdo
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
                ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Grupos y Horarios',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
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
                  margin: const EdgeInsets.all(0),  // Puedes quitar el margen de la tarjeta
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Bordes redondeados para el efecto
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),  // Mantén los bordes redondeados
                      gradient: LinearGradient(
                        colors: [
                          const Color.fromARGB(255, 61, 151, 253), // Azul principal
                          const Color.fromARGB(255, 17, 50, 100), // Azul brillante
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    margin: const EdgeInsets.all(10),  // Márgenes alrededor de la tarjeta
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),  // Bordes redondeados
                      ),
                      color: Colors.white,  // Fondo blanco para el contenido de la tarjeta
                      child: ListTile(
                        title: Text(
                          '${horario['materia']} (${horario['grupo']})',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              height: 1.5,
                              letterSpacing: 0.5,
                            ),
                            children: [
                              TextSpan(
                                text: 'Salón: ',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: '${horario['salon'] ?? 'Aun no esta asignado'}\n',
                              ),
                              TextSpan(
                                text: 'Laboratorio: ',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: '${horario['lab'] ?? 'Aun no esta asignado'}\n',
                              ),
                              TextSpan(
                                text: 'Lunes: ',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: '${horario['lunes'] ?? 'Sin clase'}\n',
                              ),
                              TextSpan(
                                text: 'Martes: ',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: '${horario['martes'] ?? 'Sin clase'}\n',
                              ),
                              TextSpan(
                                text: 'Miércoles: ',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: '${horario['miercoles'] ?? 'Sin clase'}\n',
                              ),
                              TextSpan(
                                text: 'Jueves: ',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: '${horario['jueves'] ?? 'Sin clase'}\n',
                              ),
                              TextSpan(
                                text: 'Viernes: ',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: '${horario['viernes'] ?? 'Sin clase'}',
                              ),
                            ],
                          ),
                        ),
                      ),
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
