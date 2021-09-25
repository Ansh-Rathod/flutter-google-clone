// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:search/all_web_model/image.dart';
import 'package:search/all_web_model/web_search.dart';
import 'package:search/repositories/web_repo.dart';

class MainController with ChangeNotifier {
  List<WebSearch> searchList = [];
  List<WebSearch> newsList = [];
  List<Images> images = [];

  final repo = WebRepositories();
  void search(String query) async {
    var wholelLst = await repo.getWebSearch(query);
    searchList = wholelLst.allSearches;
    notifyListeners();
  }

  void news(String query) async {
    var wholelLst = await repo.getNewsSearch(query);
    newsList = wholelLst.allSearches;
    notifyListeners();
  }

  void searchImages(String query) async {
    var wholelLst = await repo.getImagesSearch(query);
    images = wholelLst.images;
    notifyListeners();
  }
}
