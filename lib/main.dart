import 'package:appscom/src/screens/equipo_desarrollo/equipo_screen.dart';
import 'package:appscom/src/screens/historia/historia_screen.dart';
import 'package:appscom/src/screens/home/home_page.dart';
import 'package:appscom/src/screens/profesores/profesores_lista.dart';
import 'package:appscom/src/utils/provider/onboarding_provider.dart';
import 'package:appscom/src/utils/preferences.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:appscom/src/res/colors.dart';
import 'package:appscom/src/screens/onboarding/screens_onboarding.dart';
import 'package:sizer/sizer.dart';
import 'package:appscom/src/screens/login/bienvenida_screen.dart';
import 'package:appscom/src/screens/perfil/perfil_detalles.dart';
import 'package:appscom/src/screens/maps/mapa_screen.dart';
//importacion de las opciones de firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
    final preferences= Preferences();
    await preferences.initialize();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode, // Habilita DevicePreview en modo debug
      builder: (context) => const App(), // Llama al widget principal
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});
 
  @override
  Widget build(BuildContext context) {
      final preferences= Preferences();

      return Sizer(
        builder: (context, orientation, devicetype) {      

       return MultiProvider(
        providers: [
              ChangeNotifierProvider(create: (_) => OnboardingProvider()),
          ],
         child: MaterialApp(
          // ignore: deprecated_member_use
          useInheritedMediaQuery: true, // Necesario para DevicePreview
          locale: DevicePreview.locale(context), // Soporte de idiomas
          builder: DevicePreview.appBuilder, // Builder de DevicePreview
          debugShowCheckedModeBanner: false,
          title: "APPSCOM",
          themeMode: ThemeMode.light,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.lightScaffoldBg,
            fontFamily: "Intel", // Fuente personalizada
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.white,
              errorStyle: const TextStyle(height: 0),
              border: defaultInputBorder,
              enabledBorder: defaultInputBorder,
              focusedBorder: defaultInputBorder,
              errorBorder: defaultInputBorder,
            ),
          ),
          // Aquí se agregan las rutas de las pantallas de bienvenida
          initialRoute: preferences.initialPage, // Ruta inicial
          routes: {
            OnboardingScreen.name                    : (context) => const OnboardingScreen(),
            Onboarding1Screen.routename              : (context) => const Onboarding1Screen(),
            Onboarding2Screen.routename              : (context) => const Onboarding2Screen(),
            Onboarding3Screen.routename              : (context) => const Onboarding3Screen(),
            ContenedorOnboardingScreen.routename     : (context) => const ContenedorOnboardingScreen(),
            HomePage.routeName                     : (context) => const HomePage(),
            MapScreen.routeName                      : (context) => const MapScreen(),
            HistoriaScreen.routeName                 : (context) => const HistoriaScreen(),
            EquipoScreen.routeName                   : (context) => const EquipoScreen(),
            WelcomeScreen.routeName                  : (context) => const WelcomeScreen(),
            PerfilUsuario.routename                  : (context) => const PerfilUsuario(nombre: 'Nombre'),
            ContactListPage.routeName                : (context) => const ContactListPage(),
          },  
          //home: const OnboardingScreen(), // Pantalla de bienvenida directamente
               ),
       );
    //);
      },
      );
  }
}


const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(
    color: Color(0xFFDEE3F2),
    width: 1,
  ),
);



