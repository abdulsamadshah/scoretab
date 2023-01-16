import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:scoretab/app/data/shared/color.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayColor: Colors.black54,
      overlayWidget: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 1,
        ),
      ),
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "ScoreTab",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          // darkTheme: ThemeData.dark(),
          // themeMode: ThemeMode.system,
          theme: ThemeData(
              fontFamily: 'din',
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.blue,
              ),
              appBarTheme:
                  AppBarTheme(backgroundColor: FixedColors.blue, elevation: 0),
              textTheme:
                  const TextTheme(button: TextStyle(color: Colors.white)),
              iconTheme: const IconThemeData(color: Colors.blue),
              textButtonTheme: TextButtonThemeData(
                  style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              )),
              outlinedButtonTheme: OutlinedButtonThemeData(
                  style: ButtonStyle(
                      side: MaterialStateProperty.all(BorderSide(
                        color: Colors.blue[300]!,
                      )),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.blue[300]!,
                          ),
                          borderRadius: BorderRadius.circular(10))))),
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 16)),
                      fixedSize: MaterialStateProperty.all(Size(Get.width, 50)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shadowColor:
                          MaterialStateProperty.all<Color>(Colors.blue))))),
    );
  }
}
