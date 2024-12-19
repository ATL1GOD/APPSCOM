import 'package:appscom/src/screens/global_menu/menu_global.dart';
import 'package:flutter/material.dart';

class HistoriaScreen extends StatefulWidget {
  static const String routeName = '/historia';
  const HistoriaScreen({super.key});

  @override
  HistoriaScreenState createState() => HistoriaScreenState();
}

class HistoriaScreenState extends State<HistoriaScreen> {
  @override
  Widget build(BuildContext context) {
    return MenuGlobal(
      selectedIndex: 2,
      child: Scaffold(
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
          toolbarHeight: 90, //
          centerTitle: true,
          title: Center(
            child: Text(
                'Historia & Escudo',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle(context, "Historia"),
                    const SizedBox(height: 25.0),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Después de varios intentos que se hicieron al respecto, en 1993 un grupo de trabajo integrado por la Secretaría Académica del Instituto, elaboró un proyecto en el que se propuso la creación de la Escuela Superior de Cómputo, bajo la sigla (ESCOM) y al interior de ella la carrera de Ingeniero en Sistemas Computacionales.\n\n Dicho documento fue presentado, en apego a la normatividad vigente, a la comisión de Planes y Programas del Consejo Nacional Consultivo del IPN, el cual fue aprobado por la misma Comisión en la sesión del 5 de agosto de 1993.",
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontSize: 16.0,
                                  fontFamily: 'ExtraLight',
                                ),
                          ),
                          TextSpan(
                            text: "Contando con la autorización, el documento fue remitido al pleno del H. Consejo General Consultivo del IPN, en donde, fue aprobado en la Sesión Ordinaria del 13 de agosto de 1993 surgiendo así la Escuela Superior de Cómputo.",
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontSize: 16.0,
                                  fontFamily: 'ExtraLight',
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 25.0),
                    _buildSectionTitle(context, "Escudo"),
                    const SizedBox(height: 25.0),
                    Text(
                      "En el año de 1994, la dirección del plantel estableció un conjunto de lineamientos que debía cumplir este distintivo y demás identificadores que le sirvieran como imagen oficial. Estos lineamientos fueron:",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 16.0,
                            fontFamily: 'ExtraLight',
                          ),
                      textAlign: TextAlign.justify,
                    ),

                    const SizedBox(height: 25.0),
                     Text(
                      "✦Trazos claros y sencillos\n✦Dar sensación de movimiento\n✦No contener elementos tecnológicos\n✦Tener posibilidad de larga vigencia\n✦Retratar bien en color o en blanco y negro",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 16.0,
                            fontFamily: 'ExtraLight',
                          ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 25.0),

                    GestureDetector(
                      onTap: () {
                        // Ampliar imagen
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: InteractiveViewer(
                              child: Image.asset("assets/png/escudo.png"),
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0), 
                        child: Image.asset(
                          'assets/png/escudo.png',
                          width: 300,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 25.0),

                    Text(
                      "Dos estudiantes de la licenciatura en diseño gráfico de la UAM-Azcapotzalco, apegados a los lineamientos generaron logotipos e imágenes, resultando ganador el presentado por la C. Guadalupe Gómez Sánchez, durante el simposium Tecno-Industria ESCOM-95. Enmarzo de 2011 se incluyó la leyenda Instituto Politécnico Nacional.",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 16.0,
                            fontFamily: 'ExtraLight',
                          ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 25.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }




  Widget _buildSectionTitle(BuildContext context, String title) {
    return Container(
      width: double.infinity, // Ocupa todo el ancho disponible
      padding: const EdgeInsets.symmetric(vertical: 12.0), // Espaciado interno
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 55, 134, 199), // Fondo azul
        borderRadius: BorderRadius.circular(16.0), // Esquinas redondeadas
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // Sombra para simular el bisel
            offset: const Offset(4, 4), // Dirección de la sombra
            blurRadius: 6, // Difuminado
            spreadRadius: 1, // Extensión de la sombra
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.7), // Luz superior para bisel
            offset: const Offset(-4, -4), // Dirección opuesta
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Text(
        title,
        textAlign: TextAlign.center, // Centra el texto horizontalmente
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white, // Color del texto
              fontWeight: FontWeight.bold, // Negrita
            ),
      ),
    );
  }
}





















/*import 'package:appscom/src/screens/global_menu/custom_drawer.dart';
import 'package:flutter/material.dart';

class HistoriaScreen extends StatefulWidget {
  static const String routeName = '/historia';
  const HistoriaScreen({super.key});

  @override
  HistoriaScreenState createState() => HistoriaScreenState();
}

class HistoriaScreenState extends State<HistoriaScreen> {
  @override
  Widget build(BuildContext context) {
    return MenuGlobal(
      selectedIndex: 2,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 250, // Altura expandida
              automaticallyImplyLeading: false,
              pinned: true, // Fija el AppBar cuando se desplaza
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  'Historia & Escudo',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                centerTitle: true, // Centra el título
                background: Stack(
                  fit: StackFit.expand, // La imagen ocupa todo el espacio
                  children: [
                    Image.asset(
                      'assets/png/fotografias/escuela1.png', // Cambia por tu imagen
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
                stretchModes: const [
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                ],
              ),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(30), // Altura adicional
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 61, 151, 253), // Azul principal
                        Color.fromARGB(255, 17, 50, 100), // Azul brillante
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(36.0),
                    ),
                  ),
                  child: SizedBox(height: 30), // Tamaño del contenedor blanco
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle(context, "Historia"),
                    const SizedBox(height: 25.0),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Después de varios intentos que se hicieron al respecto, en 1993 un grupo de trabajo integrado por la Secretaría Académica del Instituto, elaboró un proyecto en el que se propuso la creación de la Escuela Superior de Cómputo, bajo la sigla (ESCOM) y al interior de ella la carrera de Ingeniero en Sistemas Computacionales.\n\n Dicho documento fue presentado, en apego a la normatividad vigente, a la comisión de Planes y Programas del Consejo Nacional Consultivo del IPN, el cual fue aprobado por la misma Comisión en la sesión del 5 de agosto de 1993.",
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontSize: 16.0,
                                  fontFamily: 'ExtraLight',
                                ),
                          ),
                          TextSpan(
                            text: "Contando con la autorización, el documento fue remitido al pleno del H. Consejo General Consultivo del IPN, en donde, fue aprobado en la Sesión Ordinaria del 13 de agosto de 1993 surgiendo así la Escuela Superior de Cómputo.",
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontSize: 16.0,
                                  fontFamily: 'ExtraLight',
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 25.0),
                    _buildSectionTitle(context, "Escudo"),
                    const SizedBox(height: 25.0),
                    Text(
                      "En el año de 1994, la dirección del plantel estableció un conjunto de lineamientos que debía cumplir este distintivo y demás identificadores que le sirvieran como imagen oficial. Estos lineamientos fueron:",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 16.0,
                            fontFamily: 'ExtraLight',
                          ),
                      textAlign: TextAlign.justify,
                    ),

                    const SizedBox(height: 25.0),
                     Text(
                      "✦Trazos claros y sencillos\n✦Dar sensación de movimiento\n✦No contener elementos tecnológicos\n✦Tener posibilidad de larga vigencia\n✦Retratar bien en color o en blanco y negro",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 16.0,
                            fontFamily: 'ExtraLight',
                          ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 25.0),

                    
                    
                    const SizedBox(height: 25.0),

                    Text(
                      "Dos estudiantes de la licenciatura en diseño gráfico de la UAM-Azcapotzalco, apegados a los lineamientos generaron logotipos e imágenes, resultando ganador el presentado por la C. Guadalupe Gómez Sánchez, durante el simposium Tecno-Industria ESCOM-95. Enmarzo de 2011 se incluyó la leyenda Instituto Politécnico Nacional.",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 16.0,
                            fontFamily: 'ExtraLight',
                          ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 25.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }




  Widget _buildSectionTitle(BuildContext context, String title) {
    return Container(
      width: double.infinity, // Ocupa todo el ancho disponible
      padding: const EdgeInsets.symmetric(vertical: 12.0), // Espaciado interno
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 55, 134, 199), // Fondo azul
        borderRadius: BorderRadius.circular(16.0), // Esquinas redondeadas
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // Sombra para simular el bisel
            offset: const Offset(4, 4), // Dirección de la sombra
            blurRadius: 6, // Difuminado
            spreadRadius: 1, // Extensión de la sombra
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.7), // Luz superior para bisel
            offset: const Offset(-4, -4), // Dirección opuesta
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Text(
        title,
        textAlign: TextAlign.center, // Centra el texto horizontalmente
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white, // Color del texto
              fontWeight: FontWeight.bold, // Negrita
            ),
      ),
    );
  }
}
*/