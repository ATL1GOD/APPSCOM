import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';

class FullScreenCalendario extends StatelessWidget {
  final String imageUrl;

  const FullScreenCalendario({super.key, required this.imageUrl});

  Future<void> _downloadImage(BuildContext context) async {
    try {
      // Descargar la imagen como bytes
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        // Guardar la imagen en la galería
        final result = await ImageGallerySaver.saveImage(
          Uint8List.fromList(response.bodyBytes),
          quality: 100,
          name: "Visualizacion de Imagen",
        );

        if (result['isSuccess']) {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Imagen descargada con éxito')),
          );
        } else {
          throw Exception("No se pudo guardar la imagen");
        }
      } else {
        throw Exception("Error al descargar la imagen");
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al descargar la imagen: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendario 2025/1'),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () => _downloadImage(context),
          ),
        ],
      ),
      body: PhotoView(
        imageProvider: NetworkImage(imageUrl),
        backgroundDecoration: const BoxDecoration(
          color: Colors.black,
        ),
      ),
    );
  }
}
