import 'package:flutter/material.dart';
import 'pantalla_pdf.dart'; // Asegúrate de importar el archivo PDFViewerPage
import 'calendario_imagen.dart'; // Importa la pantalla de imagen completa


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
                builder: (context) => FullScreenCalendario(
                  imageUrl: 'assets/png/calendarios/calendario_escolarizado.png',
                ),
              ),
            );
          },
          child: ClipRRect(
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
                builder: (context) => PDFViewerPage(
                  pdfUrl: 'assets/pdf/calendario-escolarizado.pdf',
                ),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
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
                builder: (context) => FullScreenCalendario(
                  imageUrl: 'assets/png/calendarios/calendario_noescolarizado.png',
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
                builder: (context) => PDFViewerPage(
                  pdfUrl: 'assets/pdf/calendario-noescolarizado.pdf',
                ),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
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
