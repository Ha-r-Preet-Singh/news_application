import 'package:news_application/models/us_model/articles.dart';

class UsDataModel {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  UsDataModel({this.status, this.totalResults, this.articles});

  factory UsDataModel.fromJson(Map<String, dynamic> json) {
    List<Articles> mArticles = [];

    for (Map<String, dynamic> eachArticles in json["articles"]) {
      mArticles.add(Articles.fromJson(eachArticles));
    }
    return UsDataModel(
      status: json["status"],
      totalResults: json["totalResults"],
      articles: mArticles,
    );
  }
}
