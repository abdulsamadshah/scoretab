import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:scoretab/app/data/shared/authentication.dart';
import 'package:scoretab/app/data/shared/color.dart';
import 'package:scoretab/app/data/shared/google_sign_in_button.dart';
import 'package:scoretab/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late List<int> args;
  @override
  void initState() {
    args = Get.arguments;
    super.initState();
  }

  LoginController get loginController => Get.find<LoginController>();
  // final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(242, 255, 255, 255),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                "assets/images/sport-kids.png",
              ),
              const SizedBox(
                height: 100,
              ),
              FutureBuilder(
                future: Authentication.initializeFirebase(context: context),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Error initializing Firebase');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return GoogleSignInButton();
                  }
                  return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FixedColors.firebaseOrange,
                    ),
                  );
                },
              ),
              // Obx(() {
              //   if (loginController.googleAccount.value == null) {
              //     return buildSignIn();
              //   } else {
              //     return const LoginView();
              //   }
              // }),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  // Get.offNamed(Routes.HOME),
                  Fluttertoast.showToast(msg: "Currently Not Available");
                },
                child: Card(
                  elevation: 2,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/svg/apple.svg",
                          height: 35,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Continue With Apple',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            // color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => Get.toNamed(Routes.LOGINWITHEMAIL),
                //Get.offNamed(Routes.HOME),
                child: Card(
                  elevation: 2,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/svg/mail.svg",
                          height: 35,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Continue With Email',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            // color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.REGISTER);
                },
                child: const Text(
                  "New to Scoretab? Register here",
                  style: TextStyle(
                    // color: Colors.grey,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

//   buildSignIn() {
//     return OutlinedButton(
//       style: OutlinedButton.styleFrom(
//         side: const BorderSide(
//           color: Colors.transparent,
//         ),
//       ),
//       onPressed: () {
//         loginController.login();
//       },
//       // => Get.offNamed(Routes.HOME),
//       child: Card(
//         elevation: 2,
//         color: Colors.white,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SvgPicture.asset(
//                 "assets/images/svg/google.svg",
//                 height: 35,
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               const Text(
//                 'Continue With Google',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w400,
//                   // color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
}
