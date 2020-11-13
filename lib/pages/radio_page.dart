import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_radio_player/flutter_radio_player.dart';
import 'package:tttradionetwork/core/util/image_helper.dart';
import 'package:tttradionetwork/core/util/str_helper.dart';
import 'package:tttradionetwork/core/mobx/mobx_home.dart';
import 'package:tttradionetwork/core/util/constant.dart';
import 'package:tttradionetwork/pages/webview_page.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';
import 'dart:async';


class RadioPage extends StatefulWidget {
  @override
  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> with TickerProviderStateMixin {


  var playerState = FlutterRadioPlayer.flutter_radio_paused;
  FlutterRadioPlayer _flutterRadioPlayer = new FlutterRadioPlayer();
  final String radioStream = "http://ec1.everestcast.host:2260/;stream.mp3";
  AnimationController _animationController;
  final MobxHome _mobxHome = MobxHome();
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _initRadioService();
    _initAnimation();
  }

  void _initAnimation() {
    try {
      if (_animationController == null) {
        _animationController = AnimationController(
          vsync: this,
          duration: Duration(seconds: 2),
        );
      }

      if (_animation == null) {
        _animation = Tween(begin: 0.0, end: 12.0).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
        );
      }
      _animationController.repeat(reverse: true);
    } catch(e) {
      _animationController?.dispose();
      print('error initAnimation -> $e');
    }
  }

  Future<void> _initRadioService() async {
    try {
      await _flutterRadioPlayer.init(
          StrHelper.NAME_APP, "Live", radioStream, "false");
    } on PlatformException {
      print("Exception occurred while trying to register the services.");
    }
  }

  @override
  void dispose() {
    if (_animationController != null) {
      _animationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.stop();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 22),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    StreamBuilder<String>(
                        initialData: "",
                        stream: _flutterRadioPlayer.metaDataStream,
                        builder: (context, snapshot) {
                          if (snapshot.data.isNotEmpty) {
                            int indexStart = snapshot.data.indexOf('title="');
                            int indexEnd = snapshot.data.indexOf('",');
                            final track = snapshot.data.substring(indexStart+7, indexEnd) ?? '';
                            return Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text('$track',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            );
                          } else return Container();
                        }),
                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                child: Container(
                  padding: const EdgeInsets.all(0),
                  margin: const EdgeInsets.all(0),
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width - 250,
                  height: MediaQuery.of(context).size.width - 250,
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, _) {
                      return Ink(
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              for (int i = 1; i <= 2; i++)
                                BoxShadow(
                                  color: Colors.white.withOpacity(_animationController.value / 2),
                                  spreadRadius: _animation.value * i + 30,
                                )
                            ],
                          ),
                          child: Image.asset(ImageHelper.LOGO,
                            fit: BoxFit.contain,
                          )
                      );
                    },
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Observer(
                    builder: (_) => Row(
                      children: [
                        Expanded(
                          child: Slider(
                              value: _mobxHome.volume,
                              min: 0, max: 1.0,
                              inactiveColor: Colors.grey.shade600,
                              activeColor: Colors.white,
                              onChanged: (value) {
                                _mobxHome.onChangedVolume(value);
                                _flutterRadioPlayer.setVolume(_mobxHome.volume);
                              }
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Text("Volume: " + (_mobxHome.volume * 100).toStringAsFixed(0),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  StreamBuilder(
                      stream: _flutterRadioPlayer.isPlayingStream,
                      initialData: playerState,
                      builder: (context, AsyncSnapshot<String> snapshot) {
                        String returnData = snapshot.data;
                        print("object data: " + returnData);
                        switch (returnData) {
                          case FlutterRadioPlayer.flutter_radio_stopped:
                            return RaisedButton.icon(
                              icon: Icon(MdiIcons.radio),
                              color: Colors.white,
                              textColor: Colors.red.shade800,
                              label: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 14,
                                ),
                                child: Text('Start listening now'),
                              ),
                              onPressed: () async {
                                await _initRadioService();
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16.0),
                                ),
                              ),
                            );
                            break;
                          case FlutterRadioPlayer.flutter_radio_loading:
                            return Text("Loading stream...",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            );
                          case FlutterRadioPlayer.flutter_radio_error:
                            return RaisedButton(
                                child: Text("Retry ?"),
                                onPressed: () async {
                                  await _initRadioService();
                                });
                            break;
                          default:
                            return Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                      onPressed: () async {
                                        print("button press data: " +
                                            snapshot.data.toString());
                                        await _flutterRadioPlayer.playOrPause();
                                        snapshot.data == FlutterRadioPlayer.flutter_radio_playing ?
                                        _animationController.stop() : _animationController.repeat(reverse: true);
                                      },
                                      icon: snapshot.data == FlutterRadioPlayer.flutter_radio_playing
                                          ? Icon(Icons.pause, color: Colors.white, size: 30,)
                                          : Icon(Icons.play_arrow, color: Colors.white, size: 30,)),
                                  IconButton(
                                      onPressed: () async {
                                        await _flutterRadioPlayer.stop();
                                        _animationController.stop();
                                      },
                                      icon: Icon(Icons.stop, color: Colors.white, size: 30,))
                                ]);
                            break;
                        }
                      }),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
