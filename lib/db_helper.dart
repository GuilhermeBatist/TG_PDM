import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'api_helper_cardname.dart';
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
      'CREATE TABLE cartas(id TEXT PRIMARY KEY,name TEXT, qtt INTEGER,set_name TEXT)'
    );
  }
  //imgURI TEXT
  Future<void> inserirCarta(MtgCard carta) async {
    final dataBase = await _db;
    await _db.insert('card', carta.mapear());
  }

  Future<int> getQuantidadeCarta(String nomeCarta) async {

    List<Map<String, dynamic>> result = await _db.query(
      'mtg_cards',
      columns: ['qtt'],
      where: 'name = ?',
      whereArgs: [nomeCarta],
    );

    if (result.isNotEmpty) {
      return result.first['qtt'] as int;
    } else {
      return 0;
    }
  }

  Future<void> removerCarta(String nomeCarta) async {

    await _db.delete(
      'mtg_cards',
      where: 'name = ?',
      whereArgs: [nomeCarta],
    );
  }
}

