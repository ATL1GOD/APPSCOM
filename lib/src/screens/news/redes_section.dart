import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RedesSection extends StatelessWidget {
  const RedesSection({super.key});

  // Método para abrir una URL
  Future<void> _openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'No se pudo abrir el enlace: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Síguenos en nuestras redes sociales para mantenerte informado de las últimas noticias y eventos de la ESCOM:',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 16.0),

        // Lista vertical de redes sociales
        Column(
          children: [
            _buildRedSocialItem(
              context,
              icon: Icons.facebook,
              color: const Color.fromARGB(255, 1, 124, 224),
              name: 'ESCOM IPN MX ',
              url: 'https://www.facebook.com/escomipnmx/',
            ),
            _buildRedSocialItem(
              context,
              icon: Icons.alternate_email,
              color: const Color.fromARGB(255, 0, 0, 0),
              name: 'Twitter',
              url: 'https://twitter.com/escomunidad/',
            ),
            _buildRedSocialItem(
              context,
              icon: Icons.facebook,
              color: const Color.fromARGB(255, 1, 124, 224),
              name: 'Becas ESCOM',
              url: 'https://www.facebook.com/BecasEscom/',
            ),
            _buildRedSocialItem(
              context,
              icon: Icons.facebook,
              color: const Color.fromARGB(255, 1, 124, 224),
              name: 'Bolsa de Trabajo ESCOM',
              url: 'https://www.facebook.com/bolsaescom/',
            ),
          ],
        ),
      ],
    );
  }

  // Widget para cada red social
  Widget _buildRedSocialItem(
    BuildContext context, {
    required IconData icon,
    required Color color,
    required String name,
    required String url,
  }) {
    return GestureDetector(
      onTap: () => _openUrl(url),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(icon, color: color, size: 32.0),
            const SizedBox(width: 16.0),
            Text(
              name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}