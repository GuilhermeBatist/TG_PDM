import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'mtg_card.dart';


class db_helper{
  final String nameDB = 'colect&build.bd';
  final int versionDB = 1;

  late Database _db;

  createDB()async{
    _db = await openDatabase(
      join(await getDatabasesPath(),nameDB),
      onCreate: createTables,
      version: 1
    );
  }

  Future createTables(Database bd,int versao) async{
    await bd.execute(
      'CREATE TABLE cartas(id TEXT PRIMARY KEY,name TEXT, qtt INTEGER,set_name TEXT,imgURI TEXT)'
    );
  }

  Future<void> inserirCarta(MtgCard carta) async {
    final dataBase = await _db;
    await _db.insert('card', carta.mapear());
  }
}

class inserirCarta extends StatefulWidget {
  const inserirCarta({super.key, required this.helper});

  final db_helper helper;

  @override
  State<inserirCarta> createState() => _inserirCartaState();
}

class _inserirCartaState extends State<inserirCarta> {

  late final String idcontroler;
  final nameController = TextEditingController();
  final setnameController = TextEditingController();
  final qttController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inserir Carta"),
      ),
    );
  }
}
