import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scoretab/app/data/shared/constant.dart';
import 'package:scoretab/app/data/shared/utility.dart';
import 'package:scoretab/app/models/choice.model.dart';

class ChoiceService {
  Future<List<ChoiceModel>> getcategories() async {
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
      print(response.data);

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
}
