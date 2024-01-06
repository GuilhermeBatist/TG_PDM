import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AutocompleteWidgetName extends StatefulWidget {
  @override
  _AutocompleteWidgetStateSetName createState() => _AutocompleteWidgetStateSetName();
}

Future<List<String>> fetchAutocomplete(String query) async {
  final response = await http.get(Uri.parse('https://api.scryfall.com/cards/autocomplete?q=$query'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final List<dynamic>  suggeestions = data['data'];
    return List<String>.from(suggeestions);
  } else {
    throw Exception('Failed to fetch autocomplete data');
  }
}

class _AutocompleteWidgetStateSetName extends State<AutocompleteWidgetName> {
  final TextEditingController _controller = TextEditingController();
  List<String> _autocompleteResults = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          onChanged: (value) async {
            List<String> results = await fetchAutocomplete(value);
            setState(() {
              _autocompleteResults = results;
            });
          },
          decoration: InputDecoration(labelText: 'Enter something'),
        ),
        SizedBox(height: 10),
        if (_autocompleteResults.isNotEmpty)
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: ListView.builder(
              itemCount: _autocompleteResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_autocompleteResults[index]),
                  onTap: () {
                    setState(() {
                      _controller.text = _autocompleteResults[index];
                      _autocompleteResults.clear();
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
  final response = await http.get(Uri.parse('https://api.scryfall.com/cards/named?exact=$cardName'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> cardData = json.decode(response.body);

    // Check if the card is found
    if (cardData['object'] == 'card') {
      final List<dynamic> sets = cardData['prints'];
      return List<String>.from(sets.map((set) => set['set_name']));
    } else {
      throw Exception('Card not found');
    }
  } else {
    throw Exception('Failed to fetch set names');
  }
}