import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:news_app/models/models.dart';

class NewsContainer extends StatelessWidget {
  const NewsContainer({
    Key? key,
    required this.news,
  }) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () async => await canLaunch(news.url!) ? await launch(news.url!) : throw 'Could not launch ',
        child: Stack(
          children: [
            _Background(news.urlImage),
            _Information(news),
          ],
        ),
      ),
    );
  }
}

class _Information extends StatelessWidget {
  
  final News news;
  
  const _Information( this.news );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      padding: const EdgeInsets.only(right: 10, left: 10, bottom: 5, top: 20),
      decoration: _boxDecoration(),
      child: Stack(
        children: [
          Text(
            news.title, 
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15), 
            maxLines: 3, 
            overflow: TextOverflow.ellipsis
          ),
          Positioned(
            bottom: 10,
            child: Text("Source: ${news.source}"),
          )
        ],
      )
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.black12,
          Colors.black87
        ]
      )
    );
  }
}



class _Background extends StatelessWidget {
  const _Background( this.image );

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: FadeInImage(
        height: 250,
        width: double.infinity,
        placeholder: const AssetImage('assets/loading.gif'), 
        image: NetworkImage(image),
        fit: BoxFit.cover,
      ),
    );
  }
}