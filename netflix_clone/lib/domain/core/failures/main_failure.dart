import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_failure.freezed.dart';
// part 'main_failure.freezed.dart';
// part 'downloads.freezed.dart';

@freezed
class MainFailure with _$MainFailure {
  const factory MainFailure() = _ClientFailures;
  const factory MainFailure.serverFailure() = _ServerFailure;
}
