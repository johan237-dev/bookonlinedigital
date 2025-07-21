import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';

class Pdfviewpage extends StatefulWidget {
  final File file;
  const Pdfviewpage({super.key, required this.file});

  @override
  State<Pdfviewpage> createState() => _PdfviewpageState();
}

class _PdfviewpageState extends State<Pdfviewpage> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);

    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Stack(
        children: [
          PDFView(
            filePath: widget.file.path,
            onRender: (_pages) {
              setState(() => isLoading = false);
            },
            onError: (error) {
              print("Erreur PDFView : $error");
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Erreur de lecture du PDF")),
              );
            },
          ),
          if (isLoading)
            const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}