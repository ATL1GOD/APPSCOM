import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:appscom/src/utils/rive_asset.dart';
import 'package:appscom/src/utils/rive_utils.dart';

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
                  riveonInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            stateMachineName: menu.stateMachineName);
                    menu.input = controller.findSMI("active") as SMIBool;
                  },
                  press: () {
                    //Activa la animación
                    menu.input!.change(true);
                    Future.delayed(const Duration(seconds: 1000), () {
                      menu.input!.change(false);
                    });
                    //navega a la pantalla correspondiente
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
                  riveonInit: (artboard) {
                    // Let me show you if user click on the menu how to show the animation
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            stateMachineName: menu.stateMachineName);
                    menu.input = controller.findSMI("active") as SMIBool;
                    // See as we click them it start animate
                  },
                  press: () {
                    if (menu.input != null) {
                      // Activa la animación
                      menu.input!.change(true);
                      Future.delayed(const Duration(seconds: 1000), () {
                        menu.input!.change(false);
                      });
                    }
                    // navega a la pantalla correspondiente
                    Navigator.pushNamed(context, menu.routeName);
                    setState(() {
                      selectedMenu = menu;
                    });
                  },
                  
                  /*press: () {
                    //Activa la animación
                    menu.input!.change(true);
                    Future.delayed(const Duration(seconds: 1000), () {
                      menu.input!.change(false);
                    });
                    //navega a la pantalla correspondiente
                    Navigator.pushNamed(context, menu.routeName);
                    setState(() {
                      selectedMenu = menu;
                    });
                  },*/
                  isActive: selectedMenu == menu,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}