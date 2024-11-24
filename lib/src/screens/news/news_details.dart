import  'package:flutter/material.dart';
import 'package:appscom/src/screens/news/news_item.dart';

import 'calendario_section.dart';
import 'donativo_section.dart';


class NewsDetailsBody extends StatelessWidget {
  final NewsItem newsItem;

  const NewsDetailsBody({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0,0.0,30.0,80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(newsItem.imgPath),
              ),
              const SizedBox(width: 8.0),
              Text(
                newsItem.author,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          //Renderiza contenido específico según la categoría o ID
          if (newsItem.category == 'Semestre 2025/1' && newsItem.title.contains('Calendario')) ...[
          const CalendarioSection(),
          
          
          /*Text(
            'Conoce los calendarios académicos para el ciclo escolar 2024 - 2025 en sus diversas modalidades:',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16.0),
          
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullScreenCalendario(
                    imageUrl: 'assets/png/calendarios/calendario_escolarizado.png', // 
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                'assets/png/calendarios/calendario_escolarizado.png', // 
                fit: BoxFit.cover,
                height: 500.0,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 20.0),

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PDFViewerPage(
                    pdfUrl: 'assets/pdf/calendario-escolarizado.pdf', // Ruta del PDF
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

           GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullScreenCalendario(
                    imageUrl: 'assets/png/calendarios/calendario_noescolarizado.png', // 
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                'assets/png/calendarios/calendario_noescolarizado.png', // 
                fit: BoxFit.cover,
                height: 500.0,
                width: double.infinity,
              ),
            ),
          ),

          const SizedBox(height: 20.0),

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PDFViewerPage(
                    pdfUrl: 'assets/pdf/calendario-escolarizado.pdf', // Ruta del PDF
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
          )*/
           ] else if (newsItem.category == 'Apoyo' && newsItem.title.contains('Donativos')) ...[
            // Aquí puedes agregar un widget o lógica diferente para este caso
            const DonativoSection(),
          ] 
           else ...[
            Text(
              'No se encontró contenido para esta noticia',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
        ],
        ],
      )
    );
}
}






/*
import 'package:flutter/material.dart';
import 'calendario1.dart'; // Importa la pantalla de imagen completa
import 'pantalla_pdf.dart'; // Importa la pantalla del visor de PDF
import 'news_item.dart'; // Importa el modelo NewsItem

class NewsDetailsBody extends StatelessWidget {
  final NewsItem newsItem;

  const NewsDetailsBody({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(newsItem.imgPath),
              ),
              const SizedBox(width: 8.0),
              Text(
                newsItem.author,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Text(
            'Conoce los calendarios académicos para el ciclo escolar 2024 - 2025 en sus diversas modalidades:',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16.0),
          // Calendario Escolarizado
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
                'assets/png/calendarios/calendario_escolarizado.png', // Imagen local
                fit: BoxFit.cover,
                height: 500.0,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          // Botón para abrir PDF del calendario escolarizado
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
                    'Abrir PDF Escolarizado',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          // Calendario No Escolarizado
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullScreenCalendario(
                    imageUrl:
                        'assets/png/calendarios/calendario_noescolarizado.png',
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/png/calendarios/calendario_noescolarizado.png', // Imagen local
                fit: BoxFit.cover,
                height: 500.0,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          // Botón para abrir PDF del calendario no escolarizado
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PDFViewerPage(
                    pdfUrl: 'assets/pdf/calendario-no-escolarizado.pdf',
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
                    'Abrir PDF No Escolarizado',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/