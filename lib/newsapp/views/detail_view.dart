import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailViewScreen extends StatefulWidget {
  String newsUrl;
  DetailViewScreen({super.key, required this.newsUrl});

  @override
  State<DetailViewScreen> createState() => _DetailViewScreenState();
}

class _DetailViewScreenState extends State<DetailViewScreen> {




  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      widget.newsUrl = widget.newsUrl.contains("http:")
          ? widget.newsUrl.replaceAll("http:", "https:")
          : widget.newsUrl;
    });
  }

  final controller =WebViewController()
  ..setJavaScriptMode(JavaScriptMode.disabled)
  ..loadRequest((Uri.parse("")));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("NEWS")),
      body: WebViewWidget(controller: controller,)
    );
  }
}