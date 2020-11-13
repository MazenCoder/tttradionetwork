import 'package:flutter_radio_player/flutter_radio_player.dart';
import 'package:mobx/mobx.dart';
import 'package:tttradionetwork/core/util/static.dart';

part 'mobx_home.g.dart';

class MobxHome = MobxHomeBase with _$MobxHome;

abstract class MobxHomeBase with Store {

  @observable
  double volume = 0.8;

  @observable
  bool alert = false;

  @action
  void onChangedVolume(double val) {
    this.volume = val;
  }


  @observable
  int index = 1;

  @action
  setIndex(int val) => this.index = val;

  @observable
  String url = '';

  @action
  setUrl(String val) => this.url = val;

  @observable
  bool radioPlaying = Static.radioPlaying;

  @action
  void checkRadioPlaying(String val) {
    if (val == FlutterRadioPlayer.flutter_radio_playing) {
      Static.radioPlaying = true;
      this.radioPlaying = true;
    } else {
      Static.radioPlaying = false;
      this.radioPlaying = false;
    }
  }

  // void checkRadioPlaying(String val) => this.radioPlaying = val.contains('flutter_radio_paused') ?? false;

}