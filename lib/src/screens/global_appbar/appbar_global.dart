import 'package:flutter/material.dart';

class AppBarGlobal extends StatelessWidget {
  final String? title;
  final String? backgroundImage;
  final Widget? leadingIcon;
  final Widget? centerContent;
  final List<Widget>? actions;

  const AppBarGlobal({
    super.key,
    this.title,
    this.backgroundImage,
    this.leadingIcon,
    this.centerContent,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      expandedHeight: size.height * 0.4,
      leading: leadingIcon ??
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: IconButton(
              icon: const Icon(Icons.chevron_left, size: 30),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
      leadingWidth: 40,
      actions: actions,
      iconTheme: const IconThemeData(color: Colors.white),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            // Fondo de imagen con gradiente
            Positioned.fill(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (backgroundImage != null)
                    Image.asset(
                      backgroundImage!,
                      fit: BoxFit.cover,
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
            // Título en la parte superior derecha
            if (title != null)
              Positioned(
                top: 40,
                right: 20,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 226, 230, 234),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title!,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 4, 46, 130),
                      ),
                    ),
                  ),
                ),
              ),
            // Contenido centrado
            /*if (centerContent != null)
              Align(
                alignment: Alignment.center,
                child: centerContent,
              ),*/
          ],
        ),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
      ),
      // Barra de navegación inferior con gradiente blanco
      pinned: true,
      /*bottom: const PreferredSize(
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
      ),*/
    );
  }
}
