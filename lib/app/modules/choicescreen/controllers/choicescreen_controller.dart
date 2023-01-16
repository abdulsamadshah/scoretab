import 'package:get/get.dart';
import 'package:scoretab/app/models/choice.model.dart';
import 'package:scoretab/app/service/choice.service.dart';

class ChoicescreenController extends GetxController {
  bool _isLoading = true;
var isselectAllPressed=false.obs ;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  List games = [
    "Cricket",
    "Football",
    "Hockey",
    "Badminton",
    "Kabaddi",
    "Table Tennis",
    "Athletics",
    "Tennis",
    "Formula 1",
    "Formula E",
    "MotoGp"
  ];
  List<ChoiceModel> catList = [];
  List<int> selectedList = [];
  @override
  void onInit() {
    super.onInit();
    fetchCategory();
  }

  void fetchCategory() async {
    isLoading = (true);
    try {
      var cats = await ChoiceService().getcategories();
      catList = cats;
    } catch (e) {
    } finally {
      isLoading = (false);
    }
  }
}
