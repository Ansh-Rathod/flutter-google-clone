import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:search/all_web_model/image.dart';
import 'package:search/all_web_model/web_search.dart';

class WebRepositories {
  final headers = {
    "x-rapidapi-host": "contextualwebsearch-websearch-v1.p.rapidapi.com",
    "x-rapidapi-key": "Api key"
  };
  Future<WebSearchList> getWebSearch(String query) async {
    var url =
        "https://contextualwebsearch-websearch-v1.p.rapidapi.com/api/Search/WebSearchAPI?q=${query}&pageNumber=1&pageSize=50&autoCorrect=true";

    var dio = Dio();
    var res = await dio.get(
      url,
      options: Options(
        headers: headers,
      ),
    );
    print(res);
    return WebSearchList.fromJson(res.data);
  }

  Future<WebSearchList> getNewsSearch(String query) async {
    var url =
        "https://contextualwebsearch-websearch-v1.p.rapidapi.com/api/search/NewsSearchAPI?q=$query&pageNumber=1&pageSize=50&autoCorrect=true&withThumbnails=true&fromPublishedDate=null&toPublishedDate=null";

    var dio = Dio();
    var res = await dio.get(
      url,
      options: Options(
        headers: headers,
      ),
    );
    print(res);
    return WebSearchList.fromJson(res.data);
  }

  Future<ImageList> getImagesSearch(String query) async {
    var url =
        "https://contextualwebsearch-websearch-v1.p.rapidapi.com/api/Search/ImageSearchAPI?q=$query&pageNumber=1&pageSize=50&autoCorrect=true";

    var dio = Dio();
    var res = await dio.get(
      url,
      options: Options(
        headers: headers,
      ),
    );

    return ImageList.fromJson(res.data['value']);
  }
}
