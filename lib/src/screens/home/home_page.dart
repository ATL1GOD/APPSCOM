import 'package:appscom/src/screens/bottons/maestrias/maestria_item.dart';
import 'package:appscom/src/screens/bottons/oferta_maestria.dart';
import 'package:appscom/src/screens/carousel/carousel_slide.dart';
import 'package:flutter/material.dart';
import 'package:appscom/src/screens/bottons/carreras/carreras_item.dart';
import '../bottons/oferta_educativa.dart';
import 'package:appscom/src/screens/global_menu/custom_drawer.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/inicio';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuGlobal(
      selectedIndex: 0,
    child:Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Text(
                  " ESCOM",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: const Color.fromARGB(255, 3, 102, 184), fontWeight: FontWeight.w800),
                ),
              ),
              
              const NewsCarouselSlider(),
              
              const SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, bottom: 0), //boottom es para
                child: Center(
                  child:Column(
                    children: [
                      Text(
                        "Escuela Superior de Cómputo",
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: const Color.fromARGB(255, 2, 82, 148),
                          fontWeight: FontWeight.w800,
                          fontSize: 24),
                          textAlign: TextAlign.center, // Tamaño de la fuente
                      ),
                      Text(
                        "La Escuela Superior de Cómputo (ESCOM) es una institución pública mexicana de educación superior perteneciente al Instituto Politécnico Nacional que inició sus actividades académicas en 1993.",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                          textAlign: TextAlign.justify, // Tamaño de la fuente
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(25),
                child: Text(
                  "Oferta Educativa",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: const Color.fromARGB(255, 2, 82, 148),
                    fontWeight: FontWeight.w800,
                    fontSize: 22), // Tamaño de la fuente
                ),
              ),
              ...principalesCarreras.map(
                (carrera) => Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: OfertaEducativa(
                    carrera: carrera,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 5),
                child: Text(
                  "Maestrías/Posgrados",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: const Color.fromARGB(255, 2, 82, 148),
                    fontWeight: FontWeight.w800,
                    fontSize: 22), // Tamaño de la fuente
                ),
              ),
              ...principalesMaestrias.map(
                (maestria) => Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: OfertaMaestria(
                    maestria: maestria,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    ),
    );
  }
}