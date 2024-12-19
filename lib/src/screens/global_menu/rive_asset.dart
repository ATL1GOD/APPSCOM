import 'package:flutter/material.dart';

class RiveAsset {
  final String title, routeName;
  final IconData icon;  // Usamos IconData en lugar de la animación Rive.

  RiveAsset({
    required this.title,
    required this.routeName,
    required this.icon,  // Reemplazamos la animación Rive por un icono.
  });
}

List<RiveAsset> sideMenus = [
  RiveAsset(
    title: "Inicio",
    routeName: "/inicio",
    icon: Icons.home, // Icono estático de Flutter
  ),
  RiveAsset(
    title: "Ubicación",
    routeName: "/mapa",
    icon: Icons.location_on, // Icono estático de Flutter
  ),
  RiveAsset(
    title: "Historia y Escudo",
    routeName: "/historia",
    icon: Icons.menu_book, // Icono estático de Flutter
  ),
];

List<RiveAsset> sideMenu2 = [
  RiveAsset(
    title: "Perfil",
    routeName: "/bienvenida",
    icon: Icons.account_circle, // Icono estático de Flutter
  ),
  RiveAsset(
    title: "Profesores",
    routeName: "/profesores",
    icon: Icons.group, // Icono estático de Flutter
  ),
  RiveAsset(
    title: "Equipo de Desarrollo",
    routeName: "/equipoDesarrollo",
    icon: Icons.diversity_1, // Icono estático de Flutter
  ),
];
