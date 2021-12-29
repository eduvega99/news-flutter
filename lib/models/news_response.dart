import 'dart:convert';

import 'package:news_app/models/new.dart';

class NewsResponse {
    NewsResponse({
      required this.totalResults,
      required this.newsList,
    });

    int totalResults;
    List<News> newsList;

    factory NewsResponse.fromJson(String str) => NewsResponse.fromMap(json.decode(str));

    factory NewsResponse.fromMap(Map<String, dynamic> json) => NewsResponse(
      totalResults: json["totalResults"],
      newsList: List<News>.from(json["articles"].map((x) => News.fromMap(x))),
    );
}