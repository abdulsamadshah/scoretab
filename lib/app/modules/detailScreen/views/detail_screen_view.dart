import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_screen_controller.dart';

class DetailScreenView extends GetView<DetailScreenController> {
  DetailScreenView({Key? key}) : super(key: key);
  @override
  final controller = Get.put(DetailScreenController());
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${controller.cricdata.competitors![0].abbreviation}vs ${controller.cricdata.competitors![1].abbreviation}",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Obx(
          () => controller.isLoading.value
              ? const Center(child: CupertinoActivityIndicator())
              : Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${controller.cricdata.competitors![0].name}vs ${controller.cricdata.competitors![1].name} ${controller.cricdata.season?.name} ${controller.cricdata.tournament?.gender}",
                      style:
                          const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.calendar_month),
                        Text(
                          controller.cricdata.scheduled.toString(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        // Icon(Icons.schedule),
                        // Expanded(
                        //   child: Text(
                        //     "1:30 PM",
                        //     style: TextStyle(
                        //         fontSize: 18, fontWeight: FontWeight.w500),
                        //   ),
                        // )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on),
                        Expanded(
                          child: Text(
                            controller.cricdata.venue!.name.toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Capacity:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Expanded(
                          child: Text(
                            controller.cricdata.venue!.capacity.toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Row(
                    //   children: const [
                    //     Text(
                    //       "Umpires:",
                    //       style: TextStyle(
                    //           fontSize: 20, fontWeight: FontWeight.w600),
                    //     ),
                    //     Expanded(
                    //       child: Text(
                    //         "Nitin Menon, Langton Rusere",
                    //         style: TextStyle(
                    //             fontSize: 18, fontWeight: FontWeight.w500),
                    //       ),
                    //     )
                    //   ],
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Row(
                    //   children: const [
                    //     Text(
                    //       "Third Umpire:",
                    //       style: TextStyle(
                    //           fontSize: 20, fontWeight: FontWeight.w600),
                    //     ),
                    //     Expanded(
                    //       child: Text(
                    //         "Rod Tucker",
                    //         style: TextStyle(
                    //             fontSize: 18, fontWeight: FontWeight.w500),
                    //       ),
                    //     )
                    //   ],
                    // ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
