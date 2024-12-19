import 'package:flutter/material.dart';
import 'maestria_item.dart';
import 'maestria_appbar.dart';
import 'package:appscom/src/screens/home/imagen_completa.dart';

class MaestriaInteligencia extends StatelessWidget {
  final MaestriasItem maestriaItem;

  const MaestriaInteligencia({super.key, required this.maestriaItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MaestriaAppbar(index: 0), 
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
                      "Objetivos",
                      textAlign: TextAlign.center, // Centra el texto horizontalmente
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white, // Color del texto
                            fontWeight: FontWeight.bold, // Negrita para destacar
                          ),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  Text(
                    maestriaItem.objectivo,
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
                      "Requisitos de Ingreso",
                      textAlign: TextAlign.center, // Centra el texto horizontalmente
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white, // Color del texto
                            fontWeight: FontWeight.bold, // Negrita para destacar
                          ),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  Text(
                    maestriaItem.requisitosIngreso,
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
                      "Becas",
                      textAlign: TextAlign.center, // Centra el texto horizontalmente
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white, // Color del texto
                            fontWeight: FontWeight.bold, // Negrita para destacar
                          ),
                    ),
                  ),

                  const SizedBox(height: 25.0),
                  Text(
                    maestriaItem.becas,
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
                      "Obtencion de grado",
                      textAlign: TextAlign.center, // Centra el texto horizontalmente
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white, // Color del texto
                            fontWeight: FontWeight.bold, // Negrita para destacar
                          ),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  Text(
                    maestriaItem.obtencionGrado,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 16.0, 
                          fontFamily: 'ExtraLight',),
                    textAlign: TextAlign.justify,
                  ),
                  
                  
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
                    maestriaItem.campoLaboral,
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
                      "Plan de Estudios",
                      textAlign: TextAlign.center, // Centra el texto horizontalmente
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white, // Color del texto
                            fontWeight: FontWeight.bold, // Negrita para destacar
                          ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  GestureDetector(
                     onTap: () {
                       Navigator.push(
                         context,
                         MaterialPageRoute(
                           builder: (context) => ImagenCompleta(
                             imagenAssets: 'assets/png/plan/maestria1.png',
                           ),
                         ),
                       );
                     },
                     child: ClipRRect( // ClipRRect lo usamos para que pueda recortar los bordes de un widget hijo
                       borderRadius: BorderRadius.circular(8.0),
                       child: Image.asset(
                         'assets/png/plan/maestria1.png',
                         fit: BoxFit.cover,
                         height: 500.0,
                         width: double.infinity,
                       ),
                     ),
                   ),
                  const SizedBox(height: 25.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
