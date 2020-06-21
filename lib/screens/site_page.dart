import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class SitePage extends KFDrawerContent {
  SitePage({
    Key key,
  });

  @override
  _SitePageState createState() => _SitePageState();
}

class _SitePageState extends State<SitePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  child: Material(
                    shadowColor: Colors.transparent,
                    color: Colors.transparent,
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                      onPressed: widget.onMenuPressed,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('NOSSO SITE'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}