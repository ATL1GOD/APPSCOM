import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:appscom/src/screens/bottons/carreras_item.dart'; // Ensure this path is correct or update it to the correct path

class OfertaEducativa extends StatelessWidget {
  const OfertaEducativa({
    super.key,
    required this.carrera,
  });

  final Carrera carrera;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
          SvgPicture.asset(
            carrera.iconSrc,
            width: 40,  // Establece el ancho del ícono
            height: 40, 
           ), // Establece la altura del ícono)
        ],
      ),
      ),
    );
  }
}
