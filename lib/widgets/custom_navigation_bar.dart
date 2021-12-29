import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:news_app/providers/providers.dart';


class CustomNavigationBar extends StatelessWidget {

  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UIProvider>(context);

    return Container(
      decoration: _shadow(),
      child: BottomNavigationBar(
        currentIndex: uiProvider.selectedPage,
        onTap: (index) => uiProvider.selectedPage = index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'Last News'
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Categories'
          ),
        ],
      ),
    );
  }

  BoxDecoration _shadow() {
    return const BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black54,
          blurRadius: 15,
          offset: Offset(0, 0.75)
        )
      ]
    );
  }
}