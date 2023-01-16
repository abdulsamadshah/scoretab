import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scoretab/app/routes/app_pages.dart';
import 'package:scoretab/app/service/userService.dart';
import '../../choicescreen/controllers/choicescreen_controller.dart';

class LoginController extends GetxController {
  var googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  login() async {
    googleAccount.value = await googleSignIn.signIn();
    try {
      dynamic data = {
        "email": googleAccount.value!.email,
        "login_type": "google",
        "displayName": googleAccount.value!.displayName,
        "sports_list": Get.find<ChoicescreenController>().selectedList,
      };
      await UserService().googleLogin(data).then((loginRes) async {
        if (loginRes == 200) {
          Fluttertoast.showToast(
              msg: 'Login successful', backgroundColor: Colors.greenAccent);
          Get.offNamed(Routes.HOME);
          // final prefs = await SharedPreferences.getInstance();
          // var selectedGames = await prefs.getString('selectedGames');
          // var gameslist = selectedGames!.split("");
          // dynamic selectedgames = {"sport_type": gameslist};
          // UserService().updateUserSportList(selectedgames);
        } else {
          Fluttertoast.showToast(
              msg: 'Email is blacklisted', backgroundColor: Colors.red);
        }
      });
    } catch (e) {
      Fluttertoast.showToast(msg: 'Something went wrong');
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
