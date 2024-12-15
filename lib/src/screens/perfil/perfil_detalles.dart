import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appscom/src/screens/bottons/carreras/carrera_icon.dart';
import 'package:appscom/src/screens/global_menu/custom_drawer.dart';

class PerfilUsuario extends StatelessWidget {
  final String nombre;
  static const String routename = '/perfil';

  const PerfilUsuario({super.key, required this.nombre});

  Future<Map<String, dynamic>?> _fetchAlumnoData(String nombre) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('Alumno')
          .where('nombre', isEqualTo: nombre)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first.data();
      }
    } catch (e) {
      debugPrint('Error fetching data: $e');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MenuGlobal(
      selectedIndex: 4, // Add the required selectedIndex parameter
    child:Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: _fetchAlumnoData(nombre),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.white),
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
              child: Text(
                'No se encontraron datos',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          final alumnoData = snapshot.data!;
          return CustomScrollView(
            slivers: <Widget>[
              PerfilAppBar(index: nombre, alumnoData: alumnoData), // Se incluye el encabezado dinámico
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        
                          Container(
                         width: double.infinity,// Ocupa todo el ancho disponible
                         padding: const EdgeInsets.symmetric(vertical: 12.0), // Espaciado interno
                         decoration: BoxDecoration(
                         color: const Color(0xFF005B8D), // Fondo azul
                         borderRadius: BorderRadius.circular(20.0), // Esquinas redondeadas
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
                          "Datos del Alumno",
                          textAlign: TextAlign.center, // Centra el texto horizontalmente                            
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                      ),
                        
                        const SizedBox(height: 20),
                        
                          Container(
                         width: double.infinity, // Ocupa todo el ancho disponible
                         padding: const EdgeInsets.symmetric(vertical: 12.0), // Espaciado interno
                         decoration: BoxDecoration(
                         color: const Color(0xFF007BB5), // Fondo azul
                         borderRadius: BorderRadius.circular(20.0), // Esquinas redondeadas
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
                          'Boleta: ${alumnoData['boleta']}',
                          textAlign: TextAlign.center, // Centra el texto horizontalmente                            
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                      ),
                        
                        const SizedBox(height: 20),
                        
                      Container(
                      width: double.infinity, // Ocupa todo el ancho disponible
                      padding: const EdgeInsets.symmetric(vertical: 12.0), // Espaciado interno
                      decoration: BoxDecoration(
                         color: const Color(0xFF3399CC), // Fondo azul
                         borderRadius: BorderRadius.circular(20.0), // Esquinas redondeadas
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
                          'CURP: ${alumnoData['curp']}',
                          textAlign: TextAlign.center, // Centra el texto horizontalmente                            
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                      ),
                        
                        const SizedBox(height: 20),
                
                          Container(
                      width: double.infinity, // Ocupa todo el ancho disponible
                      padding: const EdgeInsets.symmetric(vertical: 12.0), // Espaciado interno
                      decoration: BoxDecoration(
                         color: const Color(0xFF66B2FF), // Fondo azul
                         borderRadius: BorderRadius.circular(20.0), // Esquinas redondeadas
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
                          'Carrera: ${alumnoData['carrera']}',
                          textAlign: TextAlign.center, // Centra el texto horizontalmente                            
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                      ),                      
                        const SizedBox(height: 140),
                        
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          );
        },
      ),
      ),
    );
  }
}

class PerfilAppBar extends StatefulWidget {
  final String index;
  final Map<String, dynamic> alumnoData;
  const PerfilAppBar({super.key, required this.index, required this.alumnoData});

  @override
  State<PerfilAppBar> createState() => _PerfilAppBarState();
}

class _PerfilAppBarState extends State<PerfilAppBar> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      expandedHeight: size.height * 0.4, //
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: AppBarIcon(
          icon: Icons.chevron_left,
          iconSize: 30,
          onTap: () => Navigator.of(context).pop(),
        ),
      ),
      leadingWidth: 40,
      iconTheme: const IconThemeData(color: Colors.white),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            // Fondo de imagen con gradiente
            Positioned.fill(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    "assets/png/fondo_tiburon.png",
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // "PERFIL" en la parte superior derecha
            Positioned(
              top: 40, // Margen superior
              right: 20, // Margen derecho
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 226, 230, 234),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "PERFIL",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 4, 46, 130),
                    ),
                  ),
                ),
              ),
            ),
            // Bola de usuario centrada con nombre debajo
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 50, // Tamaño de la bolita
                    backgroundColor: const Color.fromARGB(255, 2, 55, 99), // Color de fondo de la bola
                    child: Icon(
                      Icons.account_circle, // Ícono de usuario
                      size: 80, // Tamaño del ícono
                      color: Colors.white, // Color del ícono
                    ),
                  ),
                  const SizedBox(height: 20.0), // Espaciado entre la bola y el nombre
                  SizedBox(
                    width: size.width * 0.9,
                    child: Text(
                      "${widget.alumnoData['nombre']} ${widget.alumnoData['primerApellido']} ${widget.alumnoData['segundoApellido']} ",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
      ),

      pinned: true,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: SizedBox(
          height: 30,
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(36.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
