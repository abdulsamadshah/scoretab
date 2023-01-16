import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
   final GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  var passwordVisible = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    usernamecontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
