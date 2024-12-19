import 'package:flutter/material.dart';
import 'rive_asset.dart'; // Importas el archivo que contiene los RiveAssets
import 'info_card.dart';
import 'side_menu_tile.dart';

class SideMenu extends StatelessWidget {
  final int selectedIndex; // Índice de la sección activa

  const SideMenu({super.key, required this.selectedIndex}); // Constructor con el parámetro
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: const Color(0xFF17203A),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InfoCard(
                instituto: "IPN",
                escuela: "ESCOM",
                svgAsset: "assets/svg/logos/institucional.svg",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "Comunidad IPN".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              // Generar menús principales
              ...sideMenus.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  press: () {
                    // Actualiza el índice antes de navegar
                    Navigator.pushNamed(context, menu.routeName).then((_) {
                      // Asegúrate de volver al menú con el índice correcto
                      (context as Element).markNeedsBuild();
                    });
                    // Puedes agregar aquí una función global para mantener sincronizado el estado
                  },
                  isActive: selectedIndex == sideMenus.indexOf(menu), // Comparar el índice seleccionado
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "Escomunidad".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              // Generar menús secundarios
              ...sideMenu2.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  press: () {
                    // Actualiza el índice antes de navegar
                    Navigator.pushNamed(context, menu.routeName).then((_) {
                      // Asegúrate de volver al menú con el índice correcto
                      (context as Element).markNeedsBuild();
                    });
                  },
                  isActive: selectedIndex == sideMenus.length + sideMenu2.indexOf(menu),
                  //isActive: selectedIndex == sideMenus.indexOf(menu), // Comparar el índice seleccionado
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

































/*import 'package:flutter/material.dart';
import 'rive_asset.dart';  // Importas el archivo que contiene los RiveAssets
import 'info_card.dart';
import 'side_menu_tile.dart';

class SideMenu extends StatelessWidget {
  final int selectedIndex; // Índice de la sección activa

  const SideMenu({super.key, required this.selectedIndex}); // Constructor con el parámetro
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: const Color(0xFF17203A),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InfoCard(
                name: "Atl & Kelly ",
                profession: "Estudiante",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "Comunidad IPN".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...sideMenus.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  press: () {
                    // Navega a la pantalla correspondiente
                    Navigator.pushNamed(context, menu.routeName);
                  },
                  isActive: selectedIndex == sideMenus.indexOf(menu), // Comparar el índice seleccionado
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "Escomunidad".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...sideMenu2.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  press: () {
                    // Navega a la pantalla correspondiente
                    Navigator.pushNamed(context, menu.routeName);
                  },
                  isActive: selectedIndex == sideMenu2.indexOf(menu), // Comparar el índice seleccionado
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/






















/*import 'package:flutter/material.dart';
import 'rive_asset.dart';

import 'info_card.dart';
import 'side_menu_tile.dart';


class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  RiveAsset selectedMenu = sideMenus.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: const Color(0xFF17203A),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InfoCard(
                name: "Atl & Kelly ",
                profession: "Estudiante",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "Comunidad IPN".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...sideMenus.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  press: () {
                    // Navega a la pantalla correspondiente
                    Navigator.pushNamed(context, menu.routeName);
                    setState(() {
                      selectedMenu = menu;
                    });
                  },
                  isActive: selectedMenu == menu,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "Escomunidad".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...sideMenu2.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  press: () {
                    // Navega a la pantalla correspondiente
                    Navigator.pushNamed(context, menu.routeName);
                    setState(() {
                      selectedMenu = menu;
                    });
                  },
                  isActive: selectedMenu == menu,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/









