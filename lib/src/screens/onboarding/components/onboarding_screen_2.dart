import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';



class Onboarding2Screen extends StatelessWidget{
  static const String routename ='Onboarding2';
  const Onboarding2Screen({super.key});

@override
  Widget build(BuildContext context) {
    const String assetName = 'assets/svg/onboarding/undraw3.svg';
    final Widget svg = SvgPicture.asset(
      assetName,
      semanticsLabel: '', // Etiqueta para describir la imagen
    );
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 100.w, // Contenedor principal ajustado a un ancho responsivo
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SVG centrado y ajustado
                SizedBox(
                  height: 40.h, // Altura proporcional al 40% de la pantalla
                  width: 60.w,  // Ancho proporcional al 60% de la pantalla
                  child: svg,
                ),
                SizedBox(height: 2.h), // Separación entre SVG y texto
                // T
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Estamos', //
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: ' comprometidos\n', // 
                          style: TextStyle(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        TextSpan(
                          text: 'con tu', // 
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: ' educacion', // 
                          style: TextStyle(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        TextSpan(
                          text: ' esperamos verte pronto', // 
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center, // Centrar el texto
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