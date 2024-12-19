import 'package:appscom/src/screens/login/bienvenida_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appscom/src/screens/bottons/carreras/carrera_icon.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:appscom/src/screens/perfil/perfil_detalles.dart';
import 'package:appscom/src/screens/profesores/profesores_lista.dart'; 

class MenuAcceso extends StatelessWidget {
  final String nombre;
  static const String routename = '/menu_acceso';

  const MenuAcceso({super.key, required this.nombre});

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
    return Scaffold(
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
              AccesoAppBar(index: nombre, alumnoData: alumnoData), // Se incluye el encabezado dinámico
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 30),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PerfilUsuario(nombre: alumnoData['nombre']),
                              ),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            decoration: BoxDecoration(
                              color: const Color(0xFF005B8D),
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  offset: const Offset(4, 4),
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                ),
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.7),
                                  offset: const Offset(-4, -4),
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: const Text(
                              "Mi Perfil",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ContactListPage(),
                              ),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            decoration: BoxDecoration(
                              color: const Color(0xFF007BB5),
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  offset: const Offset(4, 4),
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                ),
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.7),
                                  offset: const Offset(-4, -4),
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: const Text(
                              "Profesores",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 100),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WelcomeScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0), // Tamaño reducido
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 240, 131, 106), // Color de inicio
                                  Color.fromARGB(255, 255, 49, 0),  // Color de fin
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(20.0), // Esquinas redondeadas
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2), // Sombra suave
                                  offset: const Offset(4, 4),
                                  blurRadius: 8,
                                ),
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.2), // Resplandor suave
                                  offset: const Offset(-4, -4),
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min, // Ajusta el tamaño del botón al contenido
                              children: const [
                                Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "Cerrar Sesión",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16, // Fuente más pequeña
                                    letterSpacing: 1.1, // Espaciado ligero
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          );
        },
      ),
    );
  }
}














class AccesoAppBar extends StatefulWidget {
  final String index;
  final Map<String, dynamic> alumnoData;
  const AccesoAppBar({super.key, required this.index, required this.alumnoData});

  @override
  State<AccesoAppBar> createState() => _AccesoAppBarState();
}

class _AccesoAppBarState extends State<AccesoAppBar> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      expandedHeight: size.height * 0.4, //
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: AppBarIcon(
          icon: Icons.arrow_back_ios_new,
          iconSize: 30,
          onTap: () => Navigator.of(context).pop(),
        ),
      ),
      leadingWidth: 50,
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
                    "assets/png/fondo_oceano.png",
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
            // Bola de usuario centrada con nombre debajo
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 80, // Aumentar el tamaño del círculo
                    backgroundColor: const Color.fromARGB(255, 253, 253, 253),
                    child: SvgPicture.asset(
                      "assets/svg/logos/escom.svg",
                      width: 100, // Tamaño del SVG
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 20.0), // Espaciado entre la bola y el nombre
                  SizedBox(
                    width: size.width * 0.9,
                    child: Text(
                      "¡Hola!, ${widget.alumnoData['nombre']} ",
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
