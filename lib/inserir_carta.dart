import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'api_helper.dart';
import 'db_helper.dart';

class InserirCarta extends StatefulWidget {
  const InserirCarta({Key? key, required this.helper}) : super(key: key);

  final db_helper helper;

  @override
  State<InserirCarta> createState() => _InserirCartaState();
}

class _InserirCartaState extends State<InserirCarta> {
  final nameController = TextEditingController();
  final setnameController = TextEditingController();
  final qttController = TextEditingController();

  List<String> _autocompleteResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inserir Carta"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campo de Texto com Autocomplete
            TextField(
              controller: nameController,
              onChanged: (value) async {
                // Chama a função de autocomplete ao digitar
                List<String> results = await fetchAutocomplete(value);
                setState(() {
                  _autocompleteResults = results;
                });
              },
              decoration: InputDecoration(
                labelText: 'Nome da Carta',
                hintText: 'Digite o nome da carta',
              ),
            ),
            SizedBox(height: 16),
            // Lista de Resultados de Autocomplete
            Expanded(
              child: ListView.builder(
                itemCount: _autocompleteResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_autocompleteResults[index]),
                    onTap: () {
                      // Atualiza o campo de texto com o item selecionado
                      setState(() {
                        nameController.text = _autocompleteResults[index];
                        _autocompleteResults = []; // Limpa os resultados
                      });
                    },
                  );
                },
              ),
            ),
            // Outros Campos e Botão de Submissão
            SizedBox(height: 16),
            TextField(
              controller: setnameController,
              decoration: InputDecoration(labelText: 'Nome do Set'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: qttController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Quantidade'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Lógica para adicionar a carta ao banco de dados
                // Utilize widget.helper para acessar a instância de DbHelper
                // e adicione a lógica de inserção aqui
              },
              child: Text('Adicionar Carta'),
            ),
          ],
        ),
      ),
    );
  }
}


