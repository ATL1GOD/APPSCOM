class Integrante {
  final String nombre;
  final String fotoAssets;
  final String profesion;
  final Map<String, String> redesSociales;

  Integrante({required this.nombre, required this.fotoAssets, required this.redesSociales, required this.profesion});
}

List<Integrante> integrante = [
  Integrante(
    nombre: "Atl Yosafat Cardoso Osorio",
    fotoAssets: "assets/png/equipo/integrante2.png",
    redesSociales: {
      "Github": "https://github.com/ATL1GOD",
    },
    profesion:  "Desarrollador de Software",
  ),
  Integrante(
    nombre: "Marian Kelly Guzman Mares",
    fotoAssets: "assets/png/equipo/integrante1.png",
    redesSociales: {
      "Github": "https://github.com/MarianGuzman1829",
    },
    profesion:  "Desarrolladora de Software",
  ),
  Integrante(
    nombre: "Jorge Daniel Hernandez\n                  Vazquez" ,
    fotoAssets: "assets/png/equipo/integrante3.png",
    redesSociales: {
      "Github": "https://github.com/Dxniel7",
    },
    profesion:  "Desarrollador de Software",
  ),
];
