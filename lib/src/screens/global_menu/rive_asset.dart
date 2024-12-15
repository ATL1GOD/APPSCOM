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
    icon: Icons.star, // Icono estático de Flutter
  ),
  RiveAsset(
    title: "Información App",
    routeName: "/informacionApp",
    icon: Icons.chat, // Icono estático de Flutter
  ),
];

List<RiveAsset> sideMenu2 = [
  RiveAsset(
    title: "Perfil",
    routeName: "/perfil",
    icon: Icons.access_time, // Icono estático de Flutter
  ),
  RiveAsset(
    title: "Profesores",
    routeName: "/profesores",
    icon: Icons.person, // Icono estático de Flutter
  ),
  RiveAsset(
    title: "...",
    routeName: "/bienvenida",
    icon: Icons.notifications, // Icono estático de Flutter
  ),
];















/*import 'package:flutter/material.dart';

class RiveAsset {
  final String title, routeName;
  final IconData icon;  // Usamos IconData en lugar de la animación Rive.

  RiveAsset({
    required this.title,
    required this.routeName,
    required this.icon,  // Reemplazamos la animación Rive por un icono.
  });
}
///////
List<RiveAsset> bottomNavs = [
  RiveAsset("assets/rive/icons.riv",
      artboard: "CHAT", 
      stateMachineName: "CHAT_Interactivity", 
      title: "Chat"),
  RiveAsset("assets/rive/icons.riv",
      artboard: "SEARCH",
      stateMachineName: "SEARCH_Interactivity",
      title: "Search"),
  RiveAsset("assets/rive/icons.riv",
      artboard: "TIMER",
      stateMachineName: "TIMER_Interactivity",
      title: "Chat"),
  RiveAsset("assets/rive/icons.riv",
      artboard: "BELL",
      stateMachineName: "BELL_Interactivity",
      title: "Notifications"),
  RiveAsset("assets/rive/icons.riv",
      artboard: "USER",
      stateMachineName: "USER_Interactivity",
      title: "Profile"),
];
///////////
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
    routeName: "/mapa",
    icon: Icons.star, // Icono estático de Flutter
  ),
  RiveAsset(
    title: "Contacto",
    routeName: "/inicio",
    icon: Icons.chat, // Icono estático de Flutter
  ),
];

List<RiveAsset> sideMenu2 = [
  RiveAsset(
    title: "Horarios",
    routeName: "/profesores",
    icon: Icons.access_time, // Icono estático de Flutter
  ),
  RiveAsset(
    title: "Profesores",
    routeName: "/bienvenida",
    icon: Icons.person, // Icono estático de Flutter
  ),
  RiveAsset(
    title: "...",
    routeName: "/profesores",
    icon: Icons.notifications, // Icono estático de Flutter
  ),
];*/
