import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'fadeanimation.dart';

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
      backgroundColor: Colors.black,
      body: FutureBuilder<Map<String, dynamic>?>(
        future: _fetchAlumnoData(nombre),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}', style: const TextStyle(color: Colors.white)));
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('No se encontraron datos', style: TextStyle(color: Colors.white)));
          }

          final alumnoData = snapshot.data!;
          return Stack(
            children: <Widget>[
              CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    expandedHeight: 450,
                    backgroundColor: Colors.black,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      background: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/user_background.jpg'), // Cambiar por una imagen válida
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
                                    '${alumnoData['nombre']} ${alumnoData['primerApellido']} ${alumnoData['segundoApellido']}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: <Widget>[
                                    FadeAnimation(
                                      1.2,
                                      Text(
                                        'Boleta: ${alumnoData['boleta']}',
                                        style: const TextStyle(color: Colors.grey, fontSize: 16),
                                      ),
                                    ),
                                    const SizedBox(width: 50),
                                    FadeAnimation(
                                      1.3,
                                      Text(
                                        'Carrera: ${alumnoData['carrera']}',
                                        style: const TextStyle(color: Colors.grey, fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
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
                                'CURP: ${alumnoData['curp']}',
                                style: const TextStyle(color: Colors.grey, height: 1.4, fontSize: 18),
                              ),
                            ),
                            const SizedBox(height: 20),
                            FadeAnimation(
                              1.6,
                              Text(
                                'Información adicional sobre el alumno...',
                                style: const TextStyle(color: Colors.grey, height: 1.4),
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
                          'Seguir',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
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












