import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search/screens/recent.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "http://source.unsplash.com/random/1600x900?nature,water",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CupertinoTextField(
                readOnly: true,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Recents()));
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
            )
          ],
        ),
      ),
    );
  }
}
