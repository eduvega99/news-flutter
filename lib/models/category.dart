import 'package:flutter/material.dart';

class Category {
  
  final String name;
  final IconData selectedIcon;
  final IconData unselectedIcon;
  final Color color;

  Category(this.name, this.selectedIcon, this.unselectedIcon, this.color);

}