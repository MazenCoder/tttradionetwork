import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:tttradionetwork/core/ui/error_internet_app.dart';
import 'package:tttradionetwork/core/mobx/mobx_home.dart';
import 'package:tttradionetwork/core/ui/loading_app.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';


class WebviewPage extends StatelessWidget {

  final int index;
  WebviewPage(this.index);

  WebViewController _controller;

  Map<int, String> listRadio = {
    2: "https://www.twitch.tv/tttradionetwork",
    3: "https://tttradionetwork.com",
    4: "https://tttradionetwork.com/chat",
    8: "https://www.facebook.com/groups/TTTRadioNetwork",
    9: "https://www.instagram.com/tttradionetwork",
    13: "https://tttradionetwork.com/staff",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DataConnectionStatus>(
        stream: DataConnectionChecker().onStatusChange,
        builder: (context, snapshot) {
          switch (snapshot.data) {
            case DataConnectionStatus.connected:
              print('Data connection is available.');
              return WebView(
                javascriptMode: JavascriptMode.disabled,
                initialUrl: listRadio[index],
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
    );
  }
}
