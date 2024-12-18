import 'package:flutter/material.dart';
import 'package:appscom/src/screens/bottons/maestrias/mcscm_screen.dart';
import 'package:appscom/src/screens/bottons/maestrias/mctiad_screen.dart';


//nokmbres de las Maestriass
class Maestrias {
  final String title, description;
  final IconData icon;
  final Color bgColor;
  final Color textColor;
  final String maestria;
  final String imagenasset;
  final Widget destinationScreen;
  

  Maestrias({
    required this.title,
    this.description = '',
    required this.icon,
    this.bgColor = const Color.fromARGB(255, 71, 138, 231),
    this.textColor = const Color.fromARGB(255, 0, 0, 0),
    this.imagenasset = "",
    this.maestria = "",
    required this.destinationScreen,
  });
}
 //ItemMaestriasItem de cada Maestrias
class MaestriasItem{
  final int id;
  final String title;
  final String objectivo;
  final String requisitosIngreso;
  final String becas;  
  final String obtencionGrado;
  final String campoLaboral;
  

  MaestriasItem({
    required this.id,
    required this.title,
    required this.objectivo,
    required this.requisitosIngreso,
    required this.becas,
    required this.obtencionGrado,
    required this.campoLaboral,
  });

MaestriasItem copyWith({
    int? id,
    String? title,
    String? objectivo,
    String? requisitosIngreso,
    String? becas,
    String? obtencionGrado,
    String? campoLaboral
  }) {
  return MaestriasItem(
    id: id ?? this.id,
    title: title ?? this.title,
    objectivo: objectivo ?? this.objectivo,
    requisitosIngreso: requisitosIngreso ?? this.requisitosIngreso,
    becas: becas ?? this.becas,
    obtencionGrado: obtencionGrado ?? this.obtencionGrado,
    campoLaboral: campoLaboral ?? this.campoLaboral,
  );
  }
}

//lista de ItemMaestriasItem de cada Maestrias 
final List<MaestriasItem> principalesMaestriasItems= [
  MaestriasItem(
    id: 0,
    title: "Maestría en Ciencias en Sistemas Computacionales Móviles",  
    objectivo:"Formar maestros en ciencias con una orientación científica altamente calificados y competitivos a nivel nacional e internacional, con la capacidad de contribuir y realizar investigación en las ciencias computacionales móviles.\n Innovar, implementar y aplicar la computación móvil para atender adecuadamente las necesidades de los sectores productivo y social del país.",
    requisitosIngreso: "1. Poseer título profesional o certificado oficial de terminación de estudios en el área de Ingeniería en Sistemas Computacionales, Telecomunicaciones, Electrónica o Matemáticas.\n 2. Aprobar el proceso de admisión de conformidad a lo establecido en el Reglamento de Estudios de Posgrado y lo acordado en el H. Colegio de Profesores de la SEPI-ESCOM.\n 3. No haber causado baja en algún posgrado del IPN, salvo que haya sido revocada por el Colegio Académico de Posgrado.\n 4. Es importante mencionar que, para el trámite de obtención de grado deberá presentar evidencia del dominio del idioma nivel B1 en mínimo dos habilidades.\nPara mayor información de los trámites para extranjeros, podrán consultar la siguiente liga: https://tinyurl.com/r9taajza",
    becas: "Los alumnos aceptados podrán aplicar a la convocatoria y participar para una Beca Institucional o Beca CONAHCYT.\n El IPN, o en su caso el CONAHCYT otorgará a los alumnos inscritos en el programa, una beca mensual siempre y cuando reúnan los requisitos establecidos; el número de becas estará sujeto al presupuesto federal otorgado al CONAHCYT yal IPN",
    obtencionGrado: "Para obtener el grado de Maestría, el alumno deberá cumplir con los requisitos establecidos en el Artículo 48 del Reglamento de Estudios de Posgrado del IPN vigente.\n a) Estar inscrito en el programa de maestría correspondiente;\n b) Cumplir su programa individual de actividades definitivo;\n c) Haber desarrollado una tesis de maestría con las características señaladas en el reglamento, y\n d) Aprobar el examen de grado",
    campoLaboral: "Este profesional podrá desempeñarse en el desarrollo y aplicación de la Inteligencia Artificial, en los ámbitos público y privado, en campos ocupacionales como los que se enlistan a continuación:", 
  ),
  MaestriasItem(
    id: 1,
    title: "Maestría en Ciencia y Tecnología de Inteligencia Artificial y Ciencia de Datos",
    objectivo:"Formar maestros en ciencias con una orientación científica altamente calificados y competitivos a nivel nacional e internacional, con la capacidad de contribuir y realizar investigación en las ciencias computacionales móviles.\n Innovar, implementar y aplicar la computación móvil para atender adecuadamente las necesidades de los sectores productivo y social del país.",
    requisitosIngreso: "1. Poseer título profesional o certificado oficial de terminación de estudios en el área de Ingeniería en Sistemas Computacionales, Telecomunicaciones, Electrónica o Matemáticas.\n 2. Aprobar el proceso de admisión de conformidad a lo establecido en el Reglamento de Estudios de Posgrado y lo acordado en el H. Colegio de Profesores de la SEPI-ESCOM.\n 3. No haber causado baja en algún posgrado del IPN, salvo que haya sido revocada por el Colegio Académico de Posgrado.\n 4. Es importante mencionar que, para el trámite de obtención de grado deberá presentar evidencia del dominio del idioma nivel B1 en mínimo dos habilidades.\nPara mayor información de los trámites para extranjeros, podrán consultar la siguiente liga: https://tinyurl.com/r9taajza",
    becas: "Los alumnos aceptados podrán aplicar a la convocatoria y participar para una Beca Institucional o Beca CONAHCYT.\n El IPN, o en su caso el CONAHCYT otorgará a los alumnos inscritos en el programa, una beca mensual siempre y cuando reúnan los requisitos establecidos; el número de becas estará sujeto al presupuesto federal otorgado al CONAHCYT yal IPN",
    obtencionGrado: "Para obtener el grado de Maestría, el alumno deberá cumplir con los requisitos establecidos en el Artículo 48 del Reglamento de Estudios de Posgrado del IPN vigente.\n a) Estar inscrito en el programa de maestría correspondiente;\n b) Cumplir su programa individual de actividades definitivo;\n c) Haber desarrollado una tesis de maestría con las características señaladas en el reglamento, y\n d) Aprobar el examen de grado",
    campoLaboral: "Este profesional podrá desempeñarse en el desarrollo y aplicación de la Inteligencia Artificial, en los ámbitos público y privado, en campos ocupacionales como los que se enlistan a continuación:", 
  ),
];



//lista de Maestriass para la pantalla de inicio botones  
  final List<Maestrias> principalesMaestrias = [
    Maestrias(
    title: "Maestría en Ciencias en Sistemas Computacionales Móviles",
    maestria: "MCSCM",
    icon: Icons.developer_mode,
    imagenasset: "assets/png/carreras/carrera13.png",
    destinationScreen: MaestriaSistemas(maestriaItem: principalesMaestriasItems[0],), 
  ),
  Maestrias(
    title: "Maestría en Ciencia y Tecnología de Inteligencia Artificial y Ciencia de Datos",
    maestria: "MCTIACD",
    icon: Icons.data_object,
    imagenasset: "assets/png/carreras/carrera12.png",
    destinationScreen: MaestriaInteligencia(maestriaItem: principalesMaestriasItems[1],), 
  ),
];

