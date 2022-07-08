import 'package:freezed_annotation/freezed_annotation.dart';
part 'downloads.freezed.dart';
part 'downloads.g.dart';

@freezed
class DataClass with _$DataClass {
  const factory DataClass({
    @JsonKey(name: "poster_path") required String? posterPath,
  }) = _DataClass;

  factory DataClass.fromJson(Map<String, dynamic> json) =>
      _$DataClassFromJson(json);
}
