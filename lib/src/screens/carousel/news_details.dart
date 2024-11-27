import  'package:flutter/material.dart';
import 'package:appscom/src/screens/carousel/news_item.dart';

import 'calendario/calendario_section.dart';
import 'becas/becas_section.dart';
import 'social/redes_section.dart';
import 'fotografias/fotos_section.dart';
class NewsDetailsBody extends StatelessWidget {
  final NewsItem newsItem;

  const NewsDetailsBody({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 80.0),
      child: SingleChildScrollView( // Se asegura de que todo sea desplazable
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

            // Renderiza contenido específico según la categoría o ID
            if (newsItem.category == 'Semestre 2025/1' &&
                newsItem.title.contains('Calendario')) ...[
              const CalendarioSection(),

            ] else if (newsItem.category == 'Becas' &&
                newsItem.title.contains('Becas Escolares')) ...[
              const BecasSection(),

            ] else if (newsItem.category == 'Redes Sociales' &&
                newsItem.title.contains('Visita nuestras redes sociales')) ...[
              const RedesSection(),

            ] else if (newsItem.category == 'Fotografias' &&
                newsItem.title.contains('Fotografias de las instalaciones')) ...[
              const FotosSection(),

            ] else ...[

              Text(
                'No se encontró contenido para esta noticia',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ],
        ),
      ),
    );
}
}
