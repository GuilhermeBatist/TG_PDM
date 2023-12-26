import 'package:flutter/material.dart';

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
                // Adicione a lógica para adicionar carta aqui
                print('Adicionar Carta');
              },
              child: Text('Adicionar Carta'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Adicione a lógica para remover carta aqui
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