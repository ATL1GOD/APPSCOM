import 'package:flutter/material.dart';
import 'carreras_item.dart';
import 'app_bar.dart';

class IngSistemas extends StatelessWidget {
  final CarreraItem carreraItem;

  const IngSistemas({super.key, required this.carreraItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CarreraAppBar(index: 0), 
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









/*import 'package:flutter/material.dart';
import 'carreras_item.dart';

class IngSistemas extends StatelessWidget {
  final CarreraItem carreraItem;

  const IngSistemas({super.key, required this.carreraItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carreraItem.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Objetivo:",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8.0),
              Text(carreraItem.objectivo,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16.0),
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
    );
  }
}
*/