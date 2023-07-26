import 'package:flutter/material.dart';
import 'package:webview_all/webview_all.dart';

class MyBrowser extends StatefulWidget {
  const MyBrowser({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  MyBrowserState createState() => MyBrowserState();
}

class MyBrowserState extends State<MyBrowser> {
  @override
  Widget build(BuildContext context) {
    return const Center(
        // Look here!
        child: Webview(url: "https://www.wechat.com/en"));
  }
}
