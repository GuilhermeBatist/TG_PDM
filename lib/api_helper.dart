import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<String>> fetchAutocomplete(String query) async {
  final response = await http.get('https://api.scryfall.com/cards/autocomplete?q=$query' as Uri);

  if (response.statusCode == 200) {
    // Parse a resposta JSON
    final List<dynamic> data = json.decode(response.body);
    // Retorne a lista de resultados de autocomplete
    return List<String>.from(data);
  } else {
    // Se a requisição falhar, lança uma exceção
    throw Exception('Falha na requisição');
  }
}

class AutocompleteWidget extends StatefulWidget {
  @override
  _AutocompleteWidgetState createState() => _AutocompleteWidgetState();
}

class _AutocompleteWidgetState extends State<AutocompleteWidget> {
  final TextEditingController _controller = TextEditingController();
  List<String> _autocompleteResults = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          onChanged: (value) async {
            // Faça a chamada da função de autocomplete ao digitar
            List<String> results = await fetchAutocomplete(value);
            setState(() {
              _autocompleteResults = results;
            });
          },
          decoration: InputDecoration(labelText: 'Digite algo'),
        ),
        SizedBox(height: 10),
        // Exiba os resultados de autocomplete
        Expanded(
          child: ListView.builder(
            itemCount: _autocompleteResults.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_autocompleteResults[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}