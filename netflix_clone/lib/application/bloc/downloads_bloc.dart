import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix_clone/core/failures/main_failures.dart';
import 'package:netflix_clone/domain/core/models/downloads/downloads.dart';
import 'package:netflix_clone/domain/core/models/i_download_repo.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsRepo _downloadsRepo;
  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.initial()) {
    on<_GetDownloadsImages>((event, emit) async {
      emit(state.copyWith(
          isLoading: true, downloadsFailureSuccessOption: none()));
      final Either<MainFailures, List<DataClass>> downloadsOption =
          await _downloadsRepo.getDownloadsImages();
      emit(downloadsOption.fold(
          (failure) => state.copyWith(
              isLoading: false,
              downloadsFailureSuccessOption: some(Left(failure))),
          (success) => state.copyWith(
              isLoading: false,
              downloads: success,
              downloadsFailureSuccessOption: some(Right(success)))));
    });
  }
}
