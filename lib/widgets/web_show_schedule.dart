import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:tttradionetwork/core/ui/error_internet_app.dart';
import 'package:tttradionetwork/core/mobx/mobx_home.dart';
import 'package:tttradionetwork/core/ui/loading_app.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';


class WebShowSchedule extends StatelessWidget {

  final String url;
  WebShowSchedule(this.url);

  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: Uri.dataFromString(url, mimeType: 'text/html').toString(),
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

