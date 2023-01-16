import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:scoretab/app/models/allgames.model.dart';
import 'package:scoretab/app/service/game.service.dart';

class GameListController extends GetxController {
  late BannerAd bannerAd;
  var isAddLoaded = false.obs;
  var gameList = <AllGamesModel>[].obs;
  var startDate = '';
  var endDate = '';
  var selectId = [];
  var isLoading = true.obs;
  var arguments = Get.arguments;
  @override
  void onInit() {
    if (arguments != null) {
      startDate = arguments["date"];
      endDate = arguments["date"];
      selectId = arguments["selectId"];
      print("========> $selectId");
    }
    getAllGames();
    initializedBanneradd();
    //getCricketGames();
    super.onInit();
  }

  // getCricketGames() async {
  //   isLoading(true);
  //   try {
  //     await CricketService().getAllCricket(selectedDate).then((list) {
  //       if (list.isNotEmpty) {}
  //       list.forEach((data) {
  //         cricketList.add(data);
  //       });
  //       print(cricketList);
  //       isLoading(false);
  //     });
  //   } catch (e) {
  //     isLoading(false);
  //   }
  // }

  getAllGames() async {
    isLoading(true);
    try {
      await GameService()
          .getAllGames(startDate, endDate, selectId)
          .then((list) {
        if (list.isNotEmpty) {}
        list.forEach((data) {
          gameList.add(data);
        });

        print(gameList);
        // if (gameList[0].listGame!.isEmpty) {
        //   Fluttertoast.showToast(msg: "No game found on ${gameList[0].date}");
        // }
        isLoading(false);
      });
    } catch (e) {
      isLoading(false);
    }
  }

  nextDatepressed(startDate) async {
    try {
      gameList.clear();
      await GameService().nextDatePressed(startDate).then((list) {
        if (list.isNotEmpty) {}
        list.forEach((data) {
          gameList.add(data);
        });
        print(gameList);
        isLoading(false);
      });
    } catch (e) {
      isLoading(false);
    }
  }

  previousDatepressed(startDate) async {
    try {
      gameList.clear();
      await GameService().previousDatePressed(startDate).then((list) {
        if (list.isNotEmpty) {}
        list.forEach((data) {
          gameList.add(data);
        });
        print(gameList);
        isLoading(false);
      });
    } catch (e) {
      isLoading(false);
    }
  }

  initializedBanneradd() async {
    bannerAd = BannerAd(
      size: AdSize.banner,
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
      request: AdRequest(),
    );
    await bannerAd.load();
  }

  // initializedBanneradd() async {
  //   bannerAd = BannerAd(
  //       size: AdSize.banner,
  //       // adUnitId: "ca-app-pub-1792132581495004/5881949930",
  //       adUnitId: "ca-app-pub-9770696155330127/5307467346",
  //       listener: BannerAdListener(
  //         onAdLoaded: (ad) {
  //           isAddLoaded.value = true;
  //           print('$BannerAd loaded.');
  //         },
  //         onAdFailedToLoad: (Ad ad, LoadAdError error) {
  //           print("error whil loading ads");
  //           print('$BannerAd failedToLoad: $error');
  //         },
  //         onAdClosed: (Ad ad) {
  //           print('$BannerAd onAdOpened.');
  //           ad.dispose();
  //         },
  //       ),
  //       request: AdRequest());
  //   await bannerAd.load();
  // }
}
