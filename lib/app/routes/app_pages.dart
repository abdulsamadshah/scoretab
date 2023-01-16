import 'package:get/get.dart';

import '../customscreen/splashscreen.dart';

import '../modules/choicescreen/bindings/choicescreen_binding.dart';
import '../modules/choicescreen/views/choicescreen_view.dart';
import '../modules/detailScreen/bindings/detail_screen_binding.dart';
import '../modules/detailScreen/views/detail_screen_view.dart';
import '../modules/editsportchoice/bindings/editsportchoice_binding.dart';
import '../modules/editsportchoice/views/editsportchoice_view.dart';
import '../modules/gamelist/bindings/gamelist_binding.dart';
import '../modules/gamelist/views/gamelist_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/loginwithemail/bindings/loginwithemail_binding.dart';
import '../modules/loginwithemail/views/loginwithemail_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.HOME;
  static const INITIAL = "/splashscreen";
  static final routes = [
    GetPage(
      name: "/splashscreen",
      page: () => Splashscreen(),
    ),
    GetPage(
      name: _Paths.DETAILSCREEN,
      page: () => DetailScreenView(),
      binding: DetailScreenBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CHOICESCREEN,
      page: () => const ChoicesScreenView(),
      binding: ChoicescreenBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGINWITHEMAIL,
      page: () => const LoginwithemailView(),
      binding: LoginwithemailBinding(),
    ),
    GetPage(
      name: _Paths.GAMELIST,
      page: () => GamelistView(),
      binding: GamelistBinding(),
    ),
    GetPage(
      name: _Paths.EDITSPORTCHOICE,
      page: () => const EditsportchoiceView(),
      binding: EditsportchoiceBinding(),
    ),
  ];
}
