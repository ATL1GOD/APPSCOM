import 'package:flutter/material.dart';
import 'carreras_item.dart';
import 'app_bar.dart';
class LicDatos extends StatelessWidget {
  final CarreraItem carreraItem;

  const LicDatos({super.key, required this.carreraItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CarreraAppBar(index: 2), 
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Objetivo:",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    carreraItem.objectivo,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontSize: 16.0),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    "Perfil de Ingreso:",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8.0),
                  Text(carreraItem.perfilIngreso),
                  const SizedBox(height: 16.0),
                  Text(
                    "Perfil de Egreso:",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8.0),
                  Text(carreraItem.perfilEgreso),
                  const SizedBox(height: 16.0),
                  Text(
                    "Campo Laboral:",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8.0),
                  Text(carreraItem.campoLaboral),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}

