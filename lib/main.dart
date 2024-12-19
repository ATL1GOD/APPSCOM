/*// Importación de la librería DevicePreview para pruebas en diferentes dispositivos
import 'package:device_preview/device_preview.dart'; 
// Importación para el modo release de la aplicación
import 'package:flutter/foundation.dart'; */


// Importacion para el uso de material design en la aplicación
import 'package:flutter/material.dart'; 
// importación de la librería sizer para el diseño responsivo
import 'package:sizer/sizer.dart'; 
//importacion de las opciones de firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
//importacion de las preferencias y el provider
import 'package:provider/provider.dart'; 
// Importación de las rutas de todas las pantallas de la aplicación
import 'package:appscom/screens_appscom.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
    final preferences= Preferences();
    await preferences.initialize();
  runApp(
    /*
    DevicePreview(
      enabled: !kReleaseMode, // Habilita DevicePreview en modo debug
      builder: (context) => const App(), // Llama al widget principal
    ),
    */
    const App(),
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
          /*
          useInheritedMediaQuery: true, // Necesario para DevicePreview
          locale: DevicePreview.locale(context), // Soporte de idiomas
          builder: DevicePreview.appBuilder, // Builder de DevicePreview
          */
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
            MenuAcceso.routename                     : (context) => const MenuAcceso(nombre: 'nombre'),
            PerfilUsuario.routename                  : (context) => const PerfilUsuario(nombre: 'nombre'),
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



