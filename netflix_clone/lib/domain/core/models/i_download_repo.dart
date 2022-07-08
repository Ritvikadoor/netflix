import 'package:dartz/dartz.dart';
import 'package:netflix_clone/core/failures/main_failures.dart';
import 'package:netflix_clone/domain/core/models/downloads/downloads.dart';

abstract class IDownloadsRepo {
  Future<Either<MainFailures, List<DataClass>>> getDownloadsImages();
}
