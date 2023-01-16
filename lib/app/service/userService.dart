import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scoretab/app/data/shared/constant.dart';
import 'package:scoretab/app/data/shared/utility.dart';
import 'package:scoretab/app/models/choice.model.dart';
import 'package:scoretab/app/models/usermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  Future<dynamic> login(dynamic data) async {
    try {
      Dio dio = Dio();
      Response response =
          await dio.post("${Constant.baseUrl}user-login", data: data);
      print("=====REQUEST BODY ${response.requestOptions.data}");
      if (response.data['success'] == true) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', response.data['accessToken']);
        // await prefs.remove('token');
        return 200; //user validated
      } else if (response.data['success'] == false &&
          response.data['message'] == "User not found") {
        return 300; //user not found
      } else if (response.data['success'] == false &&
          response.data['message'] == "Wrong Password") {
        return 400; //wrong password
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Something Went Wrong");
      return e;
    }
  }

  Future<dynamic> googleLogin(dynamic data) async {
    try {
      Dio dio = new Dio();
      Response response =
          await dio.post("${Constant.baseUrl}user-login", data: data);
      print(response.data);
      if (response.data['success'] == true) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', response.data['accessToken']);
        return 200; //user validated
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Something Went Wrong");
      return e;
    }
  }

  Future<dynamic> register(dynamic data) async {
    try {
      Dio dio = Dio();
      dio.options.headers['accept'] = 'application/json';
      // dio.options.headers["Content-Type"] = "multipart/form-data";
      Response response =
          await dio.post("${Constant.baseUrl}reg-user", data: data);
      print("=====REQUEST BODY ${response.requestOptions.data}");
      if (response.data['success'] == true) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', response.data['token']);
        Fluttertoast.showToast(
            msg: 'Register successful', backgroundColor: Colors.greenAccent);
        return 201;
      } else if (response.data['success'] == false) {
        Fluttertoast.showToast(
            msg: response.data['success_msg'],
            textColor: Colors.black,
            backgroundColor: Colors.red);
      }
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<dynamic> getUserDetail() async {
    try {
      Usermodel userdata = Usermodel();
      Dio dio = Dio();
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      dio.options.headers["authorization"] = "Bearer ${token!}";
      Response response = await dio.get("${Constant.baseUrl}user-profile");
      print("================${response.data}");
      if (response.data['success'] == true) {
        userdata = Usermodel.fromJson(response.data['user']);
        return userdata;
      } else {
        return 400; //user not found
      }
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> userDelete() async {
    try {
      Usermodel userdata = Usermodel();
      Dio dio = Dio();

      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      dio.options.headers['accept'] = 'application/json';
      dio.options.headers["authorization"] = "Bearer ${token}";
      final response = await dio.get('${Constant.baseUrl}delete-user');
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: 'Account Deleted', backgroundColor: Colors.greenAccent);
        return 200;
      }
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> updateSportList(selectedId) async {
    try {
      Usermodel userdata = Usermodel();
      Dio dio = new Dio();
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      dio.options.headers["authorization"] = "Bearer ${token!}";
      var endPoint = "";
      // var gamesid = "&sport_type[]";
      if (selectedId.isNotEmpty) {
        var query = "";
        for (var i = 0; i < selectedId.length; i++) {
          query += "&sport_type[${i}]=${selectedId[i]}&";
        }
        endPoint = "${Constant.baseUrl}updateUserSportList?$query";
      }
      print(endPoint);
      Response response = await dio.post(endPoint);

      if (response.data['success'] == true) {
        Fluttertoast.showToast(
            msg: 'Your Selected Games are Saved',
            backgroundColor: Colors.greenAccent);
        return 201;
      } else {
        Fluttertoast.showToast(
            msg: "Error While Saving Games",
            textColor: Colors.black,
            backgroundColor: Colors.red);
        return 300; //user not found
      }
    } catch (e) {
      return e;
    }
  }

  // Future<dynamic> updateUserSportList(data) async {
  //   try {
  //     Usermodel userdata = Usermodel();
  //     Dio dio = new Dio();
  //     final prefs = await SharedPreferences.getInstance();
  //     var token = prefs.getString('token');
  //     dio.options.headers["authorization"] = "Bearer ${token!}";
  //     Response response =
  //         await dio.post("${Constant.baseUrl}updateUserSportList", data: data);
  //     if (response.data['success'] == true) {
  //       Fluttertoast.showToast(
  //           msg: 'Your Selected Games are Saved',
  //           backgroundColor: Colors.greenAccent);
  //       return userdata;
  //     } else {
  //       Fluttertoast.showToast(
  //           msg: "Error While Saving Games",
  //           textColor: Colors.black,
  //           backgroundColor: Colors.red); //user not found
  //     }
  //   } catch (e) {
  //     return e;
  //   }
  // }

  Future<List<ChoiceModel>> getFilterSportType() async {
    try {
      Dio dio = Dio();
      dio.options.headers['accept'] = 'application/json';
      dio.options.headers["Content-Type"] = "multipart/form-data";
      Response response = await dio.get(
        "${Constant.baseUrl}getSportType",
      );
      List list = Utility.isNullEmptyOrFalse(response.data['data'])
          ? []
          : response.data['data'];

      List<ChoiceModel> listchoice = [];
      list.forEach((element) {
        listchoice.add(ChoiceModel.fromJson(element));
      });
      return listchoice;
    } catch (e) {
      Fluttertoast.showToast(msg: "Something Went Wrong");
      return [];
    }
  }
  // Future<dynamic> updateUserDetail(FormData data) async {
  //   try {
  //     Dio dio = new Dio();

  //     final prefs = await SharedPreferences.getInstance();
  //     var token = prefs.getString('token');
  //     dio.options.headers['accept'] = 'application/json';
  //     //  dio.options.headers['content-Type'] = 'application/json';
  //     dio.options.headers["authorization"] = "Bearer " + token!;
  //     Response response = await dio.post(
  //       "https://fgproduction.saamaancart.com/api/employer-profile/update",
  //       data: data,
  //     );
  //     if (response.data['success'] == true) {
  //       Fluttertoast.showToast(
  //           msg: response.data['success_msg'],
  //           backgroundColor: Colors.greenAccent,
  //           textColor: Colors.black);
  //       return 200;
  //     } else if (response.data['success'] == false) {
  //       Fluttertoast.showToast(
  //         msg: response.data['success_msg'],
  //       );
  //       return 300;
  //     } else {
  //       Fluttertoast.showToast(
  //           msg: response.data['success_msg'], backgroundColor: Colors.red);
  //       return 400; //user not found
  //     }
  //   } catch (e) {
  //     return e;
  //   }
  // }
}
