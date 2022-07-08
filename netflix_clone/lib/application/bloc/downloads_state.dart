part of 'downloads_bloc.dart';

@freezed
class DownloadsState with _$DownloadsState {
  const factory DownloadsState(
      {required bool isLoading,
      List<DataClass>? downloads,
      required Option<Either<MainFailures, List<DataClass>>>
          downloadsFailureSuccessOption}) = _DownloadsState;

  factory DownloadsState.initial() {
    return DownloadsState(
        isLoading: false, downloadsFailureSuccessOption: None());
  }
}
