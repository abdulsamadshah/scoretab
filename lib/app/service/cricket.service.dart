import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scoretab/app/data/shared/utility.dart';
import 'package:scoretab/app/models/cricket.model.dart';

class CricketService {
  Future<List<CricketModel>> getAllCricket(dynamic selectedDate) async {
    try {
      Dio dio = Dio();
      Response response = await dio.get(
          "https://api.sportradar.us/cricket-t2/en/schedules/$selectedDate/schedule.json?api_key=wdhp3t2y3ewd97eycmcbct3h");
      var list = Utility.isNotNullEmptyOrFalse(response.data['sport_events'])
          ? response.data['sport_events']
          : [];
      List<CricketModel> listcricket = [];
      list.forEach((cric) {
        listcricket.add(CricketModel.fromJson(cric));
      });
      print(
          "______________________________SPORTS API CALLED ______________________________");
      print(listcricket);
      return listcricket;
    } catch (e) {
      Fluttertoast.showToast(
          msg: "No Game found on this Date",
          textColor: Colors.black,
          backgroundColor: Colors.red);
      return [];
    }
  }
}
