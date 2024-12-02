import 'rive_model.dart';

class Menu {
  final String title;
  final RiveModel rive;

  Menu({required this.title, required this.rive});
}

List<Menu> sidebarMenus = [
  Menu(
    title: "Inicio",
    rive: RiveModel(
        src: "assets/rive/icons.riv",
        artboard: "HOME",
        stateMachineName: "HOME_interactivity"),
  ),
  Menu(
    title: "Busqueda",
    rive: RiveModel(
        src: "assets/rive/icons.riv",
        artboard: "BUSQUEDA",
        stateMachineName: "BUSQUEDA_Interactivity"),
  ),
  Menu(
    title: "Favoritos",
    rive: RiveModel(
        src: "assets/rive/icons.riv",
        artboard: "LIKE/STAR",
        stateMachineName: "STAR_Interactivity"),
  ),
  Menu(
    title: "Ayuda",
    rive: RiveModel(
        src: "assets/rive/icons.riv",
        artboard: "CHAT",
        stateMachineName: "CHAT_Interactivity"),
  ),
];
List<Menu> sidebarMenus2 = [
  Menu(
    title: "Historial",
    rive: RiveModel(
        src: "assets/rive/icons.riv",
        artboard: "TIEMPO",
        stateMachineName: "TIEMPO_Interactivity"),
  ),
  Menu(
    title: "Notifications",
    rive: RiveModel(
        src: "assets/rive/icons.riv",
        artboard: "BELL",
        stateMachineName: "BELL_Interactivity"),
  ),
];

List<Menu> bottomNavItems = [
  Menu(
    title: "Chat",
    rive: RiveModel(
        src: "assets/rive/icons.riv",
        artboard: "CHAT",
        stateMachineName: "CHAT_Interactivity"),
  ),
  Menu(
    title: "BUSQUEDA",
    rive: RiveModel(
        src: "assets/rive/icons.riv",
        artboard: "BUSQUEDA",
        stateMachineName: "BUSQUEDA_Interactivity"),
  ),
  Menu(
    title: "Tiempo",
    rive: RiveModel(
        src: "assets/rive/icons.riv",
        artboard: "TIEMPO",
        stateMachineName: "TIEMPO_Interactivity"),
  ),
  Menu(
    title: "Notificaciones",
    rive: RiveModel(
        src: "assets/rive/icons.riv",
        artboard: "BELL",
        stateMachineName: "BELL_Interactivity"),
  ),
  Menu(
    title: "Perfil",
    rive: RiveModel(
        src: "assets/rive/icons.riv",
        artboard: "USER",
        stateMachineName: "USER_Interactivity"),
  ),
];
