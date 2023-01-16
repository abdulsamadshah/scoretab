import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scoretab/app/data/shared/constant.dart';
import 'package:scoretab/app/data/shared/utility.dart';
import 'package:scoretab/app/models/allgames.model.dart';

class GameService {
  Future<List<AllGamesModel>> getAllGames(
      startDate, endDate, selectedGamesId) async {
    try {
      Dio dio = Dio();
      dio.options.headers['accept'] = 'application/json';
      dio.options.headers["Content-Type"] = "multipart/form-data";
      var endPoint = "";
      var gamesid = "&sport_type[]=";
      if (selectedGamesId.isNotEmpty) {
        var query = "";
        for (var i = 0; i < selectedGamesId.length; i++) {
          query += gamesid + selectedGamesId[i].toString();
        }
        endPoint =
            "${Constant.baseUrl}getSportListForDateAndSport?start_date=$startDate&end_date=$endDate$query";
      } else {
        endPoint =
            "${Constant.baseUrl}getSportListForDateAndSport?start_date=$startDate&end_date=$endDate";
      }
      Response response = await dio.get(endPoint);
      var list = Utility.isNotNullEmptyOrFalse(response.data['match_data'])
          ? response.data['match_data']
          : [];
      List<AllGamesModel> listGames = [];
      list.forEach((game) {
        listGames.add(AllGamesModel.fromJson(game));
      });
      print(listGames);
      return listGames;
    } catch (e) {
      Fluttertoast.showToast(
        msg: "No Game found on this Date",
        textColor: Colors.black,
        backgroundColor: Colors.red,
      );
      return [];
    }
  }

  Future<List<AllGamesModel>> nextDatePressed(startDate) async {
    try {
      Dio dio = Dio();
      Response response = await dio
          .get("${Constant.baseUrl}getNextDateList?start_date=$startDate");
      var list = Utility.isNotNullEmptyOrFalse(response.data['match_data'])
          ? response.data['match_data']
          : [];
      List<AllGamesModel> listGames = [];
      list.forEach((game) {
        listGames.add(AllGamesModel.fromJson(game));
      });

      print(listGames);
      return listGames;
    } catch (e) {
      Fluttertoast.showToast(
          msg: "No Game found on this Date",
          textColor: Colors.black,
          backgroundColor: Colors.red);
      return [];
    }
  }

  Future<List<AllGamesModel>> previousDatePressed(startDate) async {
    try {
      Dio dio = Dio();
      Response response = await dio
          .get("${Constant.baseUrl}getPreviousDateList?start_date=$startDate");
      var list = Utility.isNotNullEmptyOrFalse(response.data['match_data'])
          ? response.data['match_data']
          : [];
      List<AllGamesModel> listGames = [];
      list.forEach((game) {
        listGames.add(AllGamesModel.fromJson(game));
      });

      print(listGames);
      return listGames;
    } catch (e) {
      Fluttertoast.showToast(
          msg: "No Game found on this Date",
          textColor: Colors.black,
          backgroundColor: Colors.red);
      return [];
    }
  }
}
