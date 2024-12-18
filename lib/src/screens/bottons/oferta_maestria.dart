import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:appscom/src/screens/bottons/maestrias/maestria_item.dart';

class OfertaMaestria extends StatelessWidget {
  const OfertaMaestria({
    super.key,
    required this.maestria,
  });

  final Maestrias maestria;

  @override
  Widget build(BuildContext context) {
    return SizedBox( // Tamaño fijo opcional
    child:GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => maestria.destinationScreen,
        ),
      );
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: maestria.bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  maestria.title,
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
            maestria.icon,
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
