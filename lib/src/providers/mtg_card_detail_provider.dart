import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tg_v1/src/models/mtg_card.dart';
import 'package:tg_v1/src/services/mtg_service.dart';

final mtgCardDetailProvider = FutureProvider.family<MtGCard, String>((ref, String id) async{
  return MtgService().retrieveCard(id);
});