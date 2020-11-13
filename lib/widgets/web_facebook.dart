import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:tttradionetwork/core/ui/error_internet_app.dart';
import 'package:tttradionetwork/core/mobx/mobx_home.dart';
import 'package:tttradionetwork/core/ui/loading_app.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';


class WebFacebook extends StatelessWidget {

  final String url;
  WebFacebook(this.url);

  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        javascriptMode: JavascriptMode.disabled,
        initialUrl: url,
        // onWebViewCreated: (controller) async {
        //   if (_controller == null) {
        //     _controller = controller;
        //   }
        // },
      ),
      /*
      body: StreamBuilder<DataConnectionStatus>(
        stream: DataConnectionChecker().onStatusChange,
        builder: (context, snapshot) {
          switch (snapshot.data) {
            case DataConnectionStatus.connected:
              print('Data connection is available.');
              return WebView(
                javascriptMode: JavascriptMode.disabled,
                initialUrl: url,
                onWebViewCreated: (controller) async {
                  if (_controller == null) {
                    _controller = controller;
                  }
                },
              );
              break;
            case DataConnectionStatus.disconnected:
              print('You are disconnected from the internet.');
              return ErrorInternetApp("No Internet");
              break;
            default:
              return LoadingApp();
          }
        },
      ),

       */
    );
  }
}

