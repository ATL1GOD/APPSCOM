import 'dart:math';
import 'package:flutter/material.dart';
import 'package:appscom/src/screens/global_menu/side_menu.dart';
import 'package:appscom/src/res/constants.dart';
import 'package:appscom/src/screens/global_menu/menu_btn.dart';
import 'package:rive/rive.dart';
import 'rive_utils.dart';

class MenuGlobal extends StatefulWidget {
  final Widget child; // Recibe el widget que se debe mostrar en el cuerpo de la página
  final int selectedIndex; // índice de la sección activa
  const MenuGlobal({super.key, required this.child, required this.selectedIndex});

  @override
  State<MenuGlobal> createState() => _MenuGlobalState();
}

class _MenuGlobalState extends State<MenuGlobal> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scalAnimation;
  late SMIBool isSideBarClosed;
  bool isSideMenuClosed = true;

  int selectedIndex = 0; // Inicializamos el índice seleccionado

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex; // Sincronizar con el valor recibido
    // Inicializamos el controlador de animación
        _animationController = AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 200),
        )..addListener(() {
            setState(() {});
          });

    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          // SideMenu (Drawer) animado
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            width: 288,
            left: isSideMenuClosed ? -288 : 0,
            height: MediaQuery.of(context).size.height,
            child: SideMenu(selectedIndex: selectedIndex), // Pasamos el índice de la sección activa
          ),
          
          // Transformación del cuerpo
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(animation.value - 30 * animation.value * pi / 180),
            child: Transform.translate(
              offset: Offset(animation.value * 265, 0),
              child: Transform.scale(
                scale: scalAnimation.value,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  child: widget.child, // Este es el widget principal que pasa como argumento
                ),
              ),
            ),
          ),
          
          // Botón del menú
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: isSideMenuClosed ? 0 : 220,
            top: 16,
            child: MenuBtn(
              riveOnInit: (artboard) {
                StateMachineController controller = RiveUtils.getRiveController(
                    artboard,
                    stateMachineName: "State Machine");
                isSideBarClosed = controller.findSMI("isOpen") as SMIBool;
                isSideBarClosed.value = true;
              },
              press: () {
                isSideBarClosed.value = !isSideBarClosed.value;
                if (isSideMenuClosed) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
                setState(() {
                  isSideMenuClosed = isSideBarClosed.value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
