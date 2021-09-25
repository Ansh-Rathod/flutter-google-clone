import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:search/all_web_model/web_search.dart';
import 'package:search/main_page/web_view.dart';
import 'package:search/styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../main.dart';

class SearchResultTile extends StatelessWidget {
  final WebSearch result;

  const SearchResultTile({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebSiteView(
              url: result,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  result.url!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.url,
                ),
                const SizedBox(
                  height: 10,
                ),
                image(context),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  result.title!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Styles.heading,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  result.description!,
                ),
              ],
            ),
          ),
          const Divider(
            height: 2,
            thickness: 2,
          )
        ],
      ),
    );
  }

  Widget image(BuildContext context) {
    return result.image!.url! != ""
        ? GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CupertinoPageScaffold(
                    child: Hero(
                      tag: result.image!.url!,
                      child: PhotoView(
                        imageProvider:
                            CachedNetworkImageProvider(result.image!.url!),
                      ),
                    ),
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl: result.image!.url!,
                errorWidget: (context, url, error) => Image.network(
                  "https://images.pexels.com/photos/4271933/pexels-photo-4271933.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        : Container();
  }
}
