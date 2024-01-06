import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'api_helper_cardname.dart';
import 'api_helper_setname.dart';
import 'db_helper.dart';
import 'json_helper.dart';
import 'mtg_card.dart';

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
  late MtgCard carta;
  late  List<Map<String, dynamic>> results;

  List<String> _autocompleteResultsCN = [];
  List<String> _autocompleteResultsSet = [];

  @override
  Widget build(BuildContext context) {
    String name;
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
                List<String> results = await fetchAutocompleteCardName(nameController.text);
                setState(() {
                  _autocompleteResultsCN = results;
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
                itemCount: _autocompleteResultsCN.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_autocompleteResultsCN[index]),
                    onTap: () {
                      // Atualiza o campo de texto com o item selecionado
                      setState(() {
                        nameController.text = _autocompleteResultsCN[index];
                        _autocompleteResultsCN = []; // Limpa os resultados
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
              onChanged: (value) async {
                // Chama a função de autocomplete ao digitar
                List<String> results = await fetchSetNames(nameController.text);
                setState(() {
                  _autocompleteResultsSet = results;
                });
              },
              decoration: InputDecoration(labelText: 'Nome do Set'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _autocompleteResultsSet.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_autocompleteResultsSet[index]),
                    onTap: () {
                      // Atualiza o campo de texto com o item selecionado
                      setState(() {
                        nameController.text = _autocompleteResultsSet[index];
                        _autocompleteResultsSet = []; // Limpa os resultados
                      });
                    },
                  );
                },
              ),
            ),
            TextField(
              controller: qttController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Quantidade'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async => {
                results = await CardSearch.searchCards(nameController.text, setnameController.text),
                if(results.isNotEmpty)
                  carta = MtgCard(
                      id: results[0]['id'],
                      name: nameController.text,
                      set_name: setnameController.text,
                      qtt: int.parse(qttController.text),
                      imgURI: results[0]['normal']
                  ),
                  widget.helper.inserirCarta(carta),


              },
              child: Text('Adicionar Carta'),
            ),
          ],
        ),
      ),
    );
  }
}

class ExtractedCardInfo {
  final String id;
  final String name;
  final String set_name;
  final String normal;

  ExtractedCardInfo({
    required this.id,
    required this.name,
    required this.set_name,
    required this.normal,
  });

  factory ExtractedCardInfo.fromJson(Map<String, dynamic> json) {
    return ExtractedCardInfo(
      id: json['id'],
      name: json['name'],
      set_name: json['set_name'],
      normal: json['image_uris']['normal'], // Assumindo que a chave 'normal' está em 'image_uris'
    );
  }
}