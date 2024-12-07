import 'package:flutter/material.dart';
import 'profesores_lista.dart';

class TemplateGalleryApp extends StatelessWidget {
  static const String routeName ='/TemplateGalleryApp';
  const TemplateGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 0, 22, 119),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white70,
          ),
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.grey[800]),
        ),
        iconTheme: const IconThemeData(color: Colors.grey),
      ),
      home: const ContactListPage(),
    );
  }
}


