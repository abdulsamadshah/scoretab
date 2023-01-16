import 'dart:io';
import 'package:flutter/material.dart';
import 'package:scoretab/app/data/shared/appTheme.dart';

enum ExitAction { YES, NO }

class DialogBox {
  static Future<ExitAction?> exitDialog(BuildContext context) {
    return showDialog<ExitAction>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: Center(
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Text(
                    'Are you sure you want to exit?',
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.normal,
                        fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("NO",
                              style: TextStyle(color: Colors.black))),
                    ),
                    SizedBox(
                      width: 140,
                      child: MyAppTheme.roundOutlinedTextButton(
                        onPressed: () {
                          exit(0);
                        },
                        btnText: "YES",
                        textSize: 14,
                        textColor: Colors.white,
                        // buttonColor: Theme.of(context).primaryColor
                        buttonColor: const Color.fromARGB(244, 112, 74, 250),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<ExitAction?> confirmDialog(
      BuildContext context, String message, Function()? callback) {
    return showDialog<ExitAction>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Text(
                    message.toString(),
                    style: const TextStyle(
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.normal,
                        fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("NO",
                              style: TextStyle(color: Colors.black))),
                    ),
                    SizedBox(
                      width: 140,
                      child: MyAppTheme.roundOutlinedTextButton(
                        onPressed: callback
                        // exit(0);
                        ,
                        btnText: "YES",
                        textSize: 14,
                        textColor: Colors.white,
                        buttonColor: const Color.fromARGB(255, 0, 63, 141),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<Widget?> okDialog(BuildContext context, String message,
      {onPressed}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32))),
            title: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 15.0),
                    child: Text(
                      message,
                      style: const TextStyle(
                          fontFamily: 'poppins',
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: 35,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: const Color(0xff007A82),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          minimumSize: Size(
                              MediaQuery.of(context).size.width * 0.95, 40.0)),
                      onPressed: () {
                        Navigator.pop(context);
                        onPressed();
                      },

                      // textColor: Colors.white,
                      child: const Text(
                        "OK",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<dynamic> connectivityDialog(
      BuildContext context, AssetImage image) {
    return showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          title: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image(
                    image: image,
                    height: 90.0,
                    // width: 90.0,
                    fit: BoxFit.fill,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                  child: Text(
                    "Oops!",
                    style: TextStyle(
                        fontFamily: 'Sfpro',
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 15.0),
                  child: Text(
                    "No Internet Connection",
                    style: TextStyle(
                        fontFamily: 'Sfpro',
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
