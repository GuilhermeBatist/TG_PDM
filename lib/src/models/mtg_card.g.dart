// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mtg_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MtGCardImpl _$$MtGCardImplFromJson(Map<String, dynamic> json) =>
    _$MtGCardImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      typeLine: json['typeLine'] as String,
      rarity: json['rarity'] as String,
      imageUris: (json['imageUris'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      oracleText: json['oracleText'] as String?,
    );

Map<String, dynamic> _$$MtGCardImplToJson(_$MtGCardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'typeLine': instance.typeLine,
      'rarity': instance.rarity,
      'imageUris': instance.imageUris,
      'oracleText': instance.oracleText,
    };
