import 'package:flutter/material.dart';

import 'package:news_app/models/models.dart';
import 'package:news_app/widgets/widgets.dart';

class NewsList extends StatefulWidget {

  final List<News> newsList;
  
  const NewsList({
    Key? key, 
    required this.newsList
  }) : super(key: key);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: widget.newsList.length,
      itemBuilder: ( _ , int index) {
        return NewsContainer(news: widget.newsList[index]);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

