import 'package:flutter/material.dart';
import 'rive_asset.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    super.key,
    required this.menu,
    required this.press,
    required this.isActive,
  });

  final RiveAsset menu;
  final VoidCallback press;
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
            // Barra de selección activa con efecto animado
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              height: 56,
              width: isActive ? 288 : 0,
              left: 0,
              child: AnimatedActiveBar(),
            ),
            ListTile(
              onTap: press,
              leading: Icon(
                menu.icon, // Usamos el icono en lugar de la animación Rive
                color: Colors.white,
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

class AnimatedActiveBar extends StatefulWidget {
  @override
  _AnimatedActiveBarState createState() => _AnimatedActiveBarState();
}

class _AnimatedActiveBarState extends State<AnimatedActiveBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(); // Repetir la animación constantemente
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: [
                Colors.transparent,
                Colors.white.withOpacity(0.4),
                Colors.transparent,
              ],
              stops: const [0.0, 0.5, 1.0],
              begin: Alignment(-1.0 + 2.0 * _controller.value, 0.0), // Efecto de desplazamiento 
              end: Alignment(1.0 + 2.0 * _controller.value, 0.0),
            ).createShader(bounds);
          },
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF6792FF),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        );
      },
    );
  }
}

















/*import 'package:flutter/material.dart';
import 'rive_asset.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    super.key,
    required this.menu,
    required this.press,
    required this.isActive,
  });

  final RiveAsset menu;
  final VoidCallback press;
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
            // Barra de selección activa
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
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
              onTap: press,
              leading: Icon(
                menu.icon, // Usamos el icono en lugar de la animación Rive
                color: Colors.white,
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
*/