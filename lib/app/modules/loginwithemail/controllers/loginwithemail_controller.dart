import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginwithemailController extends GetxController {
  //  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  var passwordVisible = true.obs;
  late final deviceId;
  final GlobalKey<FormState> logInKey = GlobalKey<FormState>();
  @override
  void onInit() {
    // getDeviceId();
    super.onInit();
  }

  getDeviceId() async {
    FirebaseMessaging.instance.getToken().then((value) {
      deviceId = value;
    });
  }

  @override
  void dispose() {
    // usernamecontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
