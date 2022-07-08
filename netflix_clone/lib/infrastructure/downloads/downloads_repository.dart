import 'package:dio/dio.dart';
import 'package:netflix_clone/domain/core/api_end_point.dart';
import 'package:netflix_clone/domain/core/models/downloads/downloads.dart';
import 'package:netflix_clone/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/core/models/i_download_repo.dart';

class DownloadsRepository implements IDownloadsRepo {
  @override
  Future<Either<MainFailures, List<DataClass>>> getDownloadsImages() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<DataClass> downlaodList = [];
        for (final raw in response.data) {
          downlaodList.add(DataClass.fromJson(raw as Map<String, dynamic>));
        }
        print(downlaodList);
        return Right(downlaodList);
      } else {
        return const Left(MainFailures.ServerFailure());
      }
    } catch (_) {
      return Left(MainFailures.clientFailure());
    }
  }
}
