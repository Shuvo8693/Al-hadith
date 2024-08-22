import 'package:al_hadit_test/features/al_hadith/presentation/getx/al_hadith_controller.dart';
import 'package:get/get.dart';

class AlHadithBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(AlHadithController());
  }

}