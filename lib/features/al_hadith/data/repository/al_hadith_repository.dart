import 'package:al_hadit_test/features/al_hadith/data/datasource/local_data_source.dart';
import 'package:dartz/dartz.dart';

class AlHadithRepository {
  LocalDataSource localDataSource;

  AlHadithRepository({required this.localDataSource});

  Future<Either<String, ListOfLocalData>> attemptToOpenDataBase() async {
    try {
      final value = await localDataSource.openDataBase();
      return value;
    } catch (error) {
      return Left(error.toString());
    }
  }
}
