import 'image.dart';
import 'provider.dart';

class WebSearchList {
  final List<WebSearch> allSearches;
  WebSearchList({
    required this.allSearches,
  });

  factory WebSearchList.fromJson(json) => WebSearchList(
        allSearches:
            (json['value'] as List).map((e) => WebSearch.fromJson(e)).toList(),
      );
}

class WebSearch {
  String? id;
  String? title;
  String? url;
  String? description;
  String? body;
  String? snippet;
  String? keywords;
  String? language;
  bool? isSafe;
  DateTime? datePublished;
  Provider? provider;
  Images? image;

  WebSearch({
    this.id,
    this.title,
    this.url,
    this.description,
    this.body,
    this.snippet,
    this.keywords,
    this.language,
    this.isSafe,
    this.datePublished,
    this.provider,
    this.image,
  });

  factory WebSearch.fromJson(Map<String, dynamic> json) => WebSearch(
        id: json['id'] as String?,
        title: json['title'] as String?,
        url: json['url'] as String?,
        description: json['description'] as String?,
        body: json['body'] as String?,
        snippet: json['snippet'] as String?,
        keywords: json['keywords'] as String?,
        language: json['language'] as String?,
        isSafe: json['isSafe'] as bool?,
        datePublished: json['datePublished'] == null
            ? null
            : DateTime.parse(json['datePublished'] as String),
        provider: json['provider'] == null
            ? null
            : Provider.fromJson(json['provider'] as Map<String, dynamic>),
        image: json['image'] == null
            ? null
            : Images.fromJson(json['image'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'url': url,
        'description': description,
        'body': body,
        'snippet': snippet,
        'keywords': keywords,
        'language': language,
        'isSafe': isSafe,
        'datePublished': datePublished?.toIso8601String(),
        'provider': provider?.toJson(),
        'image': image?.toJson(),
      };
}
