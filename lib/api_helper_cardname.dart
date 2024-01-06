import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AutocompleteWidgetName extends StatefulWidget {
  @override
  _AutocompleteWidgetStateCardName createState() => _AutocompleteWidgetStateCardName();
}

class _AutocompleteWidgetStateCardName extends State<AutocompleteWidgetName> {
  final TextEditingController _controller = TextEditingController();
  List<String> _autocompleteResultsCN = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          onChanged: (value) async {
            List<String> results = await fetchAutocompleteCardName(value);
            setState(() {
              _autocompleteResultsCN = results;
            });
          },
          decoration: InputDecoration(labelText: 'Enter something'),
        ),
        SizedBox(height: 10),
        if (_autocompleteResultsCN.isNotEmpty)
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: ListView.builder(
              itemCount: _autocompleteResultsCN.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_autocompleteResultsCN[index]),
                  onTap: () {
                    setState(() {
                      _controller.text = _autocompleteResultsCN[index];
                      _autocompleteResultsCN.clear();
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

Future<List<String>> fetchAutocompleteCardName(String query) async {
  final response = await http.get(Uri.parse('https://api.scryfall.com/cards/autocomplete?q=$query'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final List<dynamic>  suggeestions = data['data'];
    return List<String>.from(suggeestions);
  } else {
    throw Exception('Failed to fetch autocomplete data');
  }
}

