import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class Pdfpage {
  static Future<File> loadPdfFromAsset(String assetPath) async {
    try {
      final byteData = await rootBundle.load(assetPath);
      final bytes = byteData.buffer.asUint8List();

      final filename = basename(assetPath);
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/$filename');

      await file.writeAsBytes(bytes, flush: true);
      return file;
    } catch (e) {
      throw Exception("Erreur lors du chargement du PDF depuis l'asset : $e");
    }
  }
}