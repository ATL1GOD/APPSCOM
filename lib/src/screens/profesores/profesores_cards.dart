import 'package:flutter/material.dart';
import 'contact.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
   // required this.borderColor,
    required this.contact,
    this.gradient,
  });

  //final Color borderColor;
  final Contact contact;
  final LinearGradient? gradient;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: contact.nombre, 
      child: Material(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //-----------------------------
            // Card Tab
            //-----------------------------
            Align(
              heightFactor: .9,
              alignment: Alignment.centerLeft,
              child: Container(
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                //  color: borderColor,
                  gradient: gradient, // Gradiente de colores
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                ),
                child: const Icon(
                  Icons.work_history,
                  color: Colors.white,
                ),
              ),
            ),
            //-----------------------------
            // Card Body
            //-----------------------------
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  //color: borderColor,
                  gradient: gradient, 
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                //-----------------------------
                // Card Body
                //-----------------------------
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const SizedBox(height: 5),
                      
                      Row(
                        children: [
                          const Icon(
                            Icons.person,
                            size: 40,
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Text.rich(
                              TextSpan(
                                text: '${contact.role}  (${contact.empleado})',
                                children: [
                                  TextSpan(
                                    text: '\n${contact.nombre}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 28),

                      Row(
                        children: [
                          const Icon(
                            Icons.maps_home_work,
                            size: 40,
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child:Text(
                            contact.academia,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                             softWrap: true,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 28),
                      
                      Row(
                        children: [
                          const Icon(
                            Icons.laptop,
                            size: 40,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Cubiculo: ${contact.aula}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        ],
                      ),
                      
                      const SizedBox(height: 28),
                      
                      Row(
                        children: [
                          const Icon(
                            Icons.email,
                            size: 40,
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    contact.email,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 12, 49, 119),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      
                      const SizedBox(height: 28),
                      
                      Row(
                        children: [
                          const Icon(
                            Icons.schedule,
                            size: 40,
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    "Horario:",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      
                      const SizedBox(height: 28),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround, // Espaciado entre columnas
                        children: [
                          // Columna 1 (Días de la semana)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Lunes", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              SizedBox(height: 10),
                              Text("Martes", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              SizedBox(height: 10),
                              Text("Miércoles", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              SizedBox(height: 10),
                              Text("Jueves", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              SizedBox(height: 10),
                              Text("Viernes", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          // Columna 2 (Horarios)
                          Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(contact.lunes, style: TextStyle(fontSize: 16)),
                           SizedBox(height: 10),
                           Text(contact.martes, style: TextStyle(fontSize: 16)),
                           SizedBox(height: 10),
                           Text(contact.miercoles, style: TextStyle(fontSize: 16)),
                           SizedBox(height: 10),
                           Text(contact.jueves, style: TextStyle(fontSize: 16)),
                           SizedBox(height: 10),
                           Text(contact.viernes, style: TextStyle(fontSize: 16)),
                         ],
                        ),
                        ],
                      ),
                    ],
                  ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
