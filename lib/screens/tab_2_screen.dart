import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:provider/provider.dart';

import 'package:news_app/providers/providers.dart';
import 'package:news_app/widgets/widgets.dart';


class Tab2Screen extends StatelessWidget {
  
  const Tab2Screen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Categories', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            SizedBox(
              height: 35,
              width: double.infinity,
              child: CategoriesList(newsProvider: newsProvider)
            ),

            const SizedBox(height: 15),
            Expanded(
              child: newsProvider.isLoadingCategories
                ? const Center( child:  CircularProgressIndicator() )
                : SafeArea(
                  child: RefreshIndicator(
                      onRefresh: () => newsProvider.getTopNews(),
                      child: NewsList(newsList: newsProvider.categoryNews)
                  ),
                )
            )
          ]
        ),
      )
    );
  }

}