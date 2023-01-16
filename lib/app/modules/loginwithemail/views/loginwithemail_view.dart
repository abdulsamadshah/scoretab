import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:scoretab/app/data/shared/appTheme.dart';
import 'package:scoretab/app/data/shared/color.dart';
import 'package:scoretab/app/data/shared/validator.dart';
import 'package:scoretab/app/modules/choicescreen/controllers/choicescreen_controller.dart';
import 'package:scoretab/app/routes/app_pages.dart';
import 'package:scoretab/app/service/userService.dart';

import '../controllers/loginwithemail_controller.dart';

class LoginwithemailView extends GetView<LoginwithemailController> {
  const LoginwithemailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: controller.logInKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  const Center(
                    child: Text(
                      "Login Here !",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins"),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  MyAppTheme.customizedTextFormField(
                    context,
                    controller: controller.emailcontroller,
                    validator: Validator.validateEmail,
                    hintText: "Email address",
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Color(0xff534A4A),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Obx(
                    () => TextFormField(
                      obscureText: controller.passwordVisible.value,
                      controller: controller.passwordcontroller,
                      validator: Validator.validatePassword,
                      onChanged: (val) {},
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(20),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.passwordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xff534A4A),
                          ),
                          onPressed: () {
                            controller.passwordVisible.value =
                                !controller.passwordVisible.value;
                          },
                        ),
                        hintText: "Password",
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color(0xff534A4A),
                        ),
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                                color: Colors.red)),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                                color: Color.fromARGB(255, 96, 96, 97))),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffe8e8e8), width: 1.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                          onTap: () {
                            print("Clickes");
                          },
                          child: Text("Forgot password?"))),
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      gotodashboard();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: FixedColors.blue,
                        //  color: const Color(0xff007A82),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 62,
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  gotodashboard() async {
    if (controller.logInKey.currentState!.validate()) {
      try {
        dynamic data = {
          "email": controller.emailcontroller.text,
          "password": controller.passwordcontroller.text,
          "sports_list": Get.find<ChoicescreenController>().selectedList
        };
        await UserService().login(data).then((loginRes) {
          if (loginRes == 200) {
            Fluttertoast.showToast(
                msg: 'Login successful', backgroundColor: Colors.greenAccent);
            Get.offNamed(Routes.HOME);
          } else if (loginRes == 400) {
            Fluttertoast.showToast(
                msg: 'Invalid Credentials', backgroundColor: Colors.red);
          } else if (loginRes == 300) {
            Fluttertoast.showToast(
                msg: 'user not found', backgroundColor: Colors.red);
          }
        });
      } catch (e) {
        Fluttertoast.showToast(msg: 'Something went wrong');
      }
    }
  }
}
