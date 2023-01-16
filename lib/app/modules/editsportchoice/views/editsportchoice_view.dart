import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoretab/app/data/shared/color.dart';
import 'package:scoretab/app/data/shared/constant.dart';
import 'package:scoretab/app/models/choice.model.dart';
import 'package:scoretab/app/models/usermodel.dart';
import 'package:restart_app/restart_app.dart';
import 'package:scoretab/app/service/choice.service.dart';
import 'package:scoretab/app/service/userService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditsportchoiceView extends StatefulWidget {
  const EditsportchoiceView({Key? key}) : super(key: key);

  @override
  State<EditsportchoiceView> createState() => _EditsportchoiceViewState();
}

class _EditsportchoiceViewState extends State<EditsportchoiceView> {
  @override
  void initState() {
    getName();
    getFilterSportType();
    super.initState();
  }

  List<int> selectedIds = [];
  List<ChoiceModel> GamesList = [];
  bool isGamesLoading = true;
  Usermodel? userdata = Usermodel();
    var token;
  getName() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
   
      await UserService().getUserDetail().then((value) {
        userdata = value;
      });
      if (userdata!.sportsList != null) {
        selectedIds = userdata!.sportsList!.split(",").map(int.parse).toList();
        setState(() { });
      
    }
  }

  getFilterSportType() async {
    try {
      final cats = await ChoiceService().getcategories();
      GamesList = cats;
      isGamesLoading = false;
      setState(() {});
    } catch (e) {
      isGamesLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        children: [
          const SizedBox(height: 40),
          const Center(
            child: Text(
              'Edit Sports',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 30),
          isGamesLoading
              ?Expanded(child: Container())
              //  Padding(
              //     padding: EdgeInsets.symmetric(
              //         vertical: MediaQuery.of(context).size.height * 0.30),
              //     child: const CupertinoActivityIndicator(),
              //   )
              : Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: GamesList.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == GamesList.length) {
                        return InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            if (selectedIds.length ==
                                GamesList.length) {
                              selectedIds.clear();
                            } else {
                              selectedIds = GamesList
                                  .map((e) => e.id)
                                  .toList();
                            }
                          setState(() { });
                          },
                          child: Column(
                            children: [
                              const SizedBox(height: 5),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: FixedColors.green,
                                    width: GamesList.length ==
                                          selectedIds.length
                                        ? 4
                                        : 0
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Container(
                                        width: 58,
                                        height: 58,
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
                        );
                      }
                      return InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            if (selectedIds.contains(GamesList[index].id)) {
                              selectedIds.remove(GamesList[index].id);
                            } else {
                              selectedIds.add(
                                GamesList[index].id,
                              );
                            }
                            print(selectedIds);
                           setState(() {
                             
                           });
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
                                      width: selectedIds
                                              .contains(GamesList[index].id)
                                          ? 4
                                          : 0),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: CachedNetworkImage(
                                    width: 58,
                                    height: 58,
                                    imageUrl:
                                        "${Constant.imageUrl}${GamesList[index].image_path}/${GamesList[index].image_name}",
                                    fit: BoxFit.cover,
                                    placeholder: (context, string) =>
                                        const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Expanded(
                                child: Text(
                                  GamesList[index].type.toString(),
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
          const SizedBox(height: 10),
          InkWell(
            onTap: () async{
             await UserService().updateSportList(selectedIds);
             Restart.restartApp();
              // Get.offNamed(Routes.HOME);
              Get.back();
            },
            child: Card(
              color: FixedColors.blue,
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Center(
                    child: Text(
                      "Save",
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
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    )));
  }
}
