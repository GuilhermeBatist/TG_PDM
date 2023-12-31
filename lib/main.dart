import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tg_v1/db_helper.dart';
import 'home_page.dart';
import 'json_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //await onFirstRun();
  runApp(MaterialApp(home: MyApp(ajudante : DbHelper(),)));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key,required this.ajudante});

  final DbHelper ajudante;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState(){
    super.initState();
    widget.ajudante.createDB();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'As minhas Cartas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Minha Coleção de Cartas',
      home: HomePage(),
    );
  }
}
