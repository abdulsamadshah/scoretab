import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:scoretab/app/data/shared/color.dart';
import '../../../data/shared/constant.dart';
import '../controllers/gamelist_controller.dart';

class GamelistView extends StatefulWidget {
  GamelistView({Key? key}) : super(key: key);

  @override
  State<GamelistView> createState() => _GamelistViewState();
}

class _GamelistViewState extends State<GamelistView> {
  @override
  final controller = Get.put(GameListController());

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: FixedColors.blue,
        title: const Text('Game List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GestureDetector(
          onVerticalDragUpdate: (details) {},
          onHorizontalDragUpdate: (details) {
            if (details.delta.direction > 0) {
              // controller.isLoading.value = true;
              controller.nextDatepressed(controller.gameList[0].date ?? "");
            }
            if (details.delta.direction <= 0) {
              // controller.isLoading.value = true;
              controller.previousDatepressed(controller.gameList[0].date ?? "");
            }
          },
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        // controller.isLoading.value = true;
                        controller.previousDatepressed(
                            controller.gameList[0].date ?? "");
                      },
                      icon: Icon(Icons.chevron_left, color: FixedColors.blue)),
                  Obx(() => controller.gameList.isNotEmpty
                          ?
                          //  Text(DateFormat("d MMM y").format(DateTime.tryParse(controller.gameList[0].date)),
                          //                                                     style: const TextStyle(
                          //                                                         fontSize: 14,
                          //                                                         fontWeight: FontWeight.w500),

                          Text(controller.gameList[0].date ?? "")
                          : Container()
                      // ):Container(),
                      ),
                  IconButton(
                      onPressed: () {
                        // controller.isLoading.value = true;
                        controller
                            .nextDatepressed(controller.gameList[0].date ?? "");
                      },
                      icon: Icon(Icons.chevron_right, color: FixedColors.blue)),
                ],
              ),
              Obx(
                () => controller.isLoading.value
                    ? Container()
                    //  const Center(child: CupertinoActivityIndicator())
                    : Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.gameList.length,
                          itemBuilder: (BuildContext context, int outergame) {
                            return controller
                                    .gameList[outergame].listGame!.isNotEmpty
                                ? InkWell(
                                    onTap: () {
                                      // Get.toNamed(Routes.DETAILSCREEN,
                                      //     arguments: {
                                      //       'data':
                                      //           controller.gameList[outergame]
                                      //     });
                                    },
                                    child: Card(
                                      color: FixedColors.blue,
                                      elevation: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        child: Column(
                                          children: [
                                            // Text(
                                            //   DateFormat.yMMMEd().format(
                                            //       DateTime.tryParse(controller
                                            //           .gameList[index]
                                            //           .listGame[index].!)!),
                                            //   style: const TextStyle(
                                            //       fontSize: 18,
                                            //       fontWeight: FontWeight.w500),
                                            // ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              controller.gameList[outergame]
                                                      .game ??
                                                  "",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(height: 10),
                                            ListView.builder(
                                                itemCount: controller
                                                    .gameList[outergame]
                                                    .listGame!
                                                    .length,
                                                shrinkWrap: true,
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int innergame) {
                                                  // ignore: prefer_is_empty
                                                  return (controller
                                                              .gameList[
                                                                  outergame]
                                                              .listGame!
                                                              .length >
                                                          0)
                                                      ? Card(
                                                          elevation: 3,
                                                          color: const Color
                                                                  .fromARGB(221,
                                                              255, 255, 255),
                                                          child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(15),
                                                              child: Column(
                                                                  children: [
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          DateFormat("d MMM y")
                                                                              // .yMMMd()
                                                                              .format(DateTime.tryParse(controller.gameList[outergame].listGame![innergame].matchDate!)!),
                                                                          style: const TextStyle(
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w900),
                                                                        ),
                                                                        controller.gameList[outergame].listGame?[innergame].time !=
                                                                                ""
                                                                            ? Text(
                                                                                DateFormat.jm().format(DateFormat("hh:mm").parse(controller.gameList[outergame].listGame?[innergame].time ?? "")),
                                                                                style: const TextStyle(fontWeight: FontWeight.w900),
                                                                              )
                                                                            : Container()
                                                                      ],
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Text(
                                                                      controller
                                                                              .gameList[outergame]
                                                                              .listGame?[innergame]
                                                                              .tournament ??
                                                                          "",
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    //start here
                                                                    (controller.gameList[outergame].listGame?[innergame].getOpp1 !=
                                                                                null &&
                                                                            controller.gameList[outergame].listGame?[innergame].getOpp2 !=
                                                                                null)
                                                                        ? Padding(
                                                                            padding:
                                                                                const EdgeInsets.symmetric(horizontal: 20),
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Column(
                                                                                  children: [
                                                                                    ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(100.0),
                                                                                      child: CachedNetworkImage(
                                                                                        width: 40,
                                                                                        height: 40,
                                                                                        imageUrl: controller.gameList[outergame].listGame?[innergame].getOpp1?.imagePath != null ? "${Constant.imageUrl}${controller.gameList[outergame].listGame?[innergame].getOpp1?.imagePath}/${controller.gameList[outergame].listGame![innergame].getOpp1?.imageName}" : "https://mobile.scoretab.in/no-image.png",
                                                                                        fit: BoxFit.cover,
                                                                                        placeholder: (context, string) => const Center(
                                                                                          child: CircularProgressIndicator(),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    const SizedBox(height: 10),
                                                                                    Text(
                                                                                      controller.gameList[outergame].listGame?[innergame].opponent1 ?? "",
                                                                                      style: const TextStyle(
                                                                                        fontSize: 14,
                                                                                        fontWeight: FontWeight.w400,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                const Text(
                                                                                  "VS",
                                                                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                                                                ),
                                                                                Column(
                                                                                  children: [
                                                                                    ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(100.0),
                                                                                      child: CachedNetworkImage(
                                                                                        width: 40,
                                                                                        height: 40,
                                                                                        imageUrl: controller.gameList[outergame].listGame?[innergame].getOpp2?.imagePath != null ? "${Constant.imageUrl}${controller.gameList[outergame].listGame?[innergame].getOpp2?.imagePath}/${controller.gameList[outergame].listGame![innergame].getOpp2?.imageName}" : "https://mobile.scoretab.in/no-image.png",
                                                                                        fit: BoxFit.cover,
                                                                                        placeholder: (context, string) => const Center(
                                                                                          child: CircularProgressIndicator(),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    const SizedBox(height: 10),
                                                                                    Text(
                                                                                      controller.gameList[outergame].listGame?[innergame].opponent2 ?? "",
                                                                                      style: const TextStyle(
                                                                                        fontSize: 14,
                                                                                        fontWeight: FontWeight.w400,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                )
                                                                              ],
                                                                            ),
                                                                          )
                                                                        : Padding(
                                                                            padding:
                                                                                const EdgeInsets.symmetric(horizontal: 20),
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                Container(
                                                                                  child: Text(
                                                                                    controller.gameList[outergame].listGame?[innergame].getOpp1?.teamName ?? "",
                                                                                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                                                                  ),
                                                                                ),
                                                                                const SizedBox(height: 10),
                                                                                ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(100.0),
                                                                                  child: CachedNetworkImage(
                                                                                    width: 40,
                                                                                    height: 40,
                                                                                    imageUrl: controller.gameList[outergame].listGame?[innergame].getOpp1?.imagePath != null ? "${Constant.imageUrl}${controller.gameList[outergame].listGame?[innergame].getOpp1?.imagePath}/${controller.gameList[outergame].listGame![innergame].getOpp1?.imageName}" : "https://mobile.scoretab.in/no-image.png",
                                                                                    fit: BoxFit.cover,
                                                                                    placeholder: (context, string) => const Center(
                                                                                      child: CircularProgressIndicator(),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),

                                                                    // const SizedBox(
                                                                    //   height: 5,
                                                                    // ),
                                                                    // Padding(
                                                                    //   padding: const EdgeInsets
                                                                    //           .symmetric(
                                                                    //       horizontal:
                                                                    //           12),
                                                                    //   child:
                                                                    //       Padding(
                                                                    //     padding:
                                                                    //         const EdgeInsets.symmetric(horizontal: 10),
                                                                    //     child:
                                                                    //         Row(
                                                                    //       // mainAxisAlignment:
                                                                    //       //     MainAxisAlignment
                                                                    //       //         .spaceBetween,
                                                                    //       children: [
                                                                    //         Text(
                                                                    //           controller.gameList[outergame].listGame?[innergame].opponent1 ?? "",
                                                                    //           style: const TextStyle(
                                                                    //             fontSize: 14,
                                                                    //             fontWeight: FontWeight.w400,
                                                                    //           ),
                                                                    //         ),
                                                                    //         Spacer(),
                                                                    //         Text(
                                                                    //           controller.gameList[outergame].listGame?[innergame].opponent2 ?? "",
                                                                    //           style: const TextStyle(
                                                                    //             fontSize: 14,
                                                                    //             fontWeight: FontWeight.w400,
                                                                    //           ),
                                                                    //         ),
                                                                    //       ],
                                                                    //     ),
                                                                    //   ),
                                                                    // ),

                                                                    const SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Text(
                                                                      controller
                                                                              .gameList[outergame]
                                                                              .listGame?[innergame]
                                                                              .race ??
                                                                          "",
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    ),

                                                                    const SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Text(
                                                                      controller
                                                                              .gameList[outergame]
                                                                              .listGame?[innergame]
                                                                              .venue ??
                                                                          "",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: const TextStyle(
                                                                          height:
                                                                              1.3,
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),

                                                                    Text(
                                                                      "${controller.gameList[outergame].listGame?[innergame].city}",
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),

                                                                    Text(
                                                                      controller
                                                                              .gameList[outergame]
                                                                              .listGame?[innergame]
                                                                              .details ??
                                                                          "",
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    ),

                                                                    const SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .symmetric(
                                                                          horizontal:
                                                                              10),
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          const Text(
                                                                            "Live Telecast on :",
                                                                            style:
                                                                                TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                5,
                                                                          ),
                                                                          Text(
                                                                            controller.gameList[outergame].listGame?[innergame].channel1 ??
                                                                                "",
                                                                            style:
                                                                                const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .symmetric(
                                                                          horizontal:
                                                                              10),
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          const Text(
                                                                            "OTT Platform:",
                                                                            style:
                                                                                TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                25,
                                                                          ),
                                                                          Text(
                                                                            controller.gameList[outergame].listGame?[innergame].ott1 ??
                                                                                "",
                                                                            style:
                                                                                const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                  ])))
                                                      : Container();
                                                }),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : Container();
                          },
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: controller.isAddLoaded.value
          ? Container(
              height: controller.bannerAd.size.height.toDouble(),
              width: controller.bannerAd.size.width.toDouble(),
              child: AdWidget(ad: controller.bannerAd),
            )
          : const SizedBox(),
    );
  }
}
