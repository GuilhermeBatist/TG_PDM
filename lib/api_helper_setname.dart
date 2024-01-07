import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AutocompleteWidgetName extends StatefulWidget {
  @override
  _AutocompleteWidgetStateSetName createState() => _AutocompleteWidgetStateSetName();
}

class _AutocompleteWidgetStateSetName extends State<AutocompleteWidgetName> {
  final TextEditingController _controller = TextEditingController();
  List<String> _autocompleteResultsSet = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          onChanged: (value) async {
            List<String> results = await fetchSetNames(value);
            setState(() {
              _autocompleteResultsSet = results;
            });
          },
          decoration: InputDecoration(labelText: 'Enter something'),
        ),
        SizedBox(height: 10),
        if (_autocompleteResultsSet.isNotEmpty)
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: ListView.builder(
              itemCount: _autocompleteResultsSet.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_autocompleteResultsSet[index]),
                  onTap: () {
                    setState(() {
                      _controller.text = _autocompleteResultsSet[index];
                      _autocompleteResultsSet.clear();
                    });
                  },
                );
              },
            ),
          ),
      ],
    );
  }

}

Future<List<String>> fetchSetNames(String cardName) async {
  String base = 'https://api.scryfall.com/cards/search?order=cmc&q=%21';
  final encodedCardName = Uri.encodeComponent(cardName);
  print(encodedCardName);
  final response = await http.get(
    Uri.parse('$base"$encodedCardName"++include%3Aextras&unique=prints'),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);

    // Verifica se a chave 'prints' está presente na resposta
    if (data.containsKey('prints')) {
      final List<dynamic> printings = data['prints'];

      // Mapeia as informações do conjunto para 'set_name'
      return List<String>.from(printings.map((printing) => printing['set_name']));
    } else {
      // Caso 'prints' não esteja presente na resposta
      print('No information about sets found for the given card.');
      return [];
    }
  } else {
    // Handle error
    print('Failed to load set names');
    return [];
  }
}



/*  Future<List<String>> fetchSetNames(String cardName) async {
    String base ='https://api.scryfall.com/cards/named?exact=';
    final response = await http.get(
      Uri.parse('https://api.scryfall.com/cards/named?exact=$cardName'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      // Verifica se a chave 'prints' está presente na resposta
      if (data.containsKey('prints')) {
        final List<dynamic> printings = data['prints'];

        // Mapeia as informações do conjunto para 'set_name'
        return List<String>.from(printings.map((printing) => printing['set_name']));
      } else {
        // Caso 'prints' não esteja presente na resposta
        print('No information about sets found for the given card.');
        return [];
      }
    } else {
      // Handle error
      print('Failed to load set names');
      return [];
    }
  }*/