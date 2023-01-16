import 'package:get/get.dart';

import '../controllers/editsportchoice_controller.dart';

class EditsportchoiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditsportchoiceController>(
      () => EditsportchoiceController(),
    );
  }
}
