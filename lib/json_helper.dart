import 'dart:convert';
import 'package:flutter/services.dart';


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
  class CardSearch {
    static Future<List<Map<String, dynamic>>> searchCards(
      String searchName, String searchSetName) async {
    // Caminho para o arquivo JSON dentro da pasta 'assets'
      String jsonPath = 'assets/cards.json'; // Substitua pelo caminho real

    // Lê o conteúdo do arquivo JSON usando rootBundle
    String jsonString = await rootBundle.loadString(jsonPath);

    // Converte o JSON em uma lista de mapas
    List<Map<String, dynamic>> cards =
    List<Map<String, dynamic>>.from(json.decode(jsonString));

    // Lista para armazenar resultados da pesquisa
    List<Map<String, dynamic>> searchResults = [];

    // Itera sobre os objetos no JSON e verifica as condições de pesquisa
    for (var card in cards) {
      if (card['name'] == searchName && card['set_name'] == searchSetName) {
        searchResults.add(card);
      }
    }

    return searchResults;
  }
}