import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_application/models/india_model/india_datamodel.dart';


class IndiaApiHelper {

  Future<dynamic>? getIndiaApi({ required String Cat}) async {

    Uri mUrl = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=$Cat&apiKey=3e6b4603907d4aa78580ab57f3a272c9");
    var res = await http.get(mUrl);

    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      return json;
    } else {
      IndiaDataModel();
    }
  }
}



