import 'dart:convert';

class News {
  News({
    required this.source,
    required this.author,
    required this.title,
    this.description,
    this.url,
    required this.urlImage,
    this.publishedAt,
    this.content,
  });

  String source;
  String author;
  String title;
  String? description;
  String? url;
  String urlImage;
  DateTime? publishedAt;
  String? content;

  factory News.fromJson(String str) => News.fromMap(json.decode(str));


  factory News.fromMap(Map<String, dynamic> json) => News(
    source: json["source"]["name"] ?? 'Unknown',
    author: json["author"] ?? 'Unknown',
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlImage: json["urlToImage"] ?? 'http://i.stack.imgur.com/GNhxO.jpg',
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"],
  );

  // String toJson() => json.encode(toMap());

  // Map<String, dynamic> toMap() => {
  //     "author": author ?? 'Unknown',
  //     "title": title,
  //     "description": description,
  //     "url": url,
  //     "urlToImage": urlToImage,
  //     "publishedAt": publishedAt.toIso8601String(),
  //     "content": content,
  // };
}