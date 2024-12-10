import 'package:rive/rive.dart';

class RiveAsset {
  final String artboard, stateMachineName, title, src, routeName;
  late SMIBool? input;

  RiveAsset(this.src,
      {required this.artboard,
      required this.stateMachineName,
      required this.title,
      required this.routeName,
      this.input});

  set setInput(SMIBool status) {
    input = status;
  }
}

/*List<RiveAsset> bottomNavs = [
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
];*/

List<RiveAsset> sideMenus = [
  RiveAsset(
    "assets/rive/icons.riv",
    artboard: "HOME",
    stateMachineName: "HOME_interactivity",
    title: "Inicio",
    routeName: "/inicio",
    
  ),
  RiveAsset(
    "assets/rive/icons.riv",
    artboard: "SEARCH",
    stateMachineName: "SEARCH_Interactivity",
    title: "Ubicacion",
    routeName: "/mapa",
  ),
  RiveAsset(
    "assets/rive/icons.riv",
    artboard: "LIKE/STAR",
    stateMachineName: "STAR_Interactivity",
    title: "Historia y Escudo",
    routeName: "/mapa",
  ),
  RiveAsset(
    "assets/rive/icons.riv",
    artboard: "CHAT",
    stateMachineName: "CHAT_Interactivity",
    title: "Contacto",
    routeName: "/inicio",
  ),
];

List<RiveAsset> sideMenu2 = [
  RiveAsset(
    "assets/rive/icons.riv",
    artboard: "TIMER",
    stateMachineName: "TIMER_Interactivity",
    title: "Horarios",
    routeName: "/profesores",
  ),
  RiveAsset(
    "assets/rive/icons.riv",
    artboard: "USER",
    stateMachineName: "TIMER_Interactivity",
    title: "Profesores",
    routeName: "/bienvenida",
  ),
  RiveAsset(
    "assets/rive/icons.riv",
    artboard: "BELL",
    stateMachineName: "BELL_Interactivity",
    title: "...",
    routeName: "/profesores",
  ),
];