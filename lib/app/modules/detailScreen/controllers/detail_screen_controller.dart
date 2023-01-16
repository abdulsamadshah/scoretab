import 'package:get/get.dart';
import 'package:scoretab/app/models/cricket.model.dart';

class DetailScreenController extends GetxController {
  late CricketModel cricdata;
  var arguments = Get.arguments;
   var isLoading = true.obs;
  @override
  void onInit() {
    if (arguments != null) {
      cricdata = arguments["data"];
     isLoading(false);
    }
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
