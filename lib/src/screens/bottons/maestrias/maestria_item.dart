import 'package:flutter/widgets.dart';
import 'package:appscom/src/screens/bottons/carreras/isa_screen.dart';
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
  final String perfilIngreso;
  final String perfilEgreso;
  final String atributos;
  final String campoLaboral;

  MaestriasItem({
    required this.id,
    required this.title,
    required this.objectivo,
    required this.perfilIngreso,
    required this.perfilEgreso,
    required this.atributos,
    required this.campoLaboral,
  });

MaestriasItem copyWith({
    int? id,
    String? title,
    String? objectivo,
    String? perfilIngreso,
    String? perfilEgreso,
    String? atributos,
    String? campoLaboral
  }) {
  return MaestriasItem(
    id: id ?? this.id,
    title: title ?? this.title,
    objectivo: objectivo ?? this.objectivo,
    perfilIngreso: perfilIngreso ?? this.perfilIngreso,
    perfilEgreso: perfilEgreso ?? this.perfilEgreso,
    atributos: atributos ?? this.atributos,
    campoLaboral: campoLaboral ?? this.campoLaboral,
  );
  }
}

//lista de ItemMaestriasItem de cada Maestrias 
final List<MaestriasItem> principalesMaestriasItems= [
  MaestriasItem(
    id: 0,
    title: "Ingeniería en Inteligencia Artificial",  
    objectivo:"Formar expertos capaces de desarrollar sistemas inteligentes utilizando diferentes metodologías en las diferentes etapas de desarrollo y aplicando algoritmos en áreas como aprendizaje de máquina, procesamiento automático de lenguaje natural, visión artificial y modelos bioinspirados para atender las necesidades de los diferentes sectores de la sociedad a través de la generación de procesos y soluciones innovadoras.",
    perfilIngreso:"Los estudiantes que ingresen al Instituto Politécnico Nacional, en cualquiera de sus programas y niveles, deberán contar con los conocimientos y las habilidades básicas que garanticen un adecuado desempeño en el nivel al que solicitan su ingreso. Asimismo, deberán contar con las actitudes y valores necesarios para responsabilizarse de su proceso formativo y asumir una posición activa frente al estudio y al desarrollo de los proyectos y trabajos requeridos, coincidentes con el ideario y principios del IPN.",
    perfilEgreso:"El egresado de la Ingeniería en Inteligencia Artificial se desempeñará colaborativamente en equipos multidisciplinarios en el análisis, diseño, implementación, validación, implantación, supervisión y gestión de sistemas inteligentes, aplicando algoritmos en áreas como aprendizaje de máquina, procesamiento automático de lenguaje natural, visión artificial y modelos bioinspirados; ejerciendo su profesión con liderazgo, ética y responsabilidad social.",
    atributos: "",
    campoLaboral: "Este profesional podrá desempeñarse en el desarrollo y aplicación de la Inteligencia Artificial, en los ámbitos público y privado, en campos ocupacionales como los que se enlistan a continuación:", 
  ),
  MaestriasItem(
    id: 1,
    title: "Licenciatura en Ciencia de Datos",
    objectivo:"Formar expertos capaces de extraer conocimiento implícito y complejo, potencialmente útil a partir de grandes conjuntos de datos, utilizando métodos de inteligencia artificial, aprendizaje de máquina, estadística, sistemas de bases de datos y modelos matemáticos sobre comportamientos probables, para apoyar la toma de decisiones de alta dirección.",
    perfilIngreso:"Los estudiantes que ingresen al Instituto Politécnico Nacional, en cualquiera de sus programas y niveles, deberán contar con los conocimientos y las habilidades básicas que garanticen un adecuado desempeño en el nivel al que solicitan su ingreso. Asimismo, deberán contar con las actitudes y valores necesarios para responsabilizarse de su proceso formativo y asumir una posición activa frente al estudio y al desarrollo de los proyectos y trabajos requeridos, coincidentes con el ideario y principios del IPN.",
    perfilEgreso:"El egresado de la Licenciatura de Ciencia de Datos será capaz de extraer conocimiento implícito y complejo, potencialmente útil (descubrimiento de patrones, desviaciones, anomalías, valores anómalos, situaciones interesantes, tendencias), a partir de grandes conjuntos de datos. Utiliza los métodos de la inteligencia artificial, aprendizaje de máquina, estadística y sistemas de bases de datos para la toma de decisiones de alta dirección, fundadas en los datos y modelos matemáticos sobre comportamientos probables, deseables e indeseables, participando en dinámicas de trabajo colaborativo e interdisciplinario con sentido ético y responsabilidad social.",
    atributos: "",
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

