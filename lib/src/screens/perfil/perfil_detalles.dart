import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'fadeanimation.dart';
import 'package:appscom/src/screens/bottons/carreras/carrera_icon.dart';
import 'package:appscom/src/screens/custom_drawer.dart';

class PerfilUsuario extends StatelessWidget {
  final String nombre;
  //final int index;
  static const String routename = 'PerfilUsuario';

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
                        FadeAnimation( // Animación de entrada de los elementos de la pantalla
                          1.2,
                          Container(
                         width: double.infinity,// Ocupa todo el ancho disponible
                         padding: const EdgeInsets.symmetric(vertical: 12.0), // Espaciado interno
                         decoration: BoxDecoration(
                         color: const Color.fromARGB(255, 200, 240, 255), // Fondo azul
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
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                      ),
                        ),
                        const SizedBox(height: 20),
                        FadeAnimation(
                          1.2,
                          Container(
                         width: double.infinity, // Ocupa todo el ancho disponible
                         padding: const EdgeInsets.symmetric(vertical: 12.0), // Espaciado interno
                         decoration: BoxDecoration(
                         color: const Color.fromARGB(255, 24, 41, 98), // Fondo azul
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
                        ),
                        const SizedBox(height: 20),
                        FadeAnimation(
                          1.3,
                      Container(
                      width: double.infinity, // Ocupa todo el ancho disponible
                      padding: const EdgeInsets.symmetric(vertical: 12.0), // Espaciado interno
                      decoration: BoxDecoration(
                         color: const Color.fromARGB(255, 24, 41, 98), // Fondo azul
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
                        ),
                        const SizedBox(height: 20),
                        FadeAnimation(
                          1.3,
                          Container(
                      width: double.infinity, // Ocupa todo el ancho disponible
                      padding: const EdgeInsets.symmetric(vertical: 12.0), // Espaciado interno
                      decoration: BoxDecoration(
                         color: const Color.fromARGB(255, 24, 41, 98), // Fondo azul
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
                        ),
                        const SizedBox(height: 20),
                        
                        const SizedBox(height: 20),
                        /*FadeAnimation(
                          1.5,
                          Text(
                            'Información adicional sobre el alumno...',
                            style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), height: 18),
                          ),
                        ),*/
                        const SizedBox(height: 120),
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




/*import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PerfilUsuario extends StatelessWidget {
  final String nombre;
  static const String routename = 'PerfilUsuario';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de $nombre'),
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: _fetchAlumnoData(nombre),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('No se encontraron datos'));
          }

          final alumnoData = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Boleta: ${alumnoData['boleta']}', style: const TextStyle(fontSize: 18)),
                Text('Carrera: ${alumnoData['carrera']}', style: const TextStyle(fontSize: 18)),
                Text('CURP: ${alumnoData['curp']}', style: const TextStyle(fontSize: 18)),
                Text('Nombre: ${alumnoData['nombre']} ${alumnoData['primerApellido']} ${alumnoData['segundoApellido']}',
                    style: const TextStyle(fontSize: 18)),
              ],
            ),
          );
        },
      ),
    );
  }
}
*/

















/*import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'fadeanimation.dart';

class PerfilUsuario extends StatelessWidget {
  final String nombre;
  static const String routename = 'PerfilUsuario';

const PerfilUsuario({super.key, required this.nombre});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 450,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(''),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                            Colors.black,
                            Colors.black.withOpacity(.3),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FadeAnimation(
                              1,
                              Text(
                                "Emma Watson",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: <Widget>[
                                FadeAnimation(
                                  1.2,
                                  Text(
                                    "60 Videos",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                ),
                                const SizedBox(width: 50),
                                FadeAnimation(
                                  1.3,
                                  Text(
                                    "240K Subscribers",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeAnimation(
                          1.6,
                          Text(
                            "Emma Charlotte Duerre Watson was born in Paris, France, to English parents, Jacqueline Luesby and Chris Watson, both lawyers. She moved to Oxfordshire when she was five, where she attended the Dragon School.",
                            style: TextStyle(color: Colors.grey, height: 1.4),
                          ),
                        ),
                        const SizedBox(height: 40),
                        FadeAnimation(
                          1.6,
                          Text(
                            "Born",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 10),
                        FadeAnimation(
                          1.6,
                          Text(
                            "April, 15th 1990, Paris, France",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 20),
                        FadeAnimation(
                          1.6,
                          Text(
                            "Nationality",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 10),
                        FadeAnimation(
                          1.6,
                          Text(
                            "British",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 20),
                        FadeAnimation(
                          1.6,
                          Text(
                            "Videos",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 20),
                        FadeAnimation(
                          1.8,
                          Container(
                            height: 200,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                makeVideo(image: ''),
                                makeVideo(image: ''),
                                makeVideo(image: ''),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 120),
                      ],
                    ),
                  )
                ]),
              )
            ],
          ),
          Positioned.fill(
            bottom: 50,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FadeAnimation(
                2,
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.yellow[700],
                  ),
                  child: const Align(
                    child: Text(
                      "Follow",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget makeVideo({required String image}) {
    return AspectRatio(
      aspectRatio: 1.5 / 1,
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.3),
              ],
            ),
          ),
          child: const Align(
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 70,
            ),
          ),
        ),
      ),
    );
  }
}
*/












