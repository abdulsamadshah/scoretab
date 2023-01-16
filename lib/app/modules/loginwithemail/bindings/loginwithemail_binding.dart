import 'package:get/get.dart';

import '../controllers/loginwithemail_controller.dart';

class LoginwithemailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginwithemailController>(
      () => LoginwithemailController(),
    );
  }
}
