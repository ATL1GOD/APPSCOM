import 'package:flutter/material.dart';
import 'package:appscom/src/screens/bottons/carreras/carrera_icon.dart';
import 'maestria_item.dart';

class MaestriaAppbar extends StatefulWidget {
  final int index;
  const MaestriaAppbar({super.key, required this.index});

  @override
  State<MaestriaAppbar> createState() => _MaestriaAppbarState();
}

class _MaestriaAppbarState extends State<MaestriaAppbar> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      expandedHeight: size.height * 0.3,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: AppBarIcon(
          icon: Icons.chevron_left,
          iconSize: 30,
          onTap: () => Navigator.of(context).pop(),
        ),
      ),
      leadingWidth: 40,
      iconTheme: const IconThemeData(color: Colors.white),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
          Positioned.fill(
            child: Stack(
              fit: StackFit.expand, // Esto hace que la imagen ocupe todo el espacio
              children: [
                Image.asset(
                 principalesMaestrias[widget.index].imagenasset,
                  fit: BoxFit.cover, // Ajuste de la imagen hace que la imagen cubra todo el espacio
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ],
            ),
          ),

             Positioned(
              bottom: 50,
              left: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 10, 83, 167), // pusimos primary
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding( //esto hace que el texto de la categoria se vea mejor en la imagen 
                      padding: const EdgeInsets.only(left: 15.0, top: 8.0, right: 15.0, bottom:8.0),
                      child: Text(
                        principalesMaestrias[widget.index].maestria,//cambiamos la categoria por carrera
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  SizedBox(
                    width: size.width * 0.9, 
                    child: Text(
                      principalesMaestrias[widget.index].title,
                      textAlign: TextAlign.left,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                      maxLines: 3,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                ],
              ),
            ),
          ],
        ),
        stretchModes: const [ 
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
      ),
      pinned: true,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: SizedBox(
          height: 30,
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(36.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
      
           