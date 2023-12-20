import 'package:freezed_annotation/freezed_annotation.dart';

part 'mtg_card.freezed.dart';
part 'mtg_card.g.dart';

@freezed
class MtGCard with _$MtGCard{
  const MtGCard._();

  const factory MtGCard({
    required String id,
    required String name,
    required String type,
    required String rarity,
    String? imageUrl,
    String? text,
}) = _MtGCard;

  factory MtGCard.fromJson(Map<String, Object?> json) => _$MtGCardFromJson(json);

  String get label{
    return "$type($rarity)";
  }

}