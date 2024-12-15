      /*
      appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 61, 151, 253), // Azul principal
                  const Color.fromARGB(255, 17, 50, 100), // Azul brillante
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          toolbarHeight: 60, 
          leading: Padding(
                  padding: const EdgeInsets.only(left: 10), // Margen izquierdo
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Acción al presionar
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2), // Fondo translúcido
                        shape: BoxShape.circle, // Forma circular
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new, // Ícono personalizado
                        size: 24,
                        color: Colors.white, // Color del ícono
                      ),
                    ),
                  ),
                ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Mapa de ESCOM',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 3),
            ],
          ),
        ),
        */