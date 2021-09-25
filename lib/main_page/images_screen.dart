// ignore: file_names

// import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:search/controllers/main_controller.dart';
// import 'package:google/src/main_page/widgets/list_tile.dart';

class ImageScreen extends StatefulWidget {
  final String query;
  ImageScreen({
    Key? key,
    required this.query,
  }) : super(key: key);

  @override
  State<ImageScreen> createState() => ImageScreenState();
}

class ImageScreenState extends State<ImageScreen> {
  @override
  void initState() {
    Provider.of<MainController>(context, listen: false)
        .searchImages(widget.query);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainController>(
      builder: (context, controller, child) {
        return Container(
          child: controller.images.isEmpty
              ? const Center(child: CupertinoActivityIndicator())
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: controller.images.length,
                  itemBuilder: (context, i) {
                    final element = controller.images[i];
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CupertinoPageScaffold(
                                child: Hero(
                                  tag: element.url!,
                                  child: PhotoView(
                                    imageProvider: CachedNetworkImageProvider(
                                      element.url!,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: element.url!,
                          child: CachedNetworkImage(
                              imageUrl: element.url!,
                              errorWidget: (context, url, error) =>
                                  Image.network(
                                    "https://images.pexels.com/photos/4271933/pexels-photo-4271933.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                                    fit: BoxFit.cover,
                                  ),
                              fit: BoxFit.cover),
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
