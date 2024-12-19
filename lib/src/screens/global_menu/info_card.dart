import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.instituto,
    required this.escuela,
    required this.svgAsset,
  });

  final String instituto;
  final String escuela;
  final String svgAsset; // Ruta al archivo SVG

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30, // Aumentar el tamaño del círculo
        backgroundColor: const Color.fromARGB(255, 253, 253, 253),
        child: SvgPicture.asset(
          svgAsset,
          width: 40, // Tamaño del SVG
          height: 40,
        ),
      ),
      title: Text(
        instituto,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        escuela,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
