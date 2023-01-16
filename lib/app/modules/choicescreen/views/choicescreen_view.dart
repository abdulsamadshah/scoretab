// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:scoretab/app/data/shared/color.dart';
// import 'package:scoretab/app/routes/app_pages.dart';
// import '../../../data/shared/constant.dart';
// import '../controllers/choicescreen_controller.dart';

// class ChoicesScreenView extends StatefulWidget {
//   const ChoicesScreenView({Key? key}) : super(key: key);

//   @override
//   State<ChoicesScreenView> createState() => _ChoicesScreenViewState();
// }

// class _ChoicesScreenViewState extends State<ChoicesScreenView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GetBuilder(
//         builder: (ChoicescreenController controller) {
//           return SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 10,
//               ),
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 40,
//                   ),
//                   const Center(
//                     child: Text(
//                       'Select Sports and Login for Notifications',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   controller.isLoading
//                       ? Padding(
//                           padding: EdgeInsets.symmetric(
//                               vertical:
//                                   MediaQuery.of(context).size.height * 0.30),
//                           child: const CupertinoActivityIndicator(),
//                         )
//                       : Expanded(
//                           child: GridView.builder(
//                             gridDelegate:
//                                 const SliverGridDelegateWithFixedCrossAxisCount(
//                                     crossAxisCount: 3,
//                                     childAspectRatio: 1.2,
//                                     crossAxisSpacing: 2,
//                                     mainAxisSpacing: 10),
//                             itemCount: controller.catList.length + 1,
//                             itemBuilder: (BuildContext context, int index) {
//                               if (index == controller.catList.length) {
//                                 return InkWell(
//                                   highlightColor: Colors.transparent,
//                                   splashColor: Colors.transparent,
//                                   onTap: () {
//                                   controller.isselectAllPressed.toggle();
//                                     if (controller.selectedList.length ==
//                                         controller.catList.length) {
//                                       controller.selectedList.clear();
//                                     } else {
//                                       controller.selectedList = controller
//                                           .catList
//                                           .map((e) => e.id)
//                                           .toList();
//                                     }
//                                     print(controller.selectedList);
//                                     controller.update();
//                                   },
//                                   child: Column(
//                                     children: [
//                                       const SizedBox(
//                                         height: 5,
//                                       ),
//                                       Container(
//                                         decoration: BoxDecoration(
//                                           border: Border.all(
//                                               color: FixedColors.green,
//                                               width:
//                                                   controller.catList.length ==
//                                                           controller
//                                                               .selectedList
//                                                               .length
//                                                       ? 4
//                                                       : 0),
//                                           borderRadius:
//                                               BorderRadius.circular(100),
//                                         ),
//                                         child: ClipRRect(
//                                             borderRadius:
//                                                 BorderRadius.circular(100.0),
//                                             child: Container(
//                                                 width: 60,
//                                                 height: 60,
//                                                 child: Image.asset(
//                                                     "assets/images/selectall.png"))),
//                                       ),
//                                       const SizedBox(height: 5),
//                                       const Text(
//                                         "Select All",
//                                         textAlign: TextAlign.center,
//                                         style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                               }
//                               return InkWell(
//                                   highlightColor: Colors.transparent,
//                                   splashColor: Colors.transparent,
//                                   onTap: () {
//                                     if (controller.isselectAllPressed.value==true) {
//                                         controller.isselectAllPressed.toggle();
//                                       controller.selectedList
//                                           .remove(controller.catList[index].id);

//                                           print(controller.selectedList);
//                                     } else {
//                                     if (controller.selectedList.contains(
//                                         controller.catList[index].id)) {
//                                       controller.selectedList
//                                           .remove(controller.catList[index].id);

//                                           print(controller.selectedList);
//                                     } else {
//                                       controller.selectedList.add(
//                                         controller.catList[index].id,
//                                       );

//                                       print(controller.selectedList);
//                                     }
//                                     }
//                                     controller.update();
//                                   },
//                                   child: Column(
//                                     children: [
//                                       const SizedBox(
//                                         height: 5,
//                                       ),
//                                       Container(
//                                         decoration: BoxDecoration(
//                                           border: Border.all(
//                                               color: FixedColors.green,
//                                               width:  controller.isselectAllPressed.value==true?0:

//                                                controller.selectedList
//                                                       .contains(controller
//                                                           .catList[index].id)
//                                                   ? 4
//                                                   : 0),
//                                           borderRadius:
//                                               BorderRadius.circular(100),
//                                         ),
//                                         child: ClipRRect(
//                                           borderRadius:
//                                               BorderRadius.circular(100.0),
//                                           child: CachedNetworkImage(
//                                             width: 60,
//                                             height: 60,
//                                             imageUrl:
//                                                 "${Constant.imageUrl}${controller.catList[index].image_path}/${controller.catList[index].image_name}",
//                                             fit: BoxFit.cover,
//                                             placeholder: (context, string) =>
//                                                 const Center(
//                                               child:
//                                                   CircularProgressIndicator(),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 5,
//                                       ),
//                                       Expanded(
//                                         child: Text(
//                                           controller.catList[index].type
//                                               .toString(),
//                                           textAlign: TextAlign.center,
//                                           style: const TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w400,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ));
//                             },
//                           ),
//                         ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           Get.offNamed(Routes.HOME);
//                         },
//                         child: Card(
//                           color: FixedColors.blue,
//                           elevation: 2,
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 15),
//                             child: Container(
//                               width: MediaQuery.of(context).size.width * 0.4,
//                               child: const Center(
//                                 child: Text(
//                                   "Skip",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 16),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           if (controller.selectedList.isEmpty) {
//                             Fluttertoast.showToast(
//                                 msg: "Please select atleast one games");
//                           } else {
//                             Get.toNamed(Routes.LOGIN,
//                                 arguments: controller.selectedList);
//                           }
//                         },
//                         child: Card(
//                           color: FixedColors.blue,
//                           elevation: 2,
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 15),
//                             child: Container(
//                               width: MediaQuery.of(context).size.width * 0.4,
//                               child: const Center(
//                                 child: Text(
//                                   "Login To Save",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// // saveGames(selectedList) async {
// //   final prefs = await SharedPreferences.getInstance();
// //   final data = selectedList.join();
// //   print(data);
// //   await prefs.setString('selectedGames', data);
// // }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:scoretab/app/data/shared/color.dart';
import 'package:scoretab/app/routes/app_pages.dart';
import '../../../data/shared/constant.dart';
import '../controllers/choicescreen_controller.dart';

class ChoicesScreenView extends StatefulWidget {
  const ChoicesScreenView({Key? key}) : super(key: key);

  @override
  State<ChoicesScreenView> createState() => _ChoicesScreenViewState();
}

class _ChoicesScreenViewState extends State<ChoicesScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        builder: (ChoicescreenController controller) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Center(
                    child: Text(
                      'Select Sports and Login for Notifications',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  controller.isLoading
                      ? Expanded(child: Container())

                      // Padding(
                      //     padding: EdgeInsets.symmetric(
                      //         vertical:
                      //             MediaQuery.of(context).size.height * 0.30),
                      //     child: const CupertinoActivityIndicator(),
                      //   )
                      : Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 1.2,
                                    crossAxisSpacing: 2,
                                    mainAxisSpacing: 10),
                            itemCount: controller.catList.length + 1,
                            itemBuilder: (BuildContext context, int index) {
                              if (index == controller.catList.length) {
                                return InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    if (controller.selectedList.length ==
                                        controller.catList.length) {
                                      controller.selectedList.clear();
                                    } else {
                                      controller.selectedList = controller
                                          .catList
                                          .map((e) => e.id)
                                          .toList();
                                    }
                                    controller.update();
                                  },
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: FixedColors.green,
                                                width:
                                                    controller.catList.length ==
                                                            controller
                                                                .selectedList
                                                                .length
                                                        ? 4
                                                        : 0),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100.0),
                                              child: Container(
                                                  width: 60,
                                                  height: 60,
                                                  child: Image.asset(
                                                      "assets/images/selectall.png"))),
                                        ),
                                        const SizedBox(height: 5),
                                        const Text(
                                          "Select All",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                              return InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    if (controller.selectedList.contains(
                                        controller.catList[index].id)) {
                                      controller.selectedList
                                          .remove(controller.catList[index].id);
                                    } else {
                                      controller.selectedList.add(
                                        controller.catList[index].id,
                                      );
                                    }
                                    controller.update();
                                  },
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: FixedColors.green,
                                              width: controller.selectedList
                                                      .contains(controller
                                                          .catList[index].id)
                                                  ? 4
                                                  : 0),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          child: CachedNetworkImage(
                                            width: 60,
                                            height: 60,
                                            imageUrl:
                                                "${Constant.imageUrl}${controller.catList[index].image_path}/${controller.catList[index].image_name}",
                                            fit: BoxFit.cover,
                                            placeholder: (context, string) =>
                                                const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Expanded(
                                        child: Text(
                                          controller.catList[index].type
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ));
                            },
                          ),
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.offNamed(Routes.HOME);
                        },
                        child: Card(
                          color: FixedColors.blue,
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: const Center(
                                child: Text(
                                  "Skip",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (controller.selectedList.isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Please select atleast one games");
                          } else {
                            Get.toNamed(Routes.LOGIN,
                                arguments: controller.selectedList);
                          }
                        },
                        child: Card(
                          color: FixedColors.blue,
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: const Center(
                                child: Text(
                                  "Login To Save",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// saveGames(selectedList) async {
//   final prefs = await SharedPreferences.getInstance();
//   final data = selectedList.join();
//   print(data);
//   await prefs.setString('selectedGames', data);
// }
