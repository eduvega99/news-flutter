import 'package:flutter/material.dart';
import 'package:news_app/models/models.dart';
import 'package:news_app/providers/providers.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    Key? key,
    required this.newsProvider,
  }) : super(key: key);

  final NewsProvider newsProvider;

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: newsProvider.categories.length,
      itemBuilder: ( _ , int index) {
        
        Category category = newsProvider.categories[index]; 
        final isSelected = newsProvider.selectedCategory == category.name;
        
        IconData icon = isSelected ? category.selectedIcon : category.unselectedIcon;
        
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: GestureDetector(
            onTap: () {
              newsProvider.selectedCategory = category.name;
              newsProvider.getNewsCategory(category.name);
            },
            child: _CustomButton(category: category, icon: icon, isSelected: isSelected),
          ),
        );
      },
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton({
    Key? key,
    required this.category,
    required this.icon,
    required this.isSelected,
  }) : super(key: key);

  final Category category;
  final IconData icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: _containerDecoration(),
      child: Row(
        children: [
          Icon(icon, color: isSelected ? Colors.white : category.color),
          const SizedBox(width: 10),
          Text(category.name, style: TextStyle(color: isSelected ? Colors.white : category.color))
        ],
      ),
    );
  }

  BoxDecoration _containerDecoration() {
    return BoxDecoration(
      border: Border.all(color: category.color),
      borderRadius: BorderRadius.circular(20),
      color: isSelected ? category.color : Colors.black26,
    );
  }
}