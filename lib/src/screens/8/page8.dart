import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Page8 extends StatelessWidget {
  const Page8({super.key});

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
                        "Historia & Escudo",
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
                        "Conoce más sobre la historia de la escuela y su escudo",
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
                    "Historia",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      height: 1.33,
                    ),
                  ),
                  Text(
                    "Después de varios intentos que se hicieron al respecto, en 1993 un grupo de trabajo integrado por la Secretaría Académica del Instituto, elaboró un proyecto en el que se propuso la creación de la Escuela Superior de Cómputo, bajo la sigla (ESCOM) y al interior de ella la carrera de Ingeniero en Sistemas Computacionales. Dicho documento fue presentado, en apego a la normatividad vigente, a la comisión de Planes y Programas del Consejo Nacional Consultivo del IPN, el cual fue aprobado por la misma Comisión en la sesión del 5 de agosto de 1993. Contando con la autorización, el documento fue remitido al pleno del H. Consejo General Consultivo del IPN, en donde, fue aprobado en la Sesión Ordinaria del 13 de agosto de 1993 surgiendo así la Escuela Superior de Cómputo.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 12.sp,
                      height: 1.83,
                    ),
                  ),
                  SizedBox(height: 18.h), // Espaciado adicional
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 12.sp,
                        height: 1.83,
                        color: Colors.black, // color de texto por defecto
                      ),
                      children: [
                        TextSpan(
                          text: "Dicho documento fue presentado, en apego a la normatividad vigente, a la comisión de Planes y Programas del Consejo Nacional Consultivo del IPN, el cual fue aprobado por la misma Comisión en la sesión del 5 de agosto de 1993.",
                        ),
                        TextSpan(
                          text: " Contando con la autorización, el documento fue remitido al pleno del H. Consejo General Consultivo del IPN, en donde, fue aprobado en la Sesión Ordinaria del 13 de agosto de 1993 surgiendo así la Escuela Superior de Cómputo.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold, // Aplicamos negrita al segundo texto
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                children: [
                  Text(
                    "Escudo",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      height: 1.33,
                    ),
                  ),
                  SizedBox(height: 18.h), // Espaciado adicional
                  Image.asset(
                    'assets/png/escudo.png',
                    height: 200.h,
                    width: 200.w,
                  ),
                  SizedBox(height: 30.h), // Espaciado adicional
                  Text(
                    "El escudo de la Escuela Superior de Cómputo fue diseñado por el Mtro. José Luis González Vargas, quien es profesor de la institución. El escudo está compuesto por un círculo que representa la unidad y la perfección, en cuyo interior se encuentra un triángulo equilátero que simboliza la trinidad de la educación, la investigación y la difusión del conocimiento. En la parte superior del triángulo se encuentra una computadora, que es el instrumento de trabajo de los ingenieros en sistemas computacionales. En la parte inferior del triángulo se encuentra un libro abierto, que simboliza la educación y el conocimiento. En la parte inferior del círculo se encuentra el nombre de la institución y en la parte superior el lema de la misma.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 12.sp,
                      height: 1.83,
                    ),
                  ),
                  SizedBox(height: 30.h), // Espaciado adicional
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
