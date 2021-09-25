import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:search/main_page/all_screen.dart';
import 'package:search/screens/widgets/list_tile.dart';

class Recents extends StatefulWidget {
  Recents({Key? key}) : super(key: key);

  @override
  State<Recents> createState() => _RecentsState();
}

class _RecentsState extends State<Recents> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CupertinoTextField(
                onChanged: (v) {
                  setState(() {
                    query = v;
                  });
                },
                onSubmitted: (v) {
                  var box = Hive.box('recents');

                  box.add(v);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AllScreens(query: v)),
                  );
                },
                placeholder: "Ask Anything.",
                placeholderStyle:
                    TextStyle(color: Colors.black.withOpacity(.5)),
                suffix: const Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Icon(CupertinoIcons.search),
                ),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Expanded(
              child: query.isEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: Hive.box('recents').length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final favorite = Hive.box('recents').getAt(index);
                        return CupertinoListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AllScreens(query: favorite)),
                            );
                          },
                          trailing: const Icon(CupertinoIcons.arrow_up_left),
                          onLongPress: () {
                            var box = Hive.box('recents');
                            box.deleteAt(index);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Recents()));
                          },
                          leading: const Icon(Icons.watch_later_outlined),
                          title: favorite,
                        );
                      },
                    )
                  : FutureBuilder(
                      future: getAutoCompleteList(query),
                      builder: (context, AsyncSnapshot snp) {
                        if (snp.hasData) {
                          final data = snp.data;
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, i) {
                              return CupertinoListTile(
                                onTap: () async {
                                  var box = Hive.box('recents');

                                  await box.add(snp.data![i]);
                                  print("done");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AllScreens(query: snp.data![i])),
                                  );
                                },
                                leading: const Icon(Icons.search),
                                title: snp.data![i],
                                trailing:
                                    const Icon(CupertinoIcons.arrow_up_left),
                              );
                            },
                          );
                        } else if (snp.hasError) {
                          return Container();
                        } else {
                          return Container();
                        }
                      }),
            )
          ],
        ),
      ),
    );
  }
}

Future<List> getAutoCompleteList(String query) async {
  var url =
      "https://contextualwebsearch-websearch-v1.p.rapidapi.com/api/spelling/AutoComplete?text=$query";

  final headers = {
    "x-rapidapi-host": "contextualwebsearch-websearch-v1.p.rapidapi.com",
    "x-rapidapi-key": " Api key"
  };
  var dio = Dio();
  var res = await dio.get(
    url,
    options: Options(
      headers: headers,
    ),
  );
  print(res);
  return res.data;
}
