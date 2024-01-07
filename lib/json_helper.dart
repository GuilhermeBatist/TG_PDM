import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;


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
    // URL da API do Scryfall para buscar cartas por nome
    String apiUrl = 'https://api.scryfall.com/cards/search';

    // Parâmetros de pesquisa
    String queryString = 'q=$searchName set:$searchSetName';

    // Monta a URL final
    String fullUrl = '$apiUrl?$queryString';

    // Faz a solicitação HTTP para a API do Scryfall
    var response = await http.get(Uri.parse(fullUrl));

    // Lista para armazenar resultados da pesquisa
    List<Map<String, dynamic>> searchResults = [];

    // Verifica se a solicitação foi bem-sucedida (código de status 200)
    if (response.statusCode == 200) {
      // Converte a resposta JSON em um mapa
      Map<String, dynamic> data = json.decode(response.body);

      // Obtém a lista de cartas a partir do mapa
      List<Map<String, dynamic>> cards = List<Map<String, dynamic>>.from(data['data']);

      // Itera sobre os objetos no JSON e verifica as condições de pesquisa
      for (var card in cards) {
        searchResults.add(card);
      }
    } else {
      // Se a solicitação não foi bem-sucedida, você pode lidar com isso conforme necessário
      print('Erro na solicitação: ${response.statusCode}');
    }

    return searchResults;
  }
}