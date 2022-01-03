import 'package:js/js.dart';

import 'package:flutter/material.dart';
import 'package:newsapp/model/news_papers.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  static const routeName = "/webview";
  const WebviewScreen({Key? key}) : super(key: key);

  @override
  _WebviewScreenState createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  bool _isLoading = true;
  WebViewController? _controller;
  @override
  Widget build(BuildContext context) {
    NewsPaper newsPaper =
        ModalRoute.of(context)!.settings.arguments as NewsPaper;
    return Scaffold(
      appBar: AppBar(
        title: Text(newsPaper.title!),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: "https://" + newsPaper.link!,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller) {
              _controller = controller;
            },
            onPageFinished: (finish) {
              setState(() {
                _isLoading = false;
              });
            },
          )
        ],
      ),
    );
  }
}
