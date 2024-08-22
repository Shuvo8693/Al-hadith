import 'package:al_hadit_test/features/al_hadith/data/datasource/local_data_source.dart';
import 'package:al_hadit_test/features/al_hadith/data/repository/al_hadith_repository.dart';
import 'package:get_it/get_it.dart';

var di= GetIt.instance;




Future<void>initDI()async{

  /// Local data source
  di.registerFactory<LocalDataSource>(()=>LocalDataSource());
  di.registerFactory<AlHadithRepository>(()=>AlHadithRepository(localDataSource: di<LocalDataSource>()));
}