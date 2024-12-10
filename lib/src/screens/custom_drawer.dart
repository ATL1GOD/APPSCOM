import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:appscom/src/screens/entrypoint/components/side_menu.dart';
import 'package:appscom/src/utils/rive_utils.dart';
import 'package:appscom/src/res/constants.dart';
import 'package:appscom/src/screens/entrypoint/components/menu_btn.dart';
//import 'package:appscom/src/utils/rive_asset.dart';

class MenuGlobal extends StatefulWidget {
  final Widget child; // Recibe el widget que se debe mostrar en el cuerpo de la página
  const MenuGlobal({super.key, required this.child});

  @override
  State<MenuGlobal> createState() => _MenuGlobalState();
}

class _MenuGlobalState extends State<MenuGlobal> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scalAnimation;
  late SMIBool isSideBarClosed;
  bool isSideMenuClosed = true;

  @override
  void initState() {
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
            child: const SideMenu(),
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
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  child: widget.child, // Este es el widget principal que pasa como argumento
                ),
              ),
            ),
          ),
          
          // Botón del menú
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
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























/*// custom_drawer.dart
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:appscom/src/screens/entrypoint/components/side_menu.dart';
import 'package:appscom/src/utils/rive_utils.dart';
import 'package:appscom/src/res/constants.dart';
import 'package:appscom/src/screens/entrypoint/components/menu_btn.dart';
//import 'package:appscom/src/utils/rive_asset.dart';


class MenuGlobal extends StatefulWidget {
  final Widget child; // Recibe el widget que se debe mostrar en el cuerpo de la página
  const MenuGlobal({super.key, required this.child});

  @override
  State<MenuGlobal> createState() => _MenuGlobalState();
}

class _MenuGlobalState extends State<MenuGlobal> with SingleTickerProviderStateMixin {
 // RiveAsset selectedBottomNav = bottomNavs.first;
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scalAnimation;
  late SMIBool isSideBarClosed;
  bool isSideMenuClosed = true;

  @override
  void initState() {
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
            child: const SideMenu(),
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
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  child: widget.child, // Este es el widget principal que pasa como argumento
                ),
              ),
            ),
          ),
          
          // Botón del menú
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
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
}*/
