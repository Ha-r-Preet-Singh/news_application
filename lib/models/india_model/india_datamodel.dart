import 'package:news_application/models/us_model/articles.dart';

class IndiaDataModel {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  IndiaDataModel({this.status, this.totalResults, this.articles});

  factory IndiaDataModel.fromJson(Map<String, dynamic> json) {
    List<Articles> mArticles = [];

    for (Map<String, dynamic> eachArticles in json["articles"]) {
      mArticles.add(Articles.fromJson(eachArticles));
    }
    return IndiaDataModel(
      status: json["status"],
      totalResults: json["totalResults"],
      articles: mArticles,
    );
  }
}
