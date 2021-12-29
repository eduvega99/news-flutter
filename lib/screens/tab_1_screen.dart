import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_list.dart';
import 'package:news_app/widgets/widgets.dart';

import 'package:provider/provider.dart';

import 'package:news_app/providers/providers.dart';

class Tab1Screen extends StatefulWidget {

  const Tab1Screen({Key? key}) : super(key: key);

  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context); // Esto sobra?

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

  // Aquí evaluamos en qué momento queremos que no destruya el estado, para este caso siempre
  @override
  bool get wantKeepAlive => true;
}
