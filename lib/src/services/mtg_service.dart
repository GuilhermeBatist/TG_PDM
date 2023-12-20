import 'package:dio/dio.dart';
import 'package:tg_v1/src/models/mtg_card.dart';

class MtgService{

  static const String baseUrl = "https://api.magicthegathering.io/v1"; //"https://api.scryfall.com";

  Future<dynamic> _get(String path,{int page = 1 })async{
    final url = "$baseUrl$path";
    final params = {'page': page};
    final response = await Dio().get(url, queryParameters: params);
    return response.data;
  }

  Future<List<MtGCard>> ListCards(int page) async {
    final data = await _get('/cards', page: page);
    return data['cards'].map<MtGCard>((c) => MtGCard.fromJson(c)).toList();
  }

  Future<MtGCard> retrieveCard(String id) async {
    final data = await _get('/cards/$id');
    return MtGCard.fromJson(data['card']);
  }

}