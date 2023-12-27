import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'api_helper.dart';
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

class InserirCarta extends StatefulWidget {
  const InserirCarta({Key? key, required this.helper}) : super(key: key);

  final DbHelper helper;

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
              decoration: InputDecoration(labelText: 'Nome do Conjunto'),
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

class DbHelper {
  // Implemente sua lógica do banco de dados aqui
  // ...

  // Exemplo de método de autocomplete (pode variar dependendo do seu banco de dados)
  Future<List<String>> fetchAutocomplete(String query) async {
    // Lógica para recuperar resultados de autocomplete do banco de dados
    // ...

    // Retorne uma lista de resultados
    return [];
  }
}
