import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_application/api/urls/urls.dart';
import 'package:news_application/models/us_model/us_datamodel.dart';

class UsApiHelper {
  Future<dynamic>? getUsApi() async {
    Uri mUrl = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=3e6b4603907d4aa78580ab57f3a272c9");
    var res = await http.get(mUrl);

    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      return json;
    } else {
      UsDataModel();
    }
  }
}
