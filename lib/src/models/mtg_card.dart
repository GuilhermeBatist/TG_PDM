import 'package:freezed_annotation/freezed_annotation.dart';

part 'mtg_card.freezed.dart';
part 'mtg_card.g.dart';

@freezed
class MtGCard with _$MtGCard {
  const MtGCard._();

  const factory MtGCard({
    required String id,
    required String name,
    required String typeLine,
    required String rarity,
    Map<String, String>? imageUris,
    String? oracleText,
  }) = _MtGCard;

  factory MtGCard.fromJson(Map<String, dynamic> json) => _$MtGCardFromJson(json);

  String get label {
    return "$typeLine($rarity)";
  }
  String? get imageUrl {
    // Access the normal-sized image URL
    return imageUris?['normal'];
  }
}