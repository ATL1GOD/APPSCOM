import 'package:appscom/src/screens/global_menu/menu_global.dart';
import 'package:flutter/material.dart';
import 'equipo_item.dart';
import 'package:url_launcher/url_launcher.dart';

class EquipoScreen extends StatefulWidget {
  static const String routeName = '/equipoDesarrollo';
  const EquipoScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EquipoScreenState createState() => _EquipoScreenState();
}

class _EquipoScreenState extends State<EquipoScreen> {
  @override
  Widget build(BuildContext context) {
    return MenuGlobal(
          selectedIndex: 5, // Add the required selectedIndex argument
          child:Scaffold(
          appBar: AppBar(
          automaticallyImplyLeading: false,
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
          toolbarHeight: 60, //
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Creditos',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 3),
            ],
          ),
        ),
      body: ListView.builder(
        itemCount: integrante.length,
        itemBuilder: (context, index) {
          final miembro = integrante[index];
          return Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 50.0, bottom: 10.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    // Ampliar imagen
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: InteractiveViewer(
                          child: Image.asset(miembro.fotoAssets),
                        ),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 160,
                    backgroundImage: AssetImage(miembro.fotoAssets),
                  ),
                ),
                SizedBox(height: 10),
                Text(miembro.nombre, style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                
                Text(miembro.profesion, style: TextStyle(fontSize: 20)),

                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: miembro.redesSociales.entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () {
                          // Abrir enlace
                          launchUrl(Uri.parse(entry.value));
                        },
                        child: Column(
                          children: [
                            Icon(Icons.link, size: 20),
                            SizedBox(height: 4),
                            Text(
                              entry.key,
                              style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 0, 38, 109)),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          );
        },
      ),
    ),
    );
  }
}

void launchUrlFunction(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'No se pudo abrir el enlace: $url';
  }
}