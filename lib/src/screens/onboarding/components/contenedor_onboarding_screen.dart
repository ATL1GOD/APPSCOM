import 'package:appscom/src/screens/login/bienvenida_screen.dart';
import 'package:flutter/material.dart';
import 'package:appscom/src/screens/onboarding/screens_onboarding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ContenedorOnboardingScreen extends StatefulWidget {
  static const String routename = 'ContenedorOnboarding';
  const ContenedorOnboardingScreen({super.key});

  @override
  State<ContenedorOnboardingScreen> createState() =>
      _ContenedorOnboardingScreenState();
}

class _ContenedorOnboardingScreenState
    extends State<ContenedorOnboardingScreen> {
  final PageController _controller = PageController();
  bool ultimaPagina = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // PageView
            PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  ultimaPagina = index == 2;
                });
              },
              children: const [
                Onboarding1Screen(),
                Onboarding2Screen(),
                Onboarding3Screen(),
              ],
            ),
            // Controles de navegación
            Align(
              alignment: const Alignment(0, 0.9),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Botón "Saltar"
                    TextButton(
                      onPressed: () {
                        _controller.jumpToPage(2); // Salta a la última página
                      },
                      child: const Text(
                        'Saltar',
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                    ),
                    // Indicador de progreso
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                        activeDotColor: Colors.blue,
                        dotColor: Colors.grey,
                        dotHeight: 8,
                        dotWidth: 8,
                        spacing: 8,
                      ),
                    ),
                    // Botón "Siguiente" o "Listo"
                    TextButton(
                      onPressed: () {
                        if (ultimaPagina) {
                          Navigator.pushReplacementNamed(context, WelcomeScreen.routeName);
                          //EntryPoint.routeName);
                          //Navigator.pop(context); // Cierra el flujo
                        } else {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Text(
                        ultimaPagina ? 'Listo' : 'Siguiente',
                        style: const TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
