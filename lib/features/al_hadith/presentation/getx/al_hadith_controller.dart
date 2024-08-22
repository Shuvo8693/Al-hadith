
import 'package:al_hadit_test/dependency_container.dart';
import 'package:al_hadit_test/features/al_hadith/data/datasource/local_data_source.dart';
import 'package:al_hadit_test/features/al_hadith/data/repository/al_hadith_repository.dart';
import 'package:get/get.dart';

class AlHadithController extends GetxController {
  final AlHadithRepository _alHadithRepository =
      AlHadithRepository(localDataSource: di<LocalDataSource>());

  ListOfLocalData? listOfLocalData;
  String errorMessage = '';
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    isLoading = true;
    update();
    final value = await _alHadithRepository.attemptToOpenDataBase();

    value.fold(
      (error) {
        errorMessage = error;
        isLoading = false;
        update();
      },
      (data) {
        listOfLocalData = data;
        isLoading = false;
        update();
      },
    );
  }
}
