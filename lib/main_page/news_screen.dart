// ignore: file_names
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search/controllers/main_controller.dart';
import 'package:search/main_page/widgets/list_tile.dart';

class NewsScreen extends StatefulWidget {
  final String query;
  NewsScreen({
    Key? key,
    required this.query,
  }) : super(key: key);
  static const routeName = '/main_page';

  @override
  State<NewsScreen> createState() => NewsScreenState();
}

class NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    Provider.of<MainController>(context, listen: false).news(widget.query);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainController>(
      builder: (context, controller, child) {
        return Container(
          child: controller.newsList.isEmpty
              ? const Center(child: CupertinoActivityIndicator())
              : ListView.builder(
                  itemCount: controller.newsList.length,
                  itemBuilder: (context, i) {
                    final element = controller.newsList[i];
                    return SearchResultTile(
                      result: element,
                    );
                  },
                ),
        );
      },
    );
  }
}
