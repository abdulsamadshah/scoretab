import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:scoretab/app/models/choice.model.dart';
import 'package:scoretab/app/models/gamesondate.model.dart';
import 'package:scoretab/app/models/usermodel.dart';
import 'package:scoretab/app/service/userService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var token;
  List<GamesOnDateModel> gamesbtnrange = <GamesOnDateModel>[].obs;
  var selectedDate = "".obs;
  var name = "".obs;
  Rx<Usermodel>? userdata = Usermodel().obs;
  var selectedGamesList = <ChoiceModel>[].obs;
  var isSelectedGamesLoading = true.obs;
  late BannerAd bannerAd;
  var isAddLoaded = false.obs;
  List selectedGamesId = [].obs;
  List getGamesfromapi = [].obs;
  var startDate = "".obs;
  var endDate = "".obs;
  @override
  void onInit() {
    super.onInit();
    getName();
    getFilterSportType();
    initializedBanneradd();
    selectedDate.value = DateFormat('dd/MM/yyyy').format(DateTime.now());
  }

  @override
  void onClose() {
    super.onClose();
  }

  initializedBanneradd() async {
    bannerAd = BannerAd(
        size: AdSize.banner,
        // adUnitId: "ca-app-pub-1792132581495004/5881949930",
        adUnitId: "ca-app-pub-9770696155330127/8149253102",
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            isAddLoaded.value = true;
            print('$BannerAd loaded.');
          },
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            print("error whil loading ads");
            print('$BannerAd failedToLoad: $error');
          },
          onAdClosed: (Ad ad) {
            print('$BannerAd onAdOpened.');
            ad.dispose();
          },
        ),
        request: AdRequest());
    await bannerAd.load();
  }

  getName() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    if (token == null) {
      // userdata!['name'].value="guest"
    } else {
      await UserService().getUserDetail().then((value) {
        userdata!.value = value;
        getGamesfromapi =
            userdata!.value.sportsList!.split(",").map(int.parse).toList();

        print("getGamesfromapi======> $getGamesfromapi");
      });
    }
  }

  getFilterSportType() async {
    isSelectedGamesLoading(true);
    try {
      var cats = await UserService().getFilterSportType();
      if (cats.isNotEmpty) {
        selectedGamesList.value = cats;
        selectedGamesList.forEach((element) {
          if (getGamesfromapi.contains(element.id)) {
            selectedGamesId.add(element.id);
          }
        });
        print("selectedGamesId============= $selectedGamesId");
      }
      isSelectedGamesLoading(false);
    } catch (e) {
      isSelectedGamesLoading(false);
    }
  }
}
