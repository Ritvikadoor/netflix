// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'downloads.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DataClass _$DataClassFromJson(Map<String, dynamic> json) {
  return _DataClass.fromJson(json);
}

/// @nodoc
mixin _$DataClass {
  @JsonKey(name: "poster_path")
  String? get posterPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataClassCopyWith<DataClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataClassCopyWith<$Res> {
  factory $DataClassCopyWith(DataClass value, $Res Function(DataClass) then) =
      _$DataClassCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: "poster_path") String? posterPath});
}

/// @nodoc
class _$DataClassCopyWithImpl<$Res> implements $DataClassCopyWith<$Res> {
  _$DataClassCopyWithImpl(this._value, this._then);

  final DataClass _value;
  // ignore: unused_field
  final $Res Function(DataClass) _then;

  @override
  $Res call({
    Object? posterPath = freezed,
  }) {
    return _then(_value.copyWith(
      posterPath: posterPath == freezed
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_DataClassCopyWith<$Res> implements $DataClassCopyWith<$Res> {
  factory _$$_DataClassCopyWith(
          _$_DataClass value, $Res Function(_$_DataClass) then) =
      __$$_DataClassCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: "poster_path") String? posterPath});
}

/// @nodoc
class __$$_DataClassCopyWithImpl<$Res> extends _$DataClassCopyWithImpl<$Res>
    implements _$$_DataClassCopyWith<$Res> {
  __$$_DataClassCopyWithImpl(
      _$_DataClass _value, $Res Function(_$_DataClass) _then)
      : super(_value, (v) => _then(v as _$_DataClass));

  @override
  _$_DataClass get _value => super._value as _$_DataClass;

  @override
  $Res call({
    Object? posterPath = freezed,
  }) {
    return _then(_$_DataClass(
      posterPath: posterPath == freezed
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DataClass implements _DataClass {
  const _$_DataClass({@JsonKey(name: "poster_path") required this.posterPath});

  factory _$_DataClass.fromJson(Map<String, dynamic> json) =>
      _$$_DataClassFromJson(json);

  @override
  @JsonKey(name: "poster_path")
  final String? posterPath;

  @override
  String toString() {
    return 'DataClass(posterPath: $posterPath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataClass &&
            const DeepCollectionEquality()
                .equals(other.posterPath, posterPath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(posterPath));

  @JsonKey(ignore: true)
  @override
  _$$_DataClassCopyWith<_$_DataClass> get copyWith =>
      __$$_DataClassCopyWithImpl<_$_DataClass>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataClassToJson(this);
  }
}

abstract class _DataClass implements DataClass {
  const factory _DataClass(
          {@JsonKey(name: "poster_path") required final String? posterPath}) =
      _$_DataClass;

  factory _DataClass.fromJson(Map<String, dynamic> json) =
      _$_DataClass.fromJson;

  @override
  @JsonKey(name: "poster_path")
  String? get posterPath;
  @override
  @JsonKey(ignore: true)
  _$$_DataClassCopyWith<_$_DataClass> get copyWith =>
      throw _privateConstructorUsedError;
}
