import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:appscom/src/res/colors.dart';
import 'package:appscom/src/screens/onboarding/screens_onboarding.dart';
import 'package:sizer/sizer.dart';
import 'package:appscom/src/screens/entrypoint/entry_point.dart';
import 'package:appscom/src/screens/login/bienvenida_screen.dart';
import 'package:appscom/src/screens/perfil/perfil_detalles.dart';
import 'package:appscom/src/screens/profesores/template_gallery_app.dart';
//importacion de las opciones de firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    //return ScreenUtilInit(
      //designSize: const Size(390, 844), // Diseño base iPhone 12
      /*builder: (context, child) =>*/
      return Sizer(
        builder: (context, orientation, devicetype) {      

       return MaterialApp(
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
        initialRoute: OnboardingScreen.name, // Ruta inicial
        routes: {
          OnboardingScreen.name                    : (context) => const OnboardingScreen(),
          Onboarding1Screen.routename              : (context) => const Onboarding1Screen(),
          Onboarding2Screen.routename              : (context) => const Onboarding2Screen(),
          Onboarding3Screen.routename              : (context) => const Onboarding3Screen(),
          ContenedorOnboardingScreen.routename     : (context) => const ContenedorOnboardingScreen(),
          EntryPoint.routeName                     : (context) => const EntryPoint(),
          WelcomeScreen.routeName                  : (context) => const WelcomeScreen(),
          PerfilUsuario.routename                  : (context) => const PerfilUsuario(nombre: 'YourName'),
          TemplateGalleryApp.routeName             : (context) => const TemplateGalleryApp(),
        },  
        //home: const OnboardingScreen(), // Pantalla de bienvenida directamente
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









/*import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:appscom/src/screens/onboarding/onboarding_screen.dart';
import 'package:appscom/src/navigation/new_routes.dart';
import 'package:appscom/src/res/colors.dart';

void main() {
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
    return ScreenUtilInit(
      designSize: const Size(390, 844), // Diseño base (ej. iPhone 12)
      builder: (context, child) => MaterialApp.router(
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
        routerConfig: goRouter, // Configuración de rutas dinámicas
      ),
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

// goRouter es el sistema de navegación, pero puedes usar OnboardingScreen directamente si prefieres.
class OnboardingWrapper extends StatelessWidget {
  const OnboardingWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingScreen(); // Pantalla de bienvenida
  }
}
*/









/*import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:appscom/src/navigation/new_routes.dart';
import 'package:appscom/src/res/colors.dart';

void main() async { //en esta parte se agrega el async
  runApp( //se agrega el async
    DevicePreview( 
      enabled: kReleaseMode, 
      tools: const [
        DeviceSection(),
        SettingsSection(),
      ],
      builder: (context) => const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: "APPSCOM",
        themeMode: ThemeMode.light,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.lightScaffoldBg,
        ),
        routerConfig: goRouter,
      ),
    );
  }
}
//5 11 (calendario escolar) 12 (botones)  13 (imagenes) 26 (login dise;o) 30 (info) 39(info) 41 (perfil login boleta curp) 90 
*/