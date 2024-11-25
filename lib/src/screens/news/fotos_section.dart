import 'package:flutter/material.dart';

class FotosSection extends StatelessWidget {
  const FotosSection({super.key});

  // Hacemos que la lista de fotos sea constante
  static const List<Map<String, String>> photos = [
    {
      'imageUrl': 'assets/png/fotografias/escuela1.png',
      'title': 'Foto 1',
      'author': 'Atl Cardoso',
    },
    {
      'imageUrl': 'assets/png/fotografias/escuela9.png',
      'title': 'Foto 2',
      'author': 'Kelly Guzman',
    },
    {
      'imageUrl': 'assets/png/fotografias/escuela10.png',
      'title': 'Foto 3',
      'author': 'Jorge Hernandez',
    },
    {
      'imageUrl': 'assets/png/fotografias/escuela11.png',
      'title': 'Foto 4',
      'author': 'Yosafat Osorio',
    },
    {
      'imageUrl': 'assets/png/fotografias/escuela18.png',
      'title': 'Foto 5',
      'author': 'Marian Mares',
    },
    {
      'imageUrl': 'assets/png/fotografias/escuela13.png',
      'title': 'Foto 6',
      'author': 'Daniel Vazquez',
    },
    {
      'imageUrl': 'assets/png/fotografias/escuela12.png',
      'title': 'Foto 7',
      'author': 'Maximiliano Guzman',
    },
    {
      'imageUrl': 'assets/png/fotografias/escuela15.png',
      'title': 'Foto 8',
      'author': 'Camerina Santiago',
    },
    {
      'imageUrl': 'assets/png/fotografias/escuela16.png',
      'title': 'Foto 9',
      'author': 'Luisa Luna',
    },
    {
      'imageUrl': 'assets/png/fotografias/escuela17.png',
      'title': 'Foto 10',
      'author': 'Ana Noriega',
    },
    // Puedes agregar más fotos aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(3.0, 0.0, 3.0, 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Galería de Fotos',  // Título de la sección
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'En esta seccion se muestra una galeria de algunas fotos realizadas por alumnos de la Escuela Superior de Computo.',  // Título de la sección
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          // GridView para mostrar las fotos
          GridView.builder(
            shrinkWrap: true,  // Hace que el grid se ajuste al tamaño del contenido
            physics: const NeverScrollableScrollPhysics(),  // Desactiva el scroll en el GridView
            padding: const  EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 2.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,  // Número de columnas
              crossAxisSpacing: 8.0,  // Espacio entre columnas
              mainAxisSpacing: 8.0,  // Espacio entre filas
            ),
            itemCount: photos.length,
            itemBuilder: (context, index) {
              final photo = photos[index];
              return GestureDetector(
                onTap: () {
                   _openFullScreenImage(context, photo['imageUrl']!);// Acción al hacer tap en una foto
                },
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      // Imagen
                      Expanded(
                        child: Image.asset(
                          photo['imageUrl']!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      // Pie de foto
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              photo['title']!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Por ${photo['author']}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }


   void _openFullScreenImage(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Center(
            child: Image.network(imageUrl),  // Mostrar la imagen en pantalla completa
          ),
        );
      },
    );
  }

}