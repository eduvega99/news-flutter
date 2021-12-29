import 'package:flutter/material.dart';
import 'package:news_app/providers/ui_provider.dart';
import 'package:news_app/screens/screens.dart';
import 'package:news_app/widgets/widgets.dart';

import 'package:provider/provider.dart';


class TabsScreen extends StatelessWidget {

  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // final newsProvider = Provider.of<NewsProvider>(context);

    return Scaffold(
        body: _Pages(),
        bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}


class _Pages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);

    return PageView(
      // physics: const BouncingScrollPhysics(),
      physics: const NeverScrollableScrollPhysics(),
      controller: uiProvider.pageController,
      children: const [
        Tab1Screen(),
        Tab2Screen()
      ],
    );
  }
}