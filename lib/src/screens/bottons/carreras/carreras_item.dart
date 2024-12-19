import 'package:flutter/material.dart';
import 'package:appscom/src/screens/bottons/carreras/iia_screen.dart';
import 'package:appscom/src/screens/bottons/carreras/isc_screen.dart';
import 'package:appscom/src/screens/bottons/carreras/lcd_screen.dart';
import 'package:appscom/src/screens/bottons/carreras/isa_screen.dart';

//nokmbres de las carreras
class Carrera {
  final String title, description;
  final IconData icon;
  final Color bgColor;
  final Color textColor;
  final String carrera;
  final String imgenpath;
  final Widget destinationScreen;
  

  Carrera({
    required this.title,
    this.description = '',
    required this.icon,
    this.bgColor = const Color.fromARGB(255, 71, 138, 231),
    this.textColor = const Color.fromARGB(255, 0, 0, 0),
    this.imgenpath = "",
    this.carrera = "",
    required this.destinationScreen,
  });
}
 //ItemCarreraItem de cada carrera
class CarreraItem{
  final int id;
  final String title;
  final String objectivo;
  final String perfilIngreso;
  final String perfilEgreso;
  final String atributos;
  final String campoLaboral;

  CarreraItem({
    required this.id,
    required this.title,
    required this.objectivo,
    required this.perfilIngreso,
    required this.perfilEgreso,
    required this.atributos,
    required this.campoLaboral,
  });

CarreraItem copyWith({
    int? id,
    String? title,
    String? objectivo,
    String? perfilIngreso,
    String? perfilEgreso,
    String? atributos,
    String? campoLaboral
  }) {
  return CarreraItem(
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

//lista de ItemCarreraItem de cada carrera 
final List<CarreraItem> principalesCarreraItems= [
  CarreraItem(
    id: 0,
    title: "Ingeniería en Sistemas Computacionales", 
    objectivo:"Formar ingenieros en sistemas computacionales de sólida preparación científica y tecnológica en los ámbitos del desarrollo de software y hardware, que propongan, analicen, diseñen, desarrollen, implementen y gestionen sistemas computacionales a partir de tecnologías de vanguardia y metodologías, normas y estándares nacionales e internacionales de calidad; líderes de equipos de trabajo multidisciplinarios y multiculturales, con un alto sentido ético y de responsabilidad.",
    perfilIngreso:"Los aspirantes a estudiar este programa deberán tener conocimientos en matemáticas, física e informática. Es también conveniente que posea conocimientos de inglés. Así mismo, deberán contar con habilidades como análisis y síntesis de información, razonamiento lógico y expresión oral y escrita. Así como actitudes de respeto y responsabilidad.",
    perfilEgreso:"El egresado del programa académico de Ingeniería en Sistemas Computacionales podrá desempeñarse en equipos multidisciplinarios e interdisciplinarios en los ámbitos del desarrollo de software y hardware, sustentando su actuación profesional en valores éticos y de responsabilidad social, con un enfoque de liderazgo y sostenibilidad en los sectores público y privado.",
    atributos: "Los atributos de egreso son un conjunto de resultados evaluables individualmente, que conforman los componentes indicativos del potencial de un egresado para adquirir las competencias o capacidades para ejercer la práctica de la ingeniería a un nivel apropiado.",
    campoLaboral: "El campo profesional en el que se desarrollan los egresados de este Programa Académico es muy amplio, se localiza en los sectores público y privado; en consultorías, en empresas del sector financiero, comercial, de servicios o bien en aquellas dedicadas a la innovación, en entidades federales, estatales, así como pequeño empresario creando empresas emergentes (startups).", 
  ),
  CarreraItem(
    id: 1,
    title: "Ingeniería en Inteligencia Artificial",  
    objectivo:"Formar expertos capaces de desarrollar sistemas inteligentes utilizando diferentes metodologías en las diferentes etapas de desarrollo y aplicando algoritmos en áreas como aprendizaje de máquina, procesamiento automático de lenguaje natural, visión artificial y modelos bioinspirados para atender las necesidades de los diferentes sectores de la sociedad a través de la generación de procesos y soluciones innovadoras.",
    perfilIngreso:"Los estudiantes que ingresen al Instituto Politécnico Nacional, en cualquiera de sus programas y niveles, deberán contar con los conocimientos y las habilidades básicas que garanticen un adecuado desempeño en el nivel al que solicitan su ingreso. Asimismo, deberán contar con las actitudes y valores necesarios para responsabilizarse de su proceso formativo y asumir una posición activa frente al estudio y al desarrollo de los proyectos y trabajos requeridos, coincidentes con el ideario y principios del IPN.",
    perfilEgreso:"El egresado de la Ingeniería en Inteligencia Artificial se desempeñará colaborativamente en equipos multidisciplinarios en el análisis, diseño, implementación, validación, implantación, supervisión y gestión de sistemas inteligentes, aplicando algoritmos en áreas como aprendizaje de máquina, procesamiento automático de lenguaje natural, visión artificial y modelos bioinspirados; ejerciendo su profesión con liderazgo, ética y responsabilidad social.",
    atributos: "",
    campoLaboral: "Este profesional podrá desempeñarse en el desarrollo y aplicación de la Inteligencia Artificial, en los ámbitos público y privado, en campos ocupacionales como los que se enlistan a continuación:", 
  ),
  CarreraItem(
    id: 2,
    title: "Licenciatura en Ciencia de Datos",
    objectivo:"Formar expertos capaces de extraer conocimiento implícito y complejo, potencialmente útil a partir de grandes conjuntos de datos, utilizando métodos de inteligencia artificial, aprendizaje de máquina, estadística, sistemas de bases de datos y modelos matemáticos sobre comportamientos probables, para apoyar la toma de decisiones de alta dirección.",
    perfilIngreso:"Los estudiantes que ingresen al Instituto Politécnico Nacional, en cualquiera de sus programas y niveles, deberán contar con los conocimientos y las habilidades básicas que garanticen un adecuado desempeño en el nivel al que solicitan su ingreso. Asimismo, deberán contar con las actitudes y valores necesarios para responsabilizarse de su proceso formativo y asumir una posición activa frente al estudio y al desarrollo de los proyectos y trabajos requeridos, coincidentes con el ideario y principios del IPN.",
    perfilEgreso:"El egresado de la Licenciatura de Ciencia de Datos será capaz de extraer conocimiento implícito y complejo, potencialmente útil (descubrimiento de patrones, desviaciones, anomalías, valores anómalos, situaciones interesantes, tendencias), a partir de grandes conjuntos de datos. Utiliza los métodos de la inteligencia artificial, aprendizaje de máquina, estadística y sistemas de bases de datos para la toma de decisiones de alta dirección, fundadas en los datos y modelos matemáticos sobre comportamientos probables, deseables e indeseables, participando en dinámicas de trabajo colaborativo e interdisciplinario con sentido ético y responsabilidad social.",
    atributos: "",
    campoLaboral: "Este profesional podrá desempeñarse en los ámbitos público y privado en campos ocupacionales como los que se enlistan a continuación:", 
  ),
  CarreraItem(
    id: 0,
    title: "Ingeniería en Sistemas Computacionales", 
    objectivo:"Preparar ingenieros altamente especializados para atender las necesidades en ingeniería automotriz y de autopartes en sus Áreas de: manufactura, diseño, automatización, procesos, sistemas inteligentes, protección ambiental, administración e innovación tecnológica.",
    perfilIngreso:"El aspirante a estudiar la Carrera de Ingeniería en Sistemas Automotrices deberá haber egresado de cualquier institución pública o privada en el nivel medio superior o equivalente, dentro de alguna de las especialidades o área afines a las ciencias físico matemáticas, ello contribuirá al mejor equilibrio del conocimiento al ingreso. Aprobar el examen de admisión que el Instituto Politécnico Nacional establezca para este fin y atender los requerimientos de la convocatoria.",
    perfilEgreso:"Es un profesionista que aplica conocimientos de la matemática, las ciencias naturales, las ciencias sociales, humanísticas y administrativas que ha adquirido a través del estudio, la experiencia y la práctica, al desarrollo de actividades tales como: Participación, en programas de investigación, desarrollo tecnológico e ingenieróa experimental",
    atributos: "",
    campoLaboral: "El egresado de la carrera de Ingeniería en Sistemas Automotrices cuenta con una formación altamente especializada y multidisciplinaria que le permite desempeñarse profesionalmente en el Sector Automotriz y de Autopartes con una alta eficiencia, en cualquiera de las áreas siguientes: Diseño de Vehículos y sus Componentes, Manufactura de Autopartes, Control de Calidad.", 
  ),
];



//lista de carreras para la pantalla de inicio botones  
  final List<Carrera> principalesCarreras = [
  Carrera(
    title: "Ingeniería en Sistemas Computacionales",  
    carrera: "ISC",
    icon: Icons.laptop_windows_outlined,
    imgenpath: "assets/png/carreras/carrera1.png",
    destinationScreen: IngSistemas(carreraItem: principalesCarreraItems[0]), 
  ),
  Carrera(
    title: "Ingeniería en Inteligencia Artificial",  
    carrera: "IIA",
    icon: Icons.precision_manufacturing_sharp,
    imgenpath: "assets/png/carreras/carrera4.png",
    destinationScreen: IngArtificial(carreraItem: principalesCarreraItems[1]), 
  ),
  Carrera(
    title: "Licenciatura en Ciencia de Datos",
    carrera: "LCD",
    icon: Icons.psychology_rounded,
    imgenpath: "assets/png/carreras/carrera9.png",
    destinationScreen: LicDatos(carreraItem: principalesCarreraItems[2],), 
  ),
  Carrera(
    title: "Ingeniería en Sistemas Automotrices",
    carrera: "ISA",
    icon: Icons.directions_car,
    imgenpath: "assets/png/carreras/carrera11.png",
    destinationScreen: IngAutomotriz(carreraItem: principalesCarreraItems[3],), 
  ),
];

