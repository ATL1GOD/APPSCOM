import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:async';
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';

class PDFScreen extends StatefulWidget {
  final String pdfAsset; // Ruta del archivo PDF en los assets

  const PDFScreen({super.key, required this.pdfAsset});

  @override
  // ignore: library_private_types_in_public_api
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  final Completer<PDFViewController> _controller = Completer<PDFViewController>();
  int pages = 0;
  bool isReady = false;
  String? localPath;

  @override
  void initState() {
    super.initState();
    _loadPdfFromAssets();
  }

  Future<void> _loadPdfFromAssets() async {
    try {
      // Carga el archivo PDF desde los assets y guárdalo en el almacenamiento temporal
      final byteData = await rootBundle.load(widget.pdfAsset);
      final file = File('${(await getTemporaryDirectory()).path}/temp.pdf');
      await file.writeAsBytes(byteData.buffer.asUint8List(), flush: true);

      setState(() {
        localPath = file.path;
      });
    } catch (e) {
      print('Error al cargar el PDF: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visualizador de PDF'),
      ),
      body: localPath == null
          ? const Center(child: CircularProgressIndicator()) // Muestra un loader mientras se carga el PDF
          : PDFView(
              filePath: localPath,
              enableSwipe: true,
              swipeHorizontal: true,
              autoSpacing: true,
              pageFling: true,
              backgroundColor: Colors.grey,
              fitPolicy: FitPolicy.BOTH, // Permite zoom y ajusta el PDF a la pantalla
              onRender: (_pages) {
                setState(() {
                  pages = _pages ?? 0;
                  isReady = true;
                });
              },
              onError: (error) {
                print('Error al renderizar el PDF: ${error.toString()}');
              },
              onPageError: (page, error) {
                print('Error en la página $page: ${error.toString()}');
              },
              onViewCreated: (PDFViewController pdfViewController) {
                _controller.complete(pdfViewController);
              },
              onPageChanged: (page, total) {
                print('Página actual: $page / Total: $total');
              },
            ),
    );
  }
}
