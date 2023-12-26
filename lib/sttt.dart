import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

Future<void> readAssetFile() async {
  try {
    final content = await rootBundle.loadString('assets/rsc/bulkdata.json');
    print('File content: $content');
  } catch (e) {
    print('Error loading asset file: $e');
  }
}

Future<void> downloadFile(String url, String fileName) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final bytes = response.bodyBytes;
    final directory = 'rsc';
    final filePath = join(directory, 'rsc', fileName);
    final file = File(filePath);

    await file.writeAsBytes(bytes);
    print('File downloaded to: ${file.path}');
  } else {
    throw Exception('Failed to download file');
  }
}

Future<void> onFirstRun() async {
  final prefs = await SharedPreferences.getInstance();
  final isFirstRun = prefs.getBool('isFirstRun') ?? true;

  if (isFirstRun) {
    // Perform first-time tasks, such as downloading the file
    await readAssetFile();
    final url = 'https://data.scryfall.io/default-cards/default-cards-20231226100502.json';
    final fileName = 'bulkdata.json';

    await downloadFile(url, fileName);

    // Mark that the first run has occurred
    await prefs.setBool('isFirstRun', false);
  }
}




