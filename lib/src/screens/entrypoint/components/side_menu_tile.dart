import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:appscom/src/utils/rive_asset.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    super.key,
    required this.menu,
    required this.press,
    required this.riveonInit,
    required this.isActive,
  });

  final RiveAsset menu;
  final VoidCallback press;
  final ValueChanged<Artboard> riveonInit;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Divider(
            color: Colors.white24,
            height: 1,
          ),
        ),
        Stack(
          children: [
            // This is what we wanted
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              // Much better
              height: 56,
              width: isActive ? 288 : 0,
              left: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF6792FF),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                // Cambia el estado de la animación a activo
                 if (menu.input != null) {
                    menu.input!.change(true);
                    Future.delayed(
                      const Duration(milliseconds: 800), // Ajusta la duración según la animación
                      () {
                        menu.input!.change(false); // Reinicia la animación
                      },
                    );
                  }else {
                    print('Error: menu.input es nulo');
                    }
                  press(); // Llama a la función `press` para manejar la lógica adicional
                },
              leading: SizedBox(
                height: 34,
                width: 34,
                child: RiveAnimation.asset(
                  menu.src,
                  artboard: menu.artboard,
                  onInit: riveonInit,
                ),
              ),
              title: Text(
                menu.title,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}