import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoretab/app/data/shared/dialog.dart';
import 'package:scoretab/app/data/shared/images.dart';
import 'package:scoretab/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  late StreamSubscription<ConnectivityResult> connectivityListener;
  @override
  void initState() {
    checkToken();
    checkForRoute();
    super.initState();
  }

checkForRoute() async {
    Connectivity().checkConnectivity().then((value) {
      if (value == ConnectivityResult.none) {
        print("+++++++++++++++++++++++++++++++++++++No internet");
        DialogBox.connectivityDialog(context, CustomImages.logo);
      }
    });

    // If internet is not available then, this Listener will make sure to keep user out put app.
    connectivityListener =
        Connectivity().onConnectivityChanged.listen((event) async {
      if (event == ConnectivityResult.none) {
         print("+++++++++++++++++++++++++++++++++++++No internet Closed");
        DialogBox.connectivityDialog(context, CustomImages.logo);
      }
    });
}
  Future<Timer> checkToken() async {
    
    var duration = const Duration(seconds: 3);
    return Timer(duration, loginRoute);
  }

  void loginRoute() async {
    final prefs = await SharedPreferences.getInstance();
    var token = await prefs.getString('token');
    if (token == null) {
       Get.offNamed(Routes.CHOICESCREEN);
     } else {
    Get.offNamed(Routes.HOME);
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/SplashScreen.jpg'),
                fit: BoxFit.cover)),
      ),
    );
  }
  }
