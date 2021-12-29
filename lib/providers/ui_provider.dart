import 'package:flutter/material.dart';

class UIProvider extends ChangeNotifier {

  int _selectedPage = 0;
  final PageController _pageController = PageController();
  
  int get selectedPage => _selectedPage; 

  set selectedPage(int value) {
    _selectedPage = value;
    pageController.animateToPage(value, duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => _pageController;

}