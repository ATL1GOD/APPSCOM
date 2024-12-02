import 'package:flutter/material.dart';
import 'carreras_item.dart';
import 'app_bar.dart';
class LicDatos extends StatelessWidget {
  final CarreraItem carreraItem;

  const LicDatos({super.key, required this.carreraItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CarreraAppBar(index: 2), 
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity, // Ocupa todo el ancho disponible
                    padding: const EdgeInsets.symmetric(vertical: 12.0), // Espaciado interno
                    decoration: BoxDecoration(
                         color: const Color.fromARGB(255, 55, 134, 199), // Fondo azul
                         borderRadius: BorderRadius.circular(16.0), // Esquinas redondeadas
                         boxShadow: [
                           BoxShadow(
                             color: Colors.black.withOpacity(0.3), // Sombra para simular el bisel
                             offset: const Offset(4, 4), // Dirección de la sombra (abajo y derecha)
                             blurRadius: 6, // Difuminado
                             spreadRadius: 1, // Extensión de la sombra
                           ),
                           BoxShadow(
                             color: Colors.white.withOpacity(0.7), // Luz superior para bisel
                             offset: const Offset(-4, -4), // Dirección opuesta (arriba y izquierda)
                             blurRadius: 6,
                             spreadRadius: 1,
                           ),
                         ],
                       ), // Fondo azul
                    child: Text(
                      "Objetivo",
                      textAlign: TextAlign.center, // Centra el texto horizontalmente
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white, // Color del texto
                            fontWeight: FontWeight.bold, // Negrita para destacar
                          ),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  Text(
                    carreraItem.objectivo,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 16.0, 
                          fontFamily: 'ExtraLight',),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 25.0),

                  Container(
                    width: double.infinity, // Ocupa todo el ancho disponible
                    padding: const EdgeInsets.symmetric(vertical: 12.0), // Espaciado interno
                    decoration: BoxDecoration(
                         color: const Color.fromARGB(255, 55, 134, 199), // Fondo azul
                         borderRadius: BorderRadius.circular(16.0), // Esquinas redondeadas
                         boxShadow: [
                           BoxShadow(
                             color: Colors.black.withOpacity(0.3), // Sombra para simular el bisel
                             offset: const Offset(4, 4), // Dirección de la sombra (abajo y derecha)
                             blurRadius: 6, // Difuminado
                             spreadRadius: 1, // Extensión de la sombra
                           ),
                           BoxShadow(
                             color: Colors.white.withOpacity(0.7), // Luz superior para bisel
                             offset: const Offset(-4, -4), // Dirección opuesta (arriba y izquierda)
                             blurRadius: 6,
                             spreadRadius: 1,
                           ),
                         ],
                       ), 
                    child: Text(
                      "Perfil de Ingreso",
                      textAlign: TextAlign.center, // Centra el texto horizontalmente
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white, // Color del texto
                            fontWeight: FontWeight.bold, // Negrita para destacar
                          ),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  Text(
                    carreraItem.perfilIngreso,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 16.0, 
                          fontFamily: 'ExtraLight',),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 25.0),
                  
                  Container(
                    width: double.infinity, // Ocupa todo el ancho disponible
                    padding: const EdgeInsets.symmetric(vertical: 12.0), // Espaciado interno
                    decoration: BoxDecoration(
                         color: const Color.fromARGB(255, 55, 134, 199), // Fondo azul
                         borderRadius: BorderRadius.circular(16.0), // Esquinas redondeadas
                         boxShadow: [
                           BoxShadow(
                             color: Colors.black.withOpacity(0.3), // Sombra para simular el bisel
                             offset: const Offset(4, 4), // Dirección de la sombra (abajo y derecha)
                             blurRadius: 6, // Difuminado
                             spreadRadius: 1, // Extensión de la sombra
                           ),
                           BoxShadow(
                             color: Colors.white.withOpacity(0.7), // Luz superior para bisel
                             offset: const Offset(-4, -4), // Dirección opuesta (arriba y izquierda)
                             blurRadius: 6,
                             spreadRadius: 1,
                           ),
                         ],
                       ), 
                    child: Text(
                      "Perfil de Egreso",
                      textAlign: TextAlign.center, // Centra el texto horizontalmente
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white, // Color del texto
                            fontWeight: FontWeight.bold, // Negrita para destacar
                          ),
                    ),
                  ),

                  const SizedBox(height: 25.0),
                  Text(
                    carreraItem.perfilEgreso,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 16.0, 
                          fontFamily: 'ExtraLight',),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 25.0),
                  Container(
                    width: double.infinity, // Ocupa todo el ancho disponible
                    padding: const EdgeInsets.symmetric(vertical: 12.0), // Espaciado interno
                    decoration: BoxDecoration(
                         color: const Color.fromARGB(255, 55, 134, 199), // Fondo azul
                         borderRadius: BorderRadius.circular(16.0), // Esquinas redondeadas
                         boxShadow: [
                           BoxShadow(
                             color: Colors.black.withOpacity(0.3), // Sombra para simular el bisel
                             offset: const Offset(4, 4), // Dirección de la sombra (abajo y derecha)
                             blurRadius: 6, // Difuminado
                             spreadRadius: 1, // Extensión de la sombra
                           ),
                           BoxShadow(
                             color: Colors.white.withOpacity(0.7), // Luz superior para bisel
                             offset: const Offset(-4, -4), // Dirección opuesta (arriba y izquierda)
                             blurRadius: 6,
                             spreadRadius: 1,
                           ),
                         ],
                       ), 
                    child: Text(
                      "Campo Laboral",
                      textAlign: TextAlign.center, // Centra el texto horizontalmente
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white, // Color del texto
                            fontWeight: FontWeight.bold, // Negrita para destacar
                          ),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  Text(
                    carreraItem.campoLaboral,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 16.0, 
                          fontFamily: 'ExtraLight',),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

