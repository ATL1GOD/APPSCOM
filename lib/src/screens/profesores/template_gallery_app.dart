import 'package:flutter/material.dart';
import 'contact_list_page.dart';
import 'busqueda.dart';

class TemplateGalleryApp extends StatelessWidget {
  static const String routeName ='TemplateGalleryApp';
  const TemplateGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff23202a),
        appBarTheme: AppBarTheme(
          color: const Color.fromARGB(255, 0, 22, 119),
          centerTitle: true,
          iconTheme: const IconThemeData(
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


