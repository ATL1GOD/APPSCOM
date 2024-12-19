import 'package:flutter/material.dart';

class ImagenCompleta extends StatefulWidget {
  final String imagenAssets;

  const ImagenCompleta({super.key, required this.imagenAssets});

  @override
  State<ImagenCompleta> createState() => _ImagenCompletaState();
}

class _ImagenCompletaState extends State<ImagenCompleta> {
  final double _scale = 1.0; // Escala inicial
  final double _maxScale = 5.0; // Escala máxima
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          toolbarHeight: 60, //
          leading: Padding(
                  padding: const EdgeInsets.only(left: 10), // Margen izquierdo
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Acción al presionar
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2), // Fondo translúcido
                        shape: BoxShape.circle, // Forma circular
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new, // Ícono personalizado
                        size: 24,
                        color: Colors.white, // Color del ícono
                      ),
                    ),
                  ),
                ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Imagen Completa',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 3),
            ],
          ),
        ),
      body: GestureDetector(
        child: InteractiveViewer(
          maxScale: _maxScale,
          minScale: 1.0,
          scaleEnabled: true, // Habilita el escalado con los dedos
          child: Transform.scale(
            scale: _scale, // Aplica la escala dinámica
            child: Center(
              child: Image.asset(
                widget.imagenAssets,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
/*import 'package:flutter/material.dart';

class ImagenCompleta extends StatefulWidget {
  final String imagenAssets;

  const ImagenCompleta({super.key, required this.imagenAssets});

  @override
  State<ImagenCompleta> createState() => _ImagenCompletaState();
}

class _ImagenCompletaState extends State<ImagenCompleta> {
  double _currentScale = 1.0; // Escala inicial
  final double _maxScale = 5.0; // Escala máxima
  final double _doubleTapScale = 2.0; // Escala al hacer doble tap

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vista de Imagen"),
      ),
      body: GestureDetector(
        onDoubleTap: () {
          setState(() {
            // Alterna entre la escala normal y la escala definida para el doble tap
            _currentScale = _currentScale == 1.0 ? _doubleTapScale : 1.0;
          });
        },
        child: InteractiveViewer(
          maxScale: _maxScale,
          minScale: 1.0,
          scaleEnabled: true, // Habilita zoom con los dedos
          panEnabled: _currentScale > 1.0, // Habilita el movimiento si el zoom es mayor a 1.0
          child: Center(
            child: AnimatedScale(
              scale: _currentScale, // Usa escala dinámica con animación
              duration: const Duration(milliseconds: 300), // Suaviza la transición del zoom
              child: Image.asset(
                widget.imagenAssets,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/