// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mtg_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MtGCard _$MtGCardFromJson(Map<String, dynamic> json) {
  return _MtGCard.fromJson(json);
}

/// @nodoc
mixin _$MtGCard {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get typeLine => throw _privateConstructorUsedError;
  String get rarity => throw _privateConstructorUsedError;
  Map<String, String>? get imageUris => throw _privateConstructorUsedError;
  String? get oracleText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MtGCardCopyWith<MtGCard> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MtGCardCopyWith<$Res> {
  factory $MtGCardCopyWith(MtGCard value, $Res Function(MtGCard) then) =
      _$MtGCardCopyWithImpl<$Res, MtGCard>;
  @useResult
  $Res call(
      {String id,
      String name,
      String typeLine,
      String rarity,
      Map<String, String>? imageUris,
      String? oracleText});
}

/// @nodoc
class _$MtGCardCopyWithImpl<$Res, $Val extends MtGCard>
    implements $MtGCardCopyWith<$Res> {
  _$MtGCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? typeLine = null,
    Object? rarity = null,
    Object? imageUris = freezed,
    Object? oracleText = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      typeLine: null == typeLine
          ? _value.typeLine
          : typeLine // ignore: cast_nullable_to_non_nullable
              as String,
      rarity: null == rarity
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as String,
      imageUris: freezed == imageUris
          ? _value.imageUris
          : imageUris // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      oracleText: freezed == oracleText
          ? _value.oracleText
          : oracleText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MtGCardImplCopyWith<$Res> implements $MtGCardCopyWith<$Res> {
  factory _$$MtGCardImplCopyWith(
          _$MtGCardImpl value, $Res Function(_$MtGCardImpl) then) =
      __$$MtGCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String typeLine,
      String rarity,
      Map<String, String>? imageUris,
      String? oracleText});
}

/// @nodoc
class __$$MtGCardImplCopyWithImpl<$Res>
    extends _$MtGCardCopyWithImpl<$Res, _$MtGCardImpl>
    implements _$$MtGCardImplCopyWith<$Res> {
  __$$MtGCardImplCopyWithImpl(
      _$MtGCardImpl _value, $Res Function(_$MtGCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? typeLine = null,
    Object? rarity = null,
    Object? imageUris = freezed,
    Object? oracleText = freezed,
  }) {
    return _then(_$MtGCardImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      typeLine: null == typeLine
          ? _value.typeLine
          : typeLine // ignore: cast_nullable_to_non_nullable
              as String,
      rarity: null == rarity
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as String,
      imageUris: freezed == imageUris
          ? _value._imageUris
          : imageUris // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      oracleText: freezed == oracleText
          ? _value.oracleText
          : oracleText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MtGCardImpl extends _MtGCard {
  const _$MtGCardImpl(
      {required this.id,
      required this.name,
      required this.typeLine,
      required this.rarity,
      final Map<String, String>? imageUris,
      this.oracleText})
      : _imageUris = imageUris,
        super._();

  factory _$MtGCardImpl.fromJson(Map<String, dynamic> json) =>
      _$$MtGCardImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String typeLine;
  @override
  final String rarity;
  final Map<String, String>? _imageUris;
  @override
  Map<String, String>? get imageUris {
    final value = _imageUris;
    if (value == null) return null;
    if (_imageUris is EqualUnmodifiableMapView) return _imageUris;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? oracleText;

  @override
  String toString() {
    return 'MtGCard(id: $id, name: $name, typeLine: $typeLine, rarity: $rarity, imageUris: $imageUris, oracleText: $oracleText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MtGCardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.typeLine, typeLine) ||
                other.typeLine == typeLine) &&
            (identical(other.rarity, rarity) || other.rarity == rarity) &&
            const DeepCollectionEquality()
                .equals(other._imageUris, _imageUris) &&
            (identical(other.oracleText, oracleText) ||
                other.oracleText == oracleText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, typeLine, rarity,
      const DeepCollectionEquality().hash(_imageUris), oracleText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MtGCardImplCopyWith<_$MtGCardImpl> get copyWith =>
      __$$MtGCardImplCopyWithImpl<_$MtGCardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MtGCardImplToJson(
      this,
    );
  }
}

abstract class _MtGCard extends MtGCard {
  const factory _MtGCard(
      {required final String id,
      required final String name,
      required final String typeLine,
      required final String rarity,
      final Map<String, String>? imageUris,
      final String? oracleText}) = _$MtGCardImpl;
  const _MtGCard._() : super._();

  factory _MtGCard.fromJson(Map<String, dynamic> json) = _$MtGCardImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get typeLine;
  @override
  String get rarity;
  @override
  Map<String, String>? get imageUris;
  @override
  String? get oracleText;
  @override
  @JsonKey(ignore: true)
  _$$MtGCardImplCopyWith<_$MtGCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
