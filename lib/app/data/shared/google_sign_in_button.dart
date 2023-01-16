import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:scoretab/app/modules/login/controllers/login_controller.dart';

LoginController get loginController => Get.find<LoginController>();

class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0),
      child: _isSigningIn
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              onPressed: () {
                loginController.login();
                setState(() {
                  _isSigningIn = true;
                });

                // User? user =
                //     await Authentication.signInWithGoogle(context: context);

                setState(() {
                  _isSigningIn = false;
                });

                // if (user != null) {
                //   Navigator.of(context).push(
                //     MaterialPageRoute(
                //       builder: (context) => loginController.login(),
                //     ),
                //   );
                // }
              },
              child: Container(
                height: 60,
                width: 600,
                child: Card(
                  elevation: 2,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/svg/google.svg",
                          height: 35,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Continue With Google',
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
            ),
    );
  }
}
