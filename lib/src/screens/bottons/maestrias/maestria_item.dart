import 'package:flutter/widgets.dart';
import 'package:appscom/src/screens/bottons/maestrias/mcscm_screen.dart';
import 'package:appscom/src/screens/bottons/maestrias/mctiad_screen.dart';


//nokmbres de las Maestriass
class Maestrias {
  final String title, description, iconSrc;
  final Color bgColor;
  final Color textColor;
  final String maestrias;
  final String imgenpath;
  final Widget destinationScreen;
  

  Maestrias({
    required this.title,
    this.description = '',
    this.iconSrc = "",
    this.bgColor = const Color.fromARGB(255, 71, 138, 231),
    this.textColor = const Color.fromARGB(255, 0, 0, 0),
    this.imgenpath = "",
    this.maestrias = "",
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
    objectivo:"Formar maestros en ciencias con una orientación científica altamente calificados y competitivos a nivel nacional e internacional, con la capacidad de contribuir y realizar investigación en las ciencias computacionales móviles. Innovar, implementar y aplicar la computación móvil para atender adecuadamente las necesidades de los sectores productivo y social del país.",
    requisitosIngreso: "Los estudiantes que ingresen al Instituto Politécnico Nacional, en cualquiera de sus programas y niveles, deberán contar con los conocimientos y las habilidades básicas que garanticen un adecuado desempeño en el nivel al que solicitan su ingreso. Asimismo, deberán contar con las actitudes y valores necesarios para responsabilizarse de su proceso formativo y asumir una posición activa frente al estudio y al desarrollo de los proyectos y trabajos requeridos, coincidentes con el ideario y principios del IPN.",
    becas: "El IPN ofrece diversas becas para apoyar a los estudiantes en su formación académica.",
    obtencionGrado: "Para obtener el grado de Maestro en Ciencias en Sistemas Computacionales Móviles, el estudiante deberá cumplir con los requisitos establecidos por el IPN.",
    campoLaboral: "Este profesional podrá desempeñarse en el desarrollo y aplicación de la Inteligencia Artificial, en los ámbitos público y privado, en campos ocupacionales como los que se enlistan a continuación:", 
  ),
  MaestriasItem(
    id: 1,
    title: "Licenciatura en Ciencia de Datos",
    objectivo:"Formar expertos capaces de extraer conocimiento implícito y complejo, potencialmente útil a partir de grandes conjuntos de datos, utilizando métodos de inteligencia artificial, aprendizaje de máquina, estadística, sistemas de bases de datos y modelos matemáticos sobre comportamientos probables, para apoyar la toma de decisiones de alta dirección.",
    requisitosIngreso: "Los estudiantes que ingresen al Instituto Politécnico Nacional, en cualquiera de sus programas y niveles, deberán contar con los conocimientos y las habilidades básicas que garanticen un adecuado desempeño en el nivel al que solicitan su ingreso. Asimismo, deberán contar con las actitudes y valores necesarios para responsabilizarse de su proceso formativo y asumir una posición activa frente al estudio y al desarrollo de los proyectos y trabajos requeridos, coincidentes con el ideario y principios del IPN.",
    becas: "El IPN ofrece diversas becas para apoyar a los estudiantes en su formación académica.",
    obtencionGrado: "Para obtener el grado de Licenciado en Ciencia de Datos, el estudiante deberá cumplir con los requisitos establecidos por el IPN.",
    campoLaboral: "Este profesional podrá desempeñarse en los ámbitos público y privado en campos ocupacionales como los que se enlistan a continuación:", 
  ),
];



//lista de Maestriass para la pantalla de inicio botones  
  final List<Maestrias> principalesMaestrias = [
    Maestrias(
    title: "Maestría en Ciencias en Sistemas Computacionales Móviles",
    maestrias: "MCSCM",
    iconSrc: "assets/icons/lcd.svg",
    imgenpath: "assets/png/Maestriass/Maestrias9.png",
    destinationScreen: MaestriaSistemas(maestriaItem: principalesMaestriasItems[0],), 
  ),
  Maestrias(
    title: "Maestría en Ciencia y Tecnología de Inteligencia Artificial y Ciencia de Datos",
    maestrias: "MCTIACD",
    iconSrc: "assets/icons/lcd.svg",
    imgenpath: "assets/png/Maestriass/Maestrias9.png",
    destinationScreen: MaestriaInteligencia(maestriaItem: principalesMaestriasItems[1],), 
  ),
];

