import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scoretab/app/data/shared/constant.dart';
import 'package:scoretab/app/data/shared/utility.dart';
import 'package:scoretab/app/models/gamesondate.model.dart';

class HomeService {
  Future<List<GamesOnDateModel>> getGamesBetweenRange(
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
            "${Constant.baseUrl}getSportTypeForCalendar?start_date=$startDate&end_date=$endDate$query";
      } else {
        endPoint =
            "${Constant.baseUrl}getSportTypeForCalendar?start_date=$startDate&end_date=$endDate";
      }
      Response response = await dio.get(endPoint);
      List list = Utility.isNullEmptyOrFalse(response.data['match_data'])
          ? []
          : response.data['match_data'];
      List<GamesOnDateModel> listchoice = [];
      list.forEach((element) {
        listchoice.add(GamesOnDateModel.fromJson(element));
      });
      return listchoice;
    } catch (e) {
      Fluttertoast.showToast(msg: "Something Went Wrong");
      return [];
    }
  }
}
