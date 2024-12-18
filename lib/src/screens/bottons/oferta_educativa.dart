import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:appscom/src/screens/bottons/carreras/carreras_item.dart';

class OfertaEducativa extends StatelessWidget {
  const OfertaEducativa({
    super.key,
    required this.carrera,
  });

  final Carrera carrera;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => carrera.destinationScreen,
        ),
      );
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: carrera.bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  carrera.title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: const Color.fromARGB(255, 255, 255, 255),
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
              color: Colors.white70,
            ),
          ),
          const SizedBox(width: 8),
          Icon(
            carrera.icon,
            size: 40,  // Establece el tamaño del ícono
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ],
      ),
      ),
      ),
    );
  }
}
