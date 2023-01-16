// import 'package:delayed_display/delayed_display.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:scoretab/app/customscreen/aboutUs.dart';
// import 'package:scoretab/app/customscreen/tnc.dart';
// import 'package:scoretab/app/data/shared/color.dart';
// import 'package:scoretab/app/data/shared/dialog.dart';
// import 'package:scoretab/app/data/shared/utility.dart';
// import 'package:scoretab/app/routes/app_pages.dart';
// import 'package:scoretab/app/service/home.service.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';
// import '../controllers/home_controller.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
//
// class HomeView extends GetView<HomeController> {
//   HomeView({Key? key}) : super(key: key);
//   final DateFormat formatter = DateFormat('yyyy-MM-dd');
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         drawer: drawer(context),
//         appBar: AppBar(),
//         bottomNavigationBar: controller.isAddLoaded.value
//             ? Container(
//                 height: controller.bannerAd.size.height.toDouble(),
//                 width: controller.bannerAd.size.width.toDouble(),
//                 child: AdWidget(ad: controller.bannerAd),
//               )
//             : SizedBox(),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Row(
//                   children: [
//                     const Text("Hello, ",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w500, fontSize: 18)),
//                     Obx(
//                       () => Text(
//                           controller.userdata?.value.name.toString() ?? "",
//                           style: const TextStyle(
//                               fontWeight: FontWeight.w500, fontSize: 18)),
//                     ),
//                     const DelayedDisplay(
//                       slidingBeginOffset: Offset(-0.5, 1.0),
//                       delay: Duration(milliseconds: 300),
//                       child: Text(" 👋",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w500, fontSize: 18)),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Obx(
//                   () => controller.isSelectedGamesLoading.value
//                       ? const CupertinoActivityIndicator()
//                       : MultiSelectContainer(
//                           wrapSettings:
//                               const WrapSettings(runSpacing: 10, spacing: 20),
//                           itemsDecoration: MultiSelectDecorations(
//                             decoration: BoxDecoration(
//                                 color: Colors.grey[300],
//                                 borderRadius: BorderRadius.circular(20)),
//                             selectedDecoration: BoxDecoration(
//                                 color: FixedColors.blue,
//                                 border: Border.all(color: FixedColors.blue),
//                                 borderRadius: BorderRadius.circular(20)),
//                           ),
//                           items: [
//                             for (var i in controller.selectedGamesList)
//                               MultiSelectCard(
//                                   value: i.id,
//                                   selected:
//                                       controller.getGamesfromapi.contains(i.id)
//                                           ? true
//                                           : false,
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         vertical: 5, horizontal: 5),
//                                     child: Container(
//                                       height: 16,
//                                       width: 80,
//                                       child: Text(
//                                         i.type.toString(),
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     ),
//                                   )),
//                             MultiSelectCard(
//                                 value: "All Sports",
//                                 selected:
//                                     controller.token == null ? true : false,
//                                 child: Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       vertical: 5, horizontal: 5),
//                                   child: Container(
//                                     height: 16,
//                                     width: 80,
//                                     child: const Text(
//                                       "All Sports",
//                                       textAlign: TextAlign.center,
//                                     ),
//                                   ),
//                                 )),
//                           ],
//                           onChange: (allSelectedItems, selectedItem) async {
//                             print(selectedItem);
//                             print(allSelectedItems);
//                             controller.gamesbtnrange = await HomeService()
//                                 .getGamesBetweenRange(controller.startDate,
//                                     controller.endDate, allSelectedItems);
//                             if (controller.gamesbtnrange.isEmpty) {
//                               Fluttertoast.showToast(
//                                   msg: "No Game Found On This Filter");
//                             }
//                           }),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   height: 650,
//                   child: Obx(
//                     () => SfCalendar(
//                       firstDayOfWeek: DateTime.monday,
//                       selectionDecoration: BoxDecoration(
//                         border: Border.all(color: FixedColors.blue, width: 2),
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(4)),
//                         shape: BoxShape.rectangle,
//                       ),
//                       onTap: (calendarTapDetails) {
//                         var selectedDate =
//                             formatter.format(calendarTapDetails.date!);
//                         Get.toNamed(Routes.GAMELIST,
//                             arguments: {'date': selectedDate});
//                       },
//                       initialSelectedDate: DateTime.now(),
//                       onSelectionChanged: (calendarSelectionDetails) {
//                         var selectedDate =
//                             formatter.format(calendarSelectionDetails.date!);
//                       },
//                       onViewChanged: (viewChangedDetails) async {
//                         controller.startDate.value = formatter
//                             .format(viewChangedDetails.visibleDates.first);
//                         controller.endDate.value = formatter
//                             .format(viewChangedDetails.visibleDates.last);
//
//                         // var cats = await UserService().getFilterSportType();
//
//                         // if (cats.isNotEmpty) {
//                         //   selectedGamesList = cats;
//                         //   selectedGamesList.forEach((element) {
//                         //     //yaha pe check karke filter mar
//                         //     if (getGamesfromapi.contains(element.id)) {
//                         //       selectedGamesId.add(element.id);
//                         //     }
//                         //     // selectedGamesId.add(element.id);
//                         //   });
//                         // }
//                         print(
//                             "selected games id on view page===> ${controller.selectedGamesId}");
//                         controller.gamesbtnrange = await HomeService()
//                             .getGamesBetweenRange(controller.startDate,
//                                 controller.endDate, controller.selectedGamesId);
//
//                         if (controller.gamesbtnrange.isEmpty) {
//                           Fluttertoast.showToast(
//                               msg: "No Game Found On Selected Date");
//                         }
//                         // selectedGamesId.clear();
//                       },
//                       todayTextStyle:
//                           const TextStyle(fontWeight: FontWeight.bold),
//                       todayHighlightColor: FixedColors.blue,
//                       appointmentTextStyle: TextStyle(color: Colors.cyan),
//                       cellBorderColor: Colors.grey[300],
//                       monthViewSettings: const MonthViewSettings(
//                         showTrailingAndLeadingDates: false,
//                         monthCellStyle: MonthCellStyle(
//                             textStyle: TextStyle(color: Colors.cyan),
//                             todayTextStyle: TextStyle(
//                                 color: Colors.cyan,
//                                 fontWeight: FontWeight.bold),
//                             backgroundColor: Colors.cyan,
//                             todayBackgroundColor: Colors.cyan,
//                             leadingDatesBackgroundColor: Colors.cyan),
//                         showAgenda: false,
//                         agendaViewHeight: 180,
//                       ),
//                       showNavigationArrow: true,
//                       view: CalendarView.month,
//                       monthCellBuilder: monthCellBuilder,
//                       dataSource: _getDataSource(),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
//
//   drawer(BuildContext context) {
//     return Drawer(
//       width: MediaQuery.of(context).size.width * 0.50,
//       child: Padding(
//         padding: const EdgeInsets.only(left: 10.0, top: 80.0, right: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//                 borderRadius: BorderRadius.circular(100.0),
//                 child: Container(width: 60, height: 60, child: CircleAvatar())
//                 //  CachedNetworkImage(
//                 //   width: 120.w,
//                 //   height: 120.h,
//                 //   imageUrl: Utility.isNotNullEmptyOrFalse(userdata.imagePath)
//                 //       ? "${MyAppTheme.baseUrl}${userdata.imagePath}/${userdata.imageName}"
//                 //       : MyAppTheme.notFoundImg,
//                 //   fit: BoxFit.cover,
//                 //   placeholder: (context, string) => const Center(
//                 //     child: CircularProgressIndicator(),
//                 //   ),
//                 // ),
//                 ),
//             const SizedBox(height: 10),
//             Obx(
//               () => Text(
//                 Utility.isNotNullEmptyOrFalse(controller.userdata?.value.name)
//                     ? controller.userdata!.value.name!
//                     : "Guest",
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 5),
//             Text(
//               Utility.isNotNullEmptyOrFalse(controller.userdata?.value.email)
//                   ? controller.userdata!.value.name!
//                   : "Guest",
//               style: const TextStyle(
//                 fontSize: 11,
//                 fontWeight: FontWeight.w300,
//               ),
//             ),
//             const SizedBox(height: 30),
//             InkWell(
//               onTap: () {
//                 Navigator.pop(context);
//                 Get.toNamed(Routes.CHOICESCREEN);
//               },
//               child: Row(
//                 children: const [
//                   Icon(
//                     Icons.edit,
//                     size: 20,
//                     color: Colors.grey,
//                   ),
//                   SizedBox(
//                     width: 15,
//                   ),
//                   Text(
//                     'Edit Sport Selection',
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             InkWell(
//               onTap: () {
//                 Navigator.pop(context);
//                 // Get.to(() => const Tnc());
//               },
//               child: Row(
//                 children: const [
//                   Icon(
//                     Icons.person_add,
//                     size: 20,
//                     color: Colors.grey,
//                   ),
//                   SizedBox(
//                     width: 15,
//                   ),
//                   Text(
//                     'Edit Profile',
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             InkWell(
//               onTap: () {
//                 Navigator.pop(context);
//                 Get.to(() => AboutUs());
//               },
//               child: Row(
//                 children: const [
//                   Icon(
//                     Icons.group,
//                     size: 20,
//                     color: Colors.grey,
//                   ),
//                   SizedBox(
//                     width: 15,
//                   ),
//                   Text(
//                     'About Us',
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             InkWell(
//               onTap: () {
//                 Navigator.pop(context);
//                 Get.to(() => const Tnc());
//               },
//               child: Row(
//                 children: const [
//                   Icon(
//                     Icons.gavel,
//                     size: 20,
//                     color: Colors.grey,
//                   ),
//                   SizedBox(
//                     width: 15,
//                   ),
//                   Text(
//                     'TnC',
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             controller.token == null
//                 ? InkWell(
//                     onTap: () {
//                       Navigator.pop(context);
//                       Get.toNamed(Routes.CHOICESCREEN);
//                     },
//                     child: Row(
//                       children: const [
//                         Icon(
//                           Icons.login,
//                           size: 20,
//                           color: Colors.grey,
//                         ),
//                         SizedBox(
//                           width: 15,
//                         ),
//                         Text(
//                           'Login',
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 : InkWell(
//                     onTap: () {
//                       logout(context);
//                     },
//                     child: Row(
//                       children: const [
//                         Icon(
//                           Icons.logout,
//                           size: 20,
//                           color: Colors.grey,
//                         ),
//                         SizedBox(
//                           width: 15,
//                         ),
//                         Text(
//                           'Logout',
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   logout(context) {
//     DialogBox.confirmDialog(
//         context, "Are you sure want to Logout", deleteCallback);
//   }
//
//   deleteCallback() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove('token');
//     Get.offNamed(Routes.LOGIN);
//   }
//
//   Widget monthCellBuilder(BuildContext context, MonthCellDetails details) {
//     if (details.appointments.isNotEmpty) {
//       List listOfappoinments = [];
//       Appointment? appointment;
//       for (var i = 0; i < details.appointments.length; i++) {
//         Appointment? currentAppoinmets =
//             details.appointments[i] as Appointment?;
//         appointment = currentAppoinmets;
//         listOfappoinments.add(appointment);
//       }
//       return Container(
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.transparent, width: 0),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 7),
//                 child: Text(details.date.day.toString()),
//               ),
//             ),
//             for (int i = 0; i < listOfappoinments.length; i++) ...[
//               Container(
//                 child: Text(
//                   listOfappoinments[i].subject.toString(),
//                   style: TextStyle(
//                     fontSize: 10,
//                   ),
//                 ),
//               ),
//             ],
//           ],
//         ),
//       );
//     }
//     return Container(
//       alignment: Alignment.topCenter,
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.transparent, width: 0),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.only(top: 7),
//         child: Text(details.date.day.toString()),
//       ),
//     );
//   }
//
//   _DataSource _getDataSource() {
//     final List<Appointment> appointments = <Appointment>[];
//
//     if (controller.gamesbtnrange.isNotEmpty) {
//       for (var i = 0; i < controller.gamesbtnrange.length; i++) {
//         appointments.add(Appointment(
//             startTime: DateTime.now()
//                 .add(Duration(days: controller.gamesbtnrange[i].diff!.toInt())),
//             endTime: DateTime.now()
//                 .add(Duration(days: controller.gamesbtnrange[i].diff!.toInt())),
//             subject: controller.gamesbtnrange[i].game.toString(),
//             color: Colors.transparent));
//       }
//     }
//
//     return _DataSource(appointments);
//   }
// }
//
// class _DataSource extends CalendarDataSource {
//   _DataSource(List<Appointment> source) {
//     appointments = source;
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:scoretab/app/customscreen/aboutUs.dart';
import 'package:scoretab/app/customscreen/copyrightPolicy.dart';
import 'package:scoretab/app/customscreen/privacyPolicy.dart';
import 'package:scoretab/app/customscreen/tnc.dart';
import 'package:scoretab/app/data/shared/color.dart';
import 'package:scoretab/app/data/shared/dialog.dart';
import 'package:scoretab/app/data/shared/utility.dart';
import 'package:scoretab/app/models/choice.model.dart';
import 'package:scoretab/app/models/gamesondate.model.dart';
import 'package:scoretab/app/models/usermodel.dart';
import 'package:scoretab/app/routes/app_pages.dart';
import 'package:scoretab/app/service/home.service.dart';
import 'package:scoretab/app/service/userService.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView> {
  late BannerAd bannerAd;
  var isAddLoaded = false.obs;
  Usermodel? userdata = Usermodel();
  bool isSelectedGamesLoading = true;
  List<ChoiceModel> selectedGamesList = [];
  var selectedDate = "";
  List<GamesOnDateModel> gamesbtnrange = <GamesOnDateModel>[];
  //List getGamesfromapi = [];
  List<int> selectedIds = [];
  late var startDate;
  late var endDate;
  var token;
  bool isselectAllPressed = false;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  getName() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    if (token == null) {
    } else {
      await UserService().getUserDetail().then((value) {
        userdata = value;
      });
      if (userdata!.sportsList != null) {
        selectedIds = userdata!.sportsList!.split(",").map(int.parse).toList();
      }
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
      request: const AdRequest(),
    );
    await bannerAd.load();
  }

  getDelete() async {
    final prefs = await SharedPreferences.getInstance();
    token = await prefs.getString('token');
    if (token == "null") {
    } else {
      await UserService().userDelete().then((value) {
        if (value == 200) {
          Fluttertoast.showToast(
              msg: 'Delete successful', backgroundColor: Colors.greenAccent);
          // Get.offNamed(Routes.CHOICESCREEN);
        }
      });
    }
  }

  getFilterSportType() async {
    try {
      final cats = await UserService().getFilterSportType();
      selectedGamesList = cats;
      if (selectedGamesList.length == selectedIds.length) {
        isselectAllPressed = true;
        selectedIds = selectedGamesList.map((e) => e.id).toList();
      }
      if (token == null) {
        isselectAllPressed = true;
        selectedIds = selectedGamesList.map((e) => e.id).toList();
      }
      isSelectedGamesLoading = false;
      setState(() {});
    } catch (e) {
      isSelectedGamesLoading = false;
    }
  }

  bool get isAllSeleceted => selectedGamesList.length == selectedIds.length;

  @override
  void initState() {
    initialApiCall();
    initializedBanneradd();
    selectedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
    super.initState();
  }

  void initialApiCall() async {
    await getName();
    getFilterSportType();
  }

  // dispose() {
  //   getDelete();
  //   super.dispose();
  // }

  MultiSelectController<String> multiSelectController =
      MultiSelectController<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: AppBar(
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       Get.isDarkMode
          //           ? Get.changeTheme(ThemeData.light())
          //           : Get.changeTheme(ThemeData.dark());
          //     },
          //     icon: const Icon(Icons.lightbulb_outline),
          //   ),
          // ],
          ),
      body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              const Text("Hello ",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
              Text(
                Utility.isNotNullEmptyOrFalse(userdata?.name)
                    ? userdata!.name.toString()
                    : "Guest",
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              // const DelayedDisplay(
              //   slidingBeginOffset: Offset(-0.5, 1.0),
              //   delay: Duration(milliseconds: 300),
              //   child: Text(
              //     " 👋",
              //     style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              //   ),
              // ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        isSelectedGamesLoading
            ? Container()
            // const Center(child: CupertinoActivityIndicator())
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      alignment: WrapAlignment.start,
                      runSpacing: 5,
                      spacing: 5,
                      children: [
                        ...selectedGamesList.map(
                          (e) => GestureDetector(
                            onTap: () async {
                              if (isselectAllPressed == true) {
                                isselectAllPressed = !isselectAllPressed;
                                selectedIds = [];
                                selectedIds.add(e.id);
                              } else {
                                if (selectedIds.contains(e.id)) {
                                  selectedIds.remove(e.id);
                                  if (selectedIds.length ==
                                      selectedGamesList.length) {
                                    isselectAllPressed = !isselectAllPressed;
                                  }
                                  if (selectedIds.isEmpty) {
                                    selectedIds = selectedGamesList
                                        .map((e) => e.id)
                                        .toList();
                                    isselectAllPressed = !isselectAllPressed;
                                  }
                                } else {
                                  selectedIds.add(e.id);
                                  if (selectedIds.length ==
                                      selectedGamesList.length) {
                                    isselectAllPressed = !isselectAllPressed;
                                  }
                                }
                              }

                              // context.loaderOverlay.show();

                              try {
                                gamesbtnrange = await HomeService()
                                    .getGamesBetweenRange(
                                        startDate, endDate, selectedIds);
                              } catch (e) {}
                              // context.loaderOverlay.hide();
                              setState(() {});
                            },
                            child: Chip(
                              backgroundColor: isselectAllPressed
                                  ? null
                                  : selectedIds.contains(e.id)
                                      ? FixedColors.blue
                                      : null,
                              padding: const EdgeInsets.symmetric(horizontal: 5)
                                  .copyWith(top: 2),
                              label: Container(
                                height: 30,
                                width: 70,
                                child: Center(
                                  child: Text(
                                    e.type.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: isselectAllPressed
                                          ? null
                                          : selectedIds.contains(e.id)
                                              ? Colors.white
                                              : null,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (isselectAllPressed) {
                          return;
                        }
                        isselectAllPressed = !isselectAllPressed;
                        // context.loaderOverlay.show();
                        if (selectedIds.length == selectedGamesList.length) {
                          // selectedIds.clear();
                        } else {
                          selectedIds =
                              selectedGamesList.map((e) => e.id).toList();
                        }

                        // selectedIds =
                        //     selectedGamesList.map((e) => e.id).toList();
                        print(selectedIds);
                        try {
                          gamesbtnrange = await HomeService()
                              .getGamesBetweenRange(
                                  startDate, endDate, selectedIds);
                        } catch (e) {}
                        // context.loaderOverlay.hide();
                        setState(() {});
                      },
                      child: Chip(
                        backgroundColor:
                            isAllSeleceted ? FixedColors.blue : null,
                        padding: const EdgeInsets.symmetric(horizontal: 5)
                            .copyWith(top: 2),
                        label: Container(
                          height: 30,
                          width: 70,
                          child: Center(
                            child: Text(
                              "All Sports",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: isAllSeleceted ? Colors.white : null),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 650,
          child: isSelectedGamesLoading && selectedIds.isEmpty
              ? Container()
              // Center(child: CupertinoActivityIndicator())
              : SfCalendar(
                  firstDayOfWeek: DateTime.monday,
                  selectionDecoration: BoxDecoration(
                    border: Border.all(color: FixedColors.blue, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    shape: BoxShape.rectangle,
                  ),
                  // minDate: DateTime.now(),
                  onTap: (calendarTapDetails) {
                    var selectedDate =
                        formatter.format(calendarTapDetails.date!);
                    Get.toNamed(Routes.GAMELIST, arguments: {
                      'date': selectedDate,
                      "selectId": selectedIds
                    });
                  },
                  initialSelectedDate: DateTime.now(),
                  onSelectionChanged: (calendarSelectionDetails) {
                    var selectedDate =
                        formatter.format(calendarSelectionDetails.date!);
                  },
                  onViewChanged: (viewChangedDetails) async {
                    startDate =
                        formatter.format(viewChangedDetails.visibleDates.first);
                    endDate =
                        formatter.format(viewChangedDetails.visibleDates.last);
                    var cats = await UserService().getFilterSportType();
                    getGamesBtnGivenRange();
                    gamesbtnrange = await HomeService()
                        .getGamesBetweenRange(startDate, endDate, selectedIds);
                    // if (gamesbtnrange.isEmpty) {
                    //   Fluttertoast.showToast(
                    //       msg: "No Game Found On Selected Date");
                    // }
                    // selectedGamesId.clear();
                    setState(() {});
                  },
                  todayTextStyle: const TextStyle(fontWeight: FontWeight.bold),
                  todayHighlightColor: FixedColors.blue,
                  appointmentTextStyle: const TextStyle(color: Colors.cyan),
                  cellBorderColor: Colors.grey[300],
                  monthViewSettings: const MonthViewSettings(
                    showTrailingAndLeadingDates: false,
                    monthCellStyle: MonthCellStyle(
                      textStyle: TextStyle(color: Colors.cyan),
                      todayTextStyle: TextStyle(
                          color: Colors.cyan, fontWeight: FontWeight.bold),
                      backgroundColor: Colors.cyan,
                      todayBackgroundColor: Colors.cyan,
                      leadingDatesBackgroundColor: Colors.cyan,
                    ),
                    showAgenda: false,
                    agendaViewHeight: 180,
                  ),
                  showNavigationArrow: true,
                  view: CalendarView.month,
                  monthCellBuilder: monthCellBuilder,
                  dataSource: _getDataSource(),
                ),
        ),
        const SizedBox(
          height: 20,
        ),
      ])),
      bottomNavigationBar: isAddLoaded.value
          ? Container(
              height: bannerAd.size.height.toDouble(),
              width: bannerAd.size.width.toDouble(),
              child: AdWidget(ad: bannerAd),
            )
          : const SizedBox(),
    );
  }

  drawer(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.50,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 80.0, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ClipRRect(
            //     borderRadius: BorderRadius.circular(100.0),
            //  child :CachedNetworkImage(
            //   width: 120.w,
            //   height: 120.h,
            //   imageUrl: Utility.isNotNullEmptyOrFalse(userdata.imagePath)
            //       ? "${MyAppTheme.baseUrl}${userdata.imagePath}/${userdata.imageName}"
            //       : MyAppTheme.notFoundImg,
            //   fit: BoxFit.cover,
            //   placeholder: (context, string) => const Center(
            //     child: CircularProgressIndicator(),
            //   ),
            // ),
            // ),

            Text(
              Utility.isNotNullEmptyOrFalse(userdata?.name)
                  ? userdata!.name.toString()
                  : "Guest",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              Utility.isNotNullEmptyOrFalse(userdata?.email)
                  ? userdata!.email.toString()
                  : "Guest",
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 30),
            token == null
                ? Container()
                : InkWell(
                    onTap: () async {
                      Get.back();
                      //  await Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const EditsportchoiceView()),
                      //   ).then((value) {

                      // //  initState();
                      //        setState(() {});
                      //   });

                      // if (reLoadPage) {
                      //   setState(() {});
                      // }
                      // Navigator.pop(context);
                      Get.toNamed(Routes.EDITSPORTCHOICE);
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.edit,
                          size: 20,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 15),
                        Text(
                          'Edit Sport Selection',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
            // const SizedBox(
            //   height: 20,
            // ),
            // InkWell(
            //   onTap: () {
            //     Navigator.pop(context);
            //     // Get.to(() => const Tnc());
            //   },
            //   child: Row(
            //     children: const [
            //       Icon(
            //         Icons.person_add,
            //         size: 20,
            //         color: Colors.grey,
            //       ),
            //       SizedBox(
            //         width: 15,
            //       ),
            //       Text(
            //         'Edit Profile',
            //         style: TextStyle(
            //           fontSize: 14,
            //           fontWeight: FontWeight.w500,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Get.to(() => AboutUs());
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.group,
                    size: 20,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 15),
                  Text(
                    'About Us',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const PrivacyPolicy());
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.privacy_tip,
                    size: 20,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Privacy policy',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const CopyrightPolicy());
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.copyright,
                    size: 20,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Copyright Policy',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const Tnc());
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.gavel,
                    size: 20,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Terms of Use',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            token == null
                ? InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Get.toNamed(Routes.CHOICESCREEN);
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.login,
                          size: 20,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      InkWell(
                        onTap: () {
                          logout(context);
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.logout,
                              size: 20,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Logout',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      //
                      InkWell(
                        onTap: () async {
                          await getDelete();
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.remove('token');

                          await FirebaseAuth.instance.signOut();
                          await FirebaseAuth.instance.currentUser?.delete();
                          GoogleSignIn().signOut();

                          Get.offNamed(Routes.CHOICESCREEN);
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.delete_forever,
                              size: 20,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 15),
                            Text(
                              'Delete Account',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  _DataSource _getDataSource() {
    final List<Appointment> appointments = <Appointment>[];

    if (gamesbtnrange.isNotEmpty) {
      for (var i = 0; i < gamesbtnrange.length; i++) {
        appointments.add(
          Appointment(
              startTime: DateTime.now()
                  .add(Duration(days: gamesbtnrange[i].diff!.toInt())),
              endTime: DateTime.now()
                  .add(Duration(days: gamesbtnrange[i].diff!.toInt())),
              subject: gamesbtnrange[i].game.toString(),
              color: Colors.transparent),
        );
      }
    }

    return _DataSource(appointments);
  }

  Widget monthCellBuilder(BuildContext context, MonthCellDetails details) {
    if (details.appointments.isNotEmpty) {
      List listOfappoinments = [];
      Appointment? appointment;
      for (var i = 0; i < details.appointments.length; i++) {
        Appointment? currentAppoinmets =
            details.appointments[i] as Appointment?;
        appointment = currentAppoinmets;
        listOfappoinments.add(appointment);
      }
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent, width: 0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // decoration: BoxDecoration(
              //     border: Border.all(color: Colors.grey),
              //     borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Text(details.date.day.toString()),
              ),
            ),
            for (int i = 0; i < listOfappoinments.length; i++) ...[
              Container(
                child: Text(
                  listOfappoinments[i].subject.toString(),
                  style: TextStyle(
                    fontSize: 9,
                  ),
                ),
              ),
            ],
          ],
        ),
      );
    }
    return Container(
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent, width: 0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 7),
        child: Text(details.date.day.toString()),
      ),
    );
  }

  getGamesBtnGivenRange() {}
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}

logout(context) {
  DialogBox.confirmDialog(
      context, "Are you sure want to Logout", deleteCallback);
}

deleteCallback() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');

  await FirebaseAuth.instance.signOut();
  GoogleSignIn().signOut();

  Get.offNamed(Routes.CHOICESCREEN);
}
