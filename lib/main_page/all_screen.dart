import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:search/controllers/main_controller.dart';
import 'package:search/main_page/images_screen.dart';
import 'package:search/screens/recent.dart';

import 'main_page_screen.dart';
import 'news_screen.dart';

class AllScreens extends StatefulWidget {
  final String query;
  const AllScreens({
    Key? key,
    required this.query,
  }) : super(key: key);

  @override
  _AllScreensState createState() => _AllScreensState();
}

class _AllScreensState extends State<AllScreens> {
  String query = "";
  int segmentedControlGroupValue = 0;
  PageController cont = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: CupertinoTextField(
                    readOnly: true,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Recents()));
                    },
                    placeholder: widget.query,
                    placeholderStyle: const TextStyle(color: Colors.black),
                    suffix: const Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: Icon(CupertinoIcons.search),
                    ),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                    ),
                  ),
                ),
                CupertinoSlidingSegmentedControl(
                    groupValue: segmentedControlGroupValue,
                    children: const {
                      0: Text("All"),
                      1: Text("Images"),
                      2: Text("News")
                    },
                    onValueChanged: (int? i) {
                      setState(() {
                        segmentedControlGroupValue = i!;
                      });
                      cont.animateToPage(i!,
                          duration: Duration(microseconds: 500),
                          curve: Curves.easeIn);
                    }),
                const SizedBox(height: 10),
                const Divider()
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: cont,
              onPageChanged: (i) {
                setState(() {
                  segmentedControlGroupValue = i;
                });
              },
              children: [
                ChangeNotifierProvider(
                  create: (context) => MainController(),
                  child: MainPageScreen(
                    query: widget.query,
                  ),
                ),
                ChangeNotifierProvider(
                  create: (context) => MainController(),
                  child: ImageScreen(
                    query: widget.query,
                  ),
                ),
                ChangeNotifierProvider(
                  create: (context) => MainController(),
                  child: NewsScreen(
                    query: widget.query,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
