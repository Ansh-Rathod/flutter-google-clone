// ignore: file_names

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search/controllers/main_controller.dart';
import 'package:search/main_page/widgets/list_tile.dart';

class MainPageScreen extends StatefulWidget {
  final String query;
  MainPageScreen({
    Key? key,
    required this.query,
  }) : super(key: key);
  static const routeName = '/main_page';

  @override
  State<MainPageScreen> createState() => MainPageScreenState();
}

class MainPageScreenState extends State<MainPageScreen> {
  @override
  void initState() {
    Provider.of<MainController>(context, listen: false).search(widget.query);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainController>(
      builder: (context, controller, child) {
        return Container(
          child: controller.searchList.isEmpty
              ? const Center(child: CupertinoActivityIndicator())
              : ListView.builder(
                  itemCount: controller.searchList.length,
                  itemBuilder: (context, i) {
                    final element = controller.searchList[i];
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
