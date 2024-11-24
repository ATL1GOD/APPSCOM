import 'package:flutter/material.dart';
import 'pantalla_pdf.dart'; // Asegúrate de importar el archivo PDFViewerPage
import 'calendario_imagen.dart'; // Importa la pantalla de imagen completa


class DonativoSection extends StatelessWidget {
  const DonativoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'El Comité de Procuración de Fondos (CPF) de la ESCOM los invita a ser parte de una cultura filantrópica en nuestra casa de estudios, para alentar, propiciar, apoyar y atender los distintos programas académicos, científicos, tecnológicos y de investigación en todos los niveles.',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 16.0),

        // Primer Calendario Escolarizado
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FullScreenCalendario(
                  imageUrl: 'assets/png/donativo/donativo.png',
                ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/png/donativo/donativo.png',
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
                  pdfUrl: 'assets/pdf/donativo.pdf',
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
      ],
    );
  }
  }

