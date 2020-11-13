import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:tttradionetwork/core/ui/error_internet_app.dart';
import 'package:tttradionetwork/widgets/web_show_schedule.dart';
import 'package:flutter_radio_player/flutter_radio_player.dart';
import 'package:tttradionetwork/core/util/image_helper.dart';
import 'package:tttradionetwork/widgets/web_instagram.dart';
import 'package:tttradionetwork/widgets/web_facebook.dart';
import 'package:tttradionetwork/core/util/str_helper.dart';
import 'package:tttradionetwork/pages/settings_page.dart';
import 'package:tttradionetwork/core/ui/loading_app.dart';
import 'package:tttradionetwork/core/mobx/mobx_home.dart';
import 'package:tttradionetwork/widgets/web_twitch.dart';
import 'package:tttradionetwork/core/ui/error_app.dart';
import 'package:tttradionetwork/widgets/web_staff.dart';
import 'package:tttradionetwork/widgets/web_chat.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';



class ChoiceCard extends StatelessWidget {
  final Choice choice;

  const ChoiceCard({Key key, this.choice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.display1;
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Card(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                choice.icon,
                size: 128.0,
              ),
              Text(choice.title, style: textStyle)
            ],
          ),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Settings', icon: Icons.settings),
];


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  var playerState = FlutterRadioPlayer.flutter_radio_paused;
  FlutterRadioPlayer _flutterRadioPlayer = new FlutterRadioPlayer();
  final String radioStream = "http://ec1.everestcast.host:2260/;stream.mp3";
  AnimationController _animationController;
  final MobxHome _mobxHome = MobxHome();
  Choice _selectedChoice = choices[0];
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
      // _animationController.repeat(reverse: true);
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


  Map<int, String> listRadio = {
    2: "https://www.twitch.tv/tttradionetwork",
    3: '<html><body><iframe src="https://calendar.google.com/calendar/embed?height=600&amp;wkst=1&amp;bgcolor=%23ffffff&amp;ctz=America%2FNew_York&amp;src=dHR0cmFkaW9uZXR3b3JrQGdtYWlsLmNvbQ&amp;color=%23039BE5" width="100%" height="100%" frameborder="0" scrolling="no"></iframe></body></html>',
    4: "https://tttradionetwork.com/chat",
    8: "https://www.facebook.com/groups/TTTRadioNetwork",
    9: "https://www.instagram.com/tttradionetwork",
    13: "https://tttradionetwork.com/staff",
  };

  List<Widget> _drawers(BuildContext context, int index) {
    List<Widget> widgets = [
      Container(
        height: 180,
        margin: const EdgeInsets.only(top: 12),
        child: Center(
          child: Image.asset(ImageHelper.LOGO,
            fit: BoxFit.cover,
          ),
        ),
      ),

      ListTile(
        onTap: () {
          print(StrHelper.TTT_RADIO + "$index");
          Navigator.of(context).pop();
          _mobxHome.setIndex(index);
        },
        tileColor: _mobxHome.index == index ? Colors.red.shade800.withOpacity(0.3) : null,
        title: Text(StrHelper.TTT_RADIO),
        leading: Icon(MdiIcons.accessPoint,
          color: Colors.black,
        ),
      ),

      ListTile(
        onTap: () {
          print(StrHelper.LIVE_DJ + "$index");
          Navigator.of(context).pop();
          _mobxHome.setIndex(index);
        },
        tileColor: _mobxHome.index == index ? Colors.red.shade800.withOpacity(0.3) : null,
        title: Text(StrHelper.LIVE_DJ),
        leading: Icon(MdiIcons.televisionPlay,
          color: Colors.black,
        ),
      ),

      ListTile(
        onTap: () {
          print(StrHelper.SHOW_SCHEDULE + "$index");
          Navigator.of(context).pop();
          _mobxHome.setIndex(index);
        },
        tileColor: _mobxHome.index == index ? Colors.red.shade800.withOpacity(0.3) : null,
        title: Text(StrHelper.SHOW_SCHEDULE),
        leading: Icon(MdiIcons.playBoxOutline,
          color: Colors.black,
        ),
      ),

      ListTile(
        onTap: () {
          print(StrHelper.CHAT + "$index");
          Navigator.of(context).pop();
          _mobxHome.setIndex(index);
        },
        tileColor: _mobxHome.index == index ? Colors.red.shade800.withOpacity(0.3) : null,
        title: Text(StrHelper.CHAT),
        leading: Icon(MdiIcons.chat,
          color: Colors.black,
        ),
      ),

      Divider(),
      Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Text(StrHelper.SOCIAL_MEDIA,
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(height: 8),
      ListTile(
        onTap: () {
          print(StrHelper.FACEBOOK + "$index");
          Navigator.of(context).pop();
          _mobxHome.setIndex(index);
        },
        tileColor: _mobxHome.index == index ? Colors.red.shade800.withOpacity(0.3) : null,
        title: Text(StrHelper.FACEBOOK),
        leading: Icon(MdiIcons.facebook,
          color: Colors.black,
        ),
      ),
      ListTile(
        onTap: () {
          print(StrHelper.INSTAGRAM + "$index");
          Navigator.of(context).pop();
          _mobxHome.setIndex(index);
        },
        tileColor: _mobxHome.index == index ? Colors.red.shade800.withOpacity(0.3) : null,
        title: Text(StrHelper.INSTAGRAM),
        leading: Icon(MdiIcons.instagram,
          color: Colors.black,
        ),
      ),

      Divider(),
      Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Text(StrHelper.CONTENT,
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(height: 8),
      ListTile(
        onTap: () {
          print(StrHelper.RESIDENT_DJ + "$index");
          Navigator.of(context).pop();
          _mobxHome.setIndex(index);
        },
        tileColor: _mobxHome.index == index ? Colors.red.shade800.withOpacity(0.3) : null,
        title: Text(StrHelper.RESIDENT_DJ),
        leading: Icon(MdiIcons.microphone,
          color: Colors.black,
        ),
      ),

      Divider(),
      Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Text(StrHelper.MISC,
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(height: 8),
      ListTile(
        onTap: () {
          print(StrHelper.SETTINGS + "$index");
          Navigator.of(context).pop();
          _mobxHome.setIndex(index);
        },
        tileColor: _mobxHome.index == index ? Colors.red.shade800.withOpacity(0.3) : null,
        title: Text(StrHelper.SETTINGS),
        leading: Icon(MdiIcons.cogOutline,
          color: Colors.black,
        ),
      ),
    ];
    return widgets;
  }

  _getDrawerItem(int pos) {
    switch (pos) {
      case 1:
        return Center(
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
                    StreamBuilder<String>(
                        stream: _flutterRadioPlayer.isPlayingStream,
                        initialData: playerState,
                        builder: (context, snapshot) {
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
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    // Observer(
                                    //   builder: (context) {
                                    //     return IconButton(
                                    //         onPressed: () async {
                                    //           // _mobxHome.checkRadioPlaying("${snapshot.data.toString()}");
                                    //           //
                                    //           // print("button press data: " + snapshot.data.toString());
                                    //           // print("button press data: " + snapshot.data.contains('flutter_radio_paused').toString());
                                    //           // print("button press data: " + _mobxHome.radioPlaying.toString());
                                    //
                                    //           await _flutterRadioPlayer.playOrPause();
                                    //
                                    //           // _mobxHome.radioPlaying ? await _flutterRadioPlayer.pause() :
                                    //           // await _flutterRadioPlayer.play();
                                    //           //snapshot.data == FlutterRadioPlayer.flutter_radio_playing ?
                                    //
                                    //           _mobxHome.radioPlaying ? _animationController.stop() :
                                    //           _animationController.repeat(reverse: true);
                                    //
                                    //           print("button press data: " + _mobxHome.radioPlaying.toString());
                                    //         },
                                    //         icon: _mobxHome.radioPlaying ? Icon(Icons.play_arrow, color: Colors.white, size: 30) :
                                    //         Icon(Icons.pause, color: Colors.white, size: 30),
                                    //     );
                                    //   },
                                    // ),
                                    IconButton(
                                      onPressed: () async {
                                        // _mobxHome.checkRadioPlaying("${snapshot.data.toString()}");
                                        //
                                        // print("button press data: " + snapshot.data.toString());
                                        // print("button press data: " + snapshot.data.contains('flutter_radio_paused').toString());
                                        // print("button press data: " + _mobxHome.radioPlaying.toString());

                                        // await _flutterRadioPlayer.playOrPause();

                                        // _mobxHome.radioPlaying ? await _flutterRadioPlayer.pause() :
                                        await _flutterRadioPlayer.play();
                                        //snapshot.data == FlutterRadioPlayer.flutter_radio_playing ?

                                        // _mobxHome.radioPlaying ? _animationController.stop() :
                                        _animationController.repeat(reverse: true);

                                        // print("button press data: " + _mobxHome.radioPlaying.toString());
                                      },
                                      icon: Icon(Icons.play_arrow, color: Colors.white, size: 30),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        _animationController.stop();
                                        await _flutterRadioPlayer.pause();
                                      },
                                      icon: Icon(Icons.pause, color: Colors.white, size: 30),
                                    ),
                                    IconButton(
                                        onPressed: () async {
                                          // _mobxHome.checkRadioPlaying("${snapshot.data}");
                                          // print('snapshot.data: ${snapshot.data}');
                                          await _flutterRadioPlayer.stop();
                                          _animationController.stop();
                                        },
                                        icon: Icon(Icons.stop, color: Colors.white, size: 30,)),
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
        );
      case 2:
        return WebTwitch(listRadio[pos]);
      case 3:
        return WebShowSchedule(listRadio[pos]);
      case 4:
        return WebChat(listRadio[pos]);
      case 8:
        return WebFacebook(listRadio[pos]);
      case 9:
        return WebInstagram(listRadio[pos]);
      case 13:
        return WebStaff(listRadio[pos]);
      case 17:
        return SettingsPage();
      default:
        return ErrorApp();
    }
  }

  void _select(Choice choice) {
    setState(() {
      _selectedChoice = choice;
    });
  }

  Future<bool> _onWillPop() async {
    if (_mobxHome.index !=  1) {
      _mobxHome.setIndex(1);
      return false;
    } else {
      return (await showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text('Are you sure?'),
          content: new Text('Do you want to exit an App'),
          actions: <Widget>[
            new FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: new Text('No'),
            ),
            new FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: new Text('Yes'),
            ),
          ],
        ),
      )) ?? false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Container(
          width:double.infinity,
          decoration: BoxDecoration(
          gradient:LinearGradient(
          colors: [
            Colors.red.shade300.withOpacity(0.7),
            Colors.red.shade300.withOpacity(0.5),
            Colors.red.shade600.withOpacity(0.4),
            Colors.red.shade700.withOpacity(0.4),
          //add more colors for gradient
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0, 0.2, 0.5, 0.8]
          )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(StrHelper.NAME_APP),
            actions: [
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () async {
                  Share.share(StrHelper.SHARE_TEXT,
                    subject: StrHelper.NAME_APP,
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () => _mobxHome.setIndex(17),
              ),

              /*
              PopupMenuButton<Choice>(
                onSelected: _select,
                itemBuilder: (BuildContext context) {
                  return choices.skip(2).map((Choice choice) {
                    return PopupMenuItem<Choice>(
                        value: choice,
                        child: Text(choice.title)
                    );
                  }).toList();
                },
              ),
               */
            ],
          ),
          drawer: Drawer(
            child: ListView.builder(
              itemCount: 18,
              itemBuilder: (context, index) {
                return Observer(
                  builder: (_) => _drawers(context, index)[index],
                );
              },
            ),
          ),
          body: StreamBuilder<DataConnectionStatus>(
            stream: DataConnectionChecker().onStatusChange,
            builder: (context, snapshot) {
              switch (snapshot.data) {
                case DataConnectionStatus.connected:
                  print('Data connection is available.');
                  return Observer(
                    builder: (context) => _getDrawerItem(_mobxHome.index),
                  );
                  break;
                case DataConnectionStatus.disconnected:
                  _animationController.stop();
                  _flutterRadioPlayer.stop();
                  print('You are disconnected from the internet.');
                  return ErrorInternetApp("No Internet");
                  break;
                default:
                  return LoadingApp();
              }
            },
          ),
        ),
      ),
    );
  }
}