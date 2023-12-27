import 'package:flutter/material.dart';
import 'db_helper.dart';

import 'inserir_carta.dart';
import 'remover_carta.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Coleção de Cartas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Adicione a lógica para mostrar a coleção aqui
                print('Mostrar Coleção');
              },
              child: Text('Mostrar Coleção'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                db_helper dbHelper = db_helper();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>
                        InserirCarta(helper: dbHelper,)));
                print('Adicionar Carta');
              },
              child: Text('Adicionar Carta'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                db_helper dbHelper = db_helper();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>
                        RemoverCarta(helper: dbHelper,)));
                print('Remover Carta');
              },
              child: Text('Remover Carta'),
            ),
          ],
        ),
      ),
    );
  }
}