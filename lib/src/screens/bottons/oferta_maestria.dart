import 'package:flutter/material.dart';
import 'package:appscom/src/screens/bottons/maestrias/maestria_item.dart';

class OfertaMaestria extends StatefulWidget {
  const OfertaMaestria({
    super.key,
    required this.maestria,
  });

  final Maestrias maestria;


  @override
  State<OfertaMaestria> createState() => _OfertaMaestriaState();
}

class _OfertaMaestriaState extends State<OfertaMaestria>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Velocidad ajustada para suavidad
    )..repeat(reverse: false);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => widget.maestria.destinationScreen,
            ),
          );
        },
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            // Gradiente animado más intenso
            final gradient = LinearGradient(
              colors: [
                const Color.fromARGB(255, 255, 255, 255).withOpacity(0.8), // Azul brillante
                const Color.fromARGB(255, 2, 33, 80).withOpacity(0.9), // Azul cian vibrante
                const Color.fromARGB(255, 2, 11, 29).withOpacity(0.8), // Azul brillante
              ],
              stops: [0, 0.1, 0.5], // Parámetros de intensidad
              //De izquierda a derecha en diagonal es esta 
              begin: Alignment(-1 + 2 * _animationController.value, -1),
              end: Alignment(1 + 2 * _animationController.value, 1),
              //De deracha a izquierda en diagonal es esta
             /* begin: Alignment(1 - 2 * _animationController.value, 1),
              end: Alignment(-1 - 2 * _animationController.value, -1),*/

            );

            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 81, 139, 197), // Fondo azul oscuro para contraste
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF002B5C).withOpacity(0.8),
                    blurRadius: 8, // Sombra más difuminada
                    spreadRadius: 1, // Sombra más extendida
                    offset: const Offset(0, 2), // Sombra más llamativa
                  ),
                ],
              ),
              child: ShaderMask(
                shaderCallback: (bounds) {
                  return gradient.createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.maestria.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 21,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                      child: VerticalDivider(
                        color: Color.fromARGB(237, 255, 255, 255),
                        thickness: 1.5,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      widget.maestria.icon,
                      size: 40,
                      color: const Color.fromARGB(255, 255, 255, 255), // Ícono cian brillante
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
