import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'constants.dart';
import 'package:appscom/src/screens/perfil/perfil_detalles.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String boleta = '';
  String curp = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa tu número de boleta';
              }
              if (value.length != 10) {
                return 'El número de boleta debe tener 10 dígitos';
              }
              return null;
            },
            onSaved: (value) {
              boleta = value!.trim();
            },
            decoration: const InputDecoration(
              hintText: "Ingresa tu número de boleta",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa tu CURP';
                }
                if (value.length != 18) {
                  return 'El CURP debe tener 18 caracteres';
                }
                return null;
              },
              onSaved: (value) {
                curp = value!.trim();
              },
              decoration: const InputDecoration(
                hintText: "Ingresa tu CURP",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: () => _submitForm(context),
            child: Text(
              "Entrar".toUpperCase(),
              
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      login(boleta, curp);
    }
  }

  Future<void> login(String boleta, String curp) async {
  try {
    // Convierte boleta a número
    final int? boletaNumerica = int.tryParse(boleta);
    if (boletaNumerica == null) {
      // Si la conversión falla, muestra un error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("El número de boleta debe ser un valor numérico válido")),
      );
      return;
    }

    final querySnapshot = await FirebaseFirestore.instance
        .collection('Alumno')
        .where('boleta', isEqualTo: boletaNumerica) // Comparación numérica
        .where('curp', isEqualTo: curp) // Comparación de CURP
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final userData = querySnapshot.docs.first.data();
      print("Datos del usuario encontrado: $userData"); // Depuración

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Bienvenido, ${userData['nombre']}")),
        );
      }
        if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PerfilUsuario(nombre: userData['nombre']),
          ),
        );
      }
    } else {
      print("No se encontraron coincidencias para $boletaNumerica y $curp"); // Depuración

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Credenciales incorrectas")),
        );
      }
    }
  } catch (e) {
    print("Error al consultar Firebase: $e"); // Depuración

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al iniciar sesión: $e")),
      );
    }
  }
}


}
