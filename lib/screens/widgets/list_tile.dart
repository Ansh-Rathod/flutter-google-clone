import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoListTile extends StatefulWidget {
  final Widget leading;
  final String title;
  final String? subtitle;
  final Widget trailing;
  final Function onTap;
  final Function? onLongPress;
  const CupertinoListTile({
    Key? key,
    required this.leading,
    required this.title,
    this.subtitle,
    required this.trailing,
    required this.onTap,
    this.onLongPress,
  }) : super(key: key);

  @override
  _StatefulStateCupertino createState() => _StatefulStateCupertino();
}

class _StatefulStateCupertino extends State<CupertinoListTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      onLongPress: () {
        widget.onLongPress!();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    widget.leading,
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.title,
                            style: const TextStyle(
                              color: CupertinoColors.black,
                              fontSize: 18,
                            )),
                        widget.subtitle != null
                            ? Text(widget.subtitle!,
                                style: const TextStyle(
                                  color: CupertinoColors.systemGrey,
                                  fontSize: 15,
                                ))
                            : Container(),
                      ],
                    ),
                  ],
                ),
                widget.trailing,
              ],
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
