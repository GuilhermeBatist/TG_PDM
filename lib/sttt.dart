/*
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

Future<void> readAssetFile() async {
  try {
    final content = await rootBundle.loadString('rsc/default-cards-20231226100502.json');
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

    final url = 'https://data.scryfall.io/default-cards/default-cards-20231226100502.json';
    final fileName = 'default-cards/default-cards-20231226100502.json';

    await downloadFile(url, fileName);
    await readAssetFile();
    // Mark that the first run has occurred
    await prefs.setBool('isFirstRun', false);
  }
}



import mysql.connector

# Replace these values with your MySQL database credentials
db_config = {
    'host': '192.168.100.14',
    'user': 'User_BD_PL3_05',
    'password': 'diubi:2023!BD!PL3_05',
    'database': 'BD_PL3_05'
}

# Connect to the MySQL database
connection = mysql.connector.connect(**db_config)

# Create a cursor object
cursor = connection.cursor()

# Execute SQL commands
cursor.execute('''CREATE TABLE IF NOT EXISTS users (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255), age INT)''')
cursor.execute("INSERT INTO users (name, age) VALUES (%s, %s)", ('John Doe', 30))

# Commit the changes and close the connection
connection.commit()
connection.close()


*/



