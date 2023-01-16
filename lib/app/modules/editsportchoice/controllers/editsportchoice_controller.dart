import 'package:get/get.dart';
import 'package:scoretab/app/models/choice.model.dart';
import 'package:scoretab/app/service/choice.service.dart';

class EditsportchoiceController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchCategory();
  }

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  List<ChoiceModel> catList = [];
  List<int> selectedList = [];

  void fetchCategory() async {
    isLoading = (true);
    try {
      var cats = await ChoiceService().getcategories();
      catList = cats;
      print("===========> $catList");
      //isLoading = (false);
    } catch (e) {
    } finally {
      isLoading = (false);
    }
  }
}


