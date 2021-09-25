import 'provider.dart';

class ImageList {
  final List<Images> images;
  ImageList({
    required this.images,
  });

  factory ImageList.fromJson(json) =>
      ImageList(images: (json as List).map((e) => Images.fromJson(e)).toList());
}

class Images {
  String? url;
  int? height;
  int? width;
  String? thumbnail;
  int? thumbnailHeight;
  int? thumbnailWidth;
  String? base64Encoding;
  dynamic name;
  dynamic title;
  Provider? provider;
  dynamic imageWebSearchUrl;
  String? webpageUrl;

  Images({
    this.url,
    this.height,
    this.width,
    this.thumbnail,
    this.thumbnailHeight,
    this.thumbnailWidth,
    this.base64Encoding,
    this.name,
    this.title,
    this.provider,
    this.imageWebSearchUrl,
    this.webpageUrl,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        url: json['url'] as String?,
        height: json['height'] as int?,
        width: json['width'] as int?,
        thumbnail: json['thumbnail'] as String?,
        thumbnailHeight: json['thumbnailHeight'] as int?,
        thumbnailWidth: json['thumbnailWidth'] as int?,
        base64Encoding: json['base64Encoding'] as String?,
        name: json['name'] as dynamic?,
        title: json['title'] as dynamic?,
        provider: json['provider'] == null
            ? null
            : Provider.fromJson(json['provider'] as Map<String, dynamic>),
        imageWebSearchUrl: json['imageWebSearchUrl'] as dynamic?,
        webpageUrl: json['webpageUrl'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'height': height,
        'width': width,
        'thumbnail': thumbnail,
        'thumbnailHeight': thumbnailHeight,
        'thumbnailWidth': thumbnailWidth,
        'base64Encoding': base64Encoding,
        'name': name,
        'title': title,
        'provider': provider?.toJson(),
        'imageWebSearchUrl': imageWebSearchUrl,
        'webpageUrl': webpageUrl,
      };
}
