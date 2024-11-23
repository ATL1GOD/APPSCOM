import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 80.h,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Abre el Drawer cuando se presiona el menú
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Escudo de la escuela, ajusta el nombre de la imagen según tu archivo
            Image.asset(
              'assets/png/gob.png',
              height: 200.h,
              width: 200.w,
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 252, 253, 255),
        elevation: 0, // Elimina la sombra para un encabezado más limpio
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú de Navegación',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                ),
              ),
            ),
            ListTile(
              title: Text('Página 1'),
              onTap: () {
                // Acción al seleccionar la página 1
              },
            ),
            ListTile(
              title: Text('Página 2'),
              onTap: () {
                // Acción al seleccionar la página 2
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Fondo gris claro en la parte superior
            SizedBox(
              height: 296.h,
              width: double.infinity,
              child: const ColoredBox(
                color: Color(0xffC4C4C4),
              ),
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.w),
              child: Container(
                color: const Color.fromARGB(255, 113, 188, 231), // Fondo gris claro
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Ingeniería en Sistemas Computacionales (2020)",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24.sp,
                          height: 1.33,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Oferta Educativa",
                        style: TextStyle(
                          fontSize: 12.sp,
                          height: 1.83,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                children: [
                  SizedBox(height: 60.h),
                  Text(
                    "Objetivo",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      height: 1.33,
                    ),
                  ),
                  Text(
                    "Formar ingenieros en sistemas computacionales de sólida preparación científica y tecnológica en los ámbitos del desarrollo de software y hardware, que propongan, analicen, diseñen, desarrollen, implementen y gestionen sistemas computacionales a partir de tecnologías de vanguardia y metodologías, normas y estándares nacionales e internacionales de calidad; líderes de equipos de trabajo multidisciplinarios y multiculturales, con un alto sentido ético y de responsabilidad.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 12.sp,
                      height: 1.83,
                    ),
                  ),
                  SizedBox(height: 18.h), // Espaciado adicional
                  Text(
                    "Perfil de Ingreso",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      height: 1.33,
                    ),
                  ),
                  Text(
                    "Los aspirantes a estudiar este programa deberán tener conocimientos en matemáticas, física e informática. Es también conveniente que posean conocimientos de inglés. Asimismo, deberán contar con habilidades como análisis y síntesis de información, razonamiento lógico y expresión oral y escrita. Así como actitudes de respeto y responsabilidad.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 12.sp,
                      height: 1.83,
                    ),
                  ),
                  SizedBox(height: 18.h), // Espaciado adicional
                  Text(
                    "Perfil de Egreso",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      height: 1.33,
                    ),
                  ),
                  Text(
                    "El egresado del programa académico de Ingeniería en Sistemas Computacionales podrá desempeñarse en equipos multidisciplinarios e interdisciplinarios en los ámbitos del desarrollo de software y hardware, sustentando su actuación profesional en valores éticos y de responsabilidad social, con un enfoque de liderazgo y sostenibilidad en los sectores público y privado.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 12.sp,
                      height: 1.83,
                    ),
                  ),
                  SizedBox(height: 18.h), // Espaciado adicional
                  Text(
                    "Atributos del Egresado",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      height: 1.33,
                    ),
                  ),
                  Text(
                    "• Modelar problemas en sistemas computacionales a partir de conocimientos de ciencias básicas e ingeniería.\n• Resolver problemas en sistemas computacionales, con base en la metodología de desarrollo, análisis de resultados y toma de decisiones.\n• Desarrollar sistemas computacionales de acuerdo a procesos de diseño, estándares de calidad y optimización de procesos.\n• Integrar habilidades de liderazgo, comunicación efectiva y trabajo colaborativo para la planificación de tareas, cumplimiento de metas y análisis de riesgos.\n• Asumir una actitud ética y crítica en su desempeño académico que considere su impacto económico, social y ambiental y que reconozca sus necesidades de actualización permanente.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 12.sp,
                      height: 1.83,
                    ),
                  ),
                  SizedBox(height: 18.h), // Espaciado adicional
                  Text(
                    "Campo Laboral",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      height: 1.33,
                    ),
                  ),
                  Text(
                    "El campo profesional en el que se desarrollan los egresados de este Programa Académico es muy amplio, se localiza en los sectores público y privado; en consultorías, en empresas del sector financiero, comercial, de servicios o bien en aquellas dedicadas a la innovación, en entidades federales, estatales, así como pequeño empresario creando empresas emergentes (startups).",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 12.sp,
                      height: 1.83,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}