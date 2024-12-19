import 'package:appscom/src/screens/home/imagen_completa.dart';
import 'package:flutter/material.dart';
import 'package:appscom/src/screens/home/pdf_completo.dart'; 

class CalendarioSection extends StatelessWidget {
  const CalendarioSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Conoce los calendarios académicos para el ciclo escolar 2024 - 2025 en sus diversas modalidades:',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 16.0),

        // Primer Calendario Escolarizado
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ImagenCompleta(
                  imagenAssets: 'assets/png/calendarios/calendario_escolarizado.png',
                ),
              ),
            );
          },
          child: ClipRRect( // ClipRRect lo usamos para que pueda recortar los bordes de un widget hijo
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/png/calendarios/calendario_escolarizado.png',
              fit: BoxFit.cover,
              height: 500.0,
              width: double.infinity,
            ),
          ),
        ),
        const SizedBox(height: 20.0),

        // Abrir PDF Escolarizado
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PDFScreen(
                  pdfAsset: 'assets/pdf/calendario_escolarizado.pdf',
                ),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 77, 155, 219), // Color de inicio
                  Color.fromARGB(255, 8, 51, 145),  // Color de fin
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.picture_as_pdf, color: Colors.white),
                SizedBox(width: 8.0),
                Text(
                  'Abrir PDF',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30.0),

        // Segundo Calendario No Escolarizado
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ImagenCompleta(
                  imagenAssets: 'assets/png/calendarios/calendario_noescolarizado.png',
                ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/png/calendarios/calendario_noescolarizado.png',
              fit: BoxFit.cover,
              height: 500.0,
              width: double.infinity,
            ),
          ),
        ),
        const SizedBox(height: 20.0),

        // Abrir PDF No Escolarizado
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PDFScreen(
                  pdfAsset: 'assets/pdf/calendario_noescolarizado.pdf',
                ),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 77, 155, 219), // Color de inicio
                  Color.fromARGB(255, 8, 51, 145),  // Color de fin
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.picture_as_pdf, color: Colors.white),
                SizedBox(width: 8.0),
                Text(
                  'Abrir PDF',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
