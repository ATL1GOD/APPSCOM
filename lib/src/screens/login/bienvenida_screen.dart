import 'package:flutter/material.dart';

import 'background.dart';
import 'responsive.dart';
import 'login_btn.dart';
import 'bienvenida_imagen.dart';
import 'package:appscom/src/screens/global_menu/custom_drawer.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = '/bienvenida';
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const  MenuGlobal(
      selectedIndex: 1,
      child: Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: WelcomeImage(),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 450,
                        child: LoginAndSignupBtn(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            mobile: MobileWelcomeScreen(),
          ),
        ),
      ),
    ),
    );
  }
}

class MobileWelcomeScreen extends StatelessWidget {
  const MobileWelcomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        WelcomeImage(),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: LoginAndSignupBtn(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}