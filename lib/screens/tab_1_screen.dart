import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_list.dart';
import 'package:news_app/widgets/widgets.dart';

import 'package:provider/provider.dart';

import 'package:news_app/providers/providers.dart';

class Tab1Screen extends StatelessWidget {
  const Tab1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final newsProvider = Provider.of<NewsProvider>(context);
    
    return Scaffold(
      body: newsProvider.topNews.isEmpty
        ? const Center( child:  CircularProgressIndicator() )
        : SafeArea(
          child: RefreshIndicator(
              onRefresh: () => newsProvider.getTopNews(),
              child: NewsList(newsList: newsProvider.topNews) 
          ),
        )
    );
  }
}
