import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:news_app/models/models.dart';

class NewsProvider extends ChangeNotifier {

  final String _apiKey = '70c0db59ebf6439f828e1e30a604e8b8';
  final String _baseUrl = 'newsapi.org';
  final String _country = 'ca'; // Referncia a Cnadá porque no está disponible españa
  String _selectedCategory = 'general';

  List<News> topNews = [];
  List<News> categoryNews = [];

  bool isLoadingCategories = false;


  NewsProvider() {
    getTopNews();
    getNewsCategory('general');
  }

  List<Category> categories = [
    Category('general', Icons.lightbulb, Icons.lightbulb_outline, Colors.blue),
    Category('business', Icons.business_center, Icons.business_center_outlined, Colors.deepPurple),
    Category('entertainment', Icons.movie_creation, Icons.movie_creation_outlined, Colors.blueGrey),
    Category('health', Icons.local_hospital, Icons.local_hospital_outlined, Colors.red),
    Category('science', Icons.science, Icons.science_outlined, Colors.green),
    Category('sports', Icons.sports_basketball, Icons.sports_basketball_outlined, Colors.deepOrange),
    Category('technology', Icons.settings, Icons.settings_outlined, Colors.indigo)
  ];

  String get selectedCategory => _selectedCategory;
  
  set selectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  } 

  Future getTopNews() async {
    final Uri url = Uri.https(_baseUrl, 'v2/top-headlines', {
      'apiKey' : _apiKey,
      'country' : _country
    });

    final response = await http.get(url);
    final newsResponse = NewsResponse.fromJson(response.body);
    topNews = newsResponse.newsList;
    notifyListeners();
  }
  

  Future getNewsCategory(String category) async {
    final Uri url = Uri.https(_baseUrl, 'v2/top-headlines', {
      'apiKey'   : _apiKey,
      'country'  : _country,
      'category' : category
    });

    isLoadingCategories = true;
    notifyListeners();

    final response = await http.get(url);
    final newsResponse = NewsResponse.fromJson(response.body);
    categoryNews = newsResponse.newsList;

    isLoadingCategories = false;
    notifyListeners();
  }

}