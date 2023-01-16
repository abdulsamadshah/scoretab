import 'package:get/get.dart';

import '../controllers/choicescreen_controller.dart';

class ChoicescreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChoicescreenController>(
      () => ChoicescreenController(),
    );
  }
}
