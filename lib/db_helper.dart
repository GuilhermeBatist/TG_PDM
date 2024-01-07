import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'api_helper_cardname.dart';
import 'mtg_card.dart';


class DbHelper{
  final String nameDB = 'colect&build.bd';
  final int versionDB = 1;

  late Database _db;

  Future<void> createDB() async{
    _db = await openDatabase(
      join(await getDatabasesPath(),nameDB),
      onCreate: createTables,
      version: 1
    );
  }

  Future<void> createTables(Database bd,int versao) async{
    await bd.execute(
      'CREATE TABLE cartas(id TEXT PRIMARY KEY,name TEXT, qtt INTEGER,set_name TEXT, img_URI TEXT)'
    );
  }

  //imgURI TEXT
  Future<void> inserirCarta(MtgCard cartas) async {
    await createDB();
    final dataBase = _db;
    await dataBase.insert('cartas', cartas.mapear());
  }

  Future<int> getQuantidadeCarta(String nomeCarta) async {
    await createDB();
    final dataBase = _db;
    List<Map<String, dynamic>> result = await dataBase.query(
      'cartas',
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

  Future<void> removerCarta(String nomeCarta, String nomeSet) async {
    await createDB();
    final dataBase = _db;
    await dataBase.delete(
      'cartas',
      where: 'name = ? AND set_name = ?', // Adiciona a condição do set_name
      whereArgs: [nomeCarta, nomeSet],
    );
  }

  Future<void> atualizarCarta(String nomeCarta, String nomeSet, int qtt) async {
    await createDB();
    final dataBase = _db;
    await dataBase.rawUpdate('''
      UPDATE cartas
      SET qtt = ?,
      WHERE name = ? AND set_name = ?''',
     [qtt,nomeCarta, nomeSet]);
  }

  Future<List<Map<String, dynamic>>> getListaCompletaCartas() async {
    await createDB();
    final dataBase = _db;
    List<Map<String, dynamic>> cartas = await dataBase.query('cartas');
    return cartas;
  }
}

