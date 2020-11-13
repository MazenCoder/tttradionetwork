// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_home.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MobxHome on MobxHomeBase, Store {
  final _$volumeAtom = Atom(name: 'MobxHomeBase.volume');

  @override
  double get volume {
    _$volumeAtom.reportRead();
    return super.volume;
  }

  @override
  set volume(double value) {
    _$volumeAtom.reportWrite(value, super.volume, () {
      super.volume = value;
    });
  }

  final _$alertAtom = Atom(name: 'MobxHomeBase.alert');

  @override
  bool get alert {
    _$alertAtom.reportRead();
    return super.alert;
  }

  @override
  set alert(bool value) {
    _$alertAtom.reportWrite(value, super.alert, () {
      super.alert = value;
    });
  }

  final _$indexAtom = Atom(name: 'MobxHomeBase.index');

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  final _$urlAtom = Atom(name: 'MobxHomeBase.url');

  @override
  String get url {
    _$urlAtom.reportRead();
    return super.url;
  }

  @override
  set url(String value) {
    _$urlAtom.reportWrite(value, super.url, () {
      super.url = value;
    });
  }

  final _$radioPlayingAtom = Atom(name: 'MobxHomeBase.radioPlaying');

  @override
  bool get radioPlaying {
    _$radioPlayingAtom.reportRead();
    return super.radioPlaying;
  }

  @override
  set radioPlaying(bool value) {
    _$radioPlayingAtom.reportWrite(value, super.radioPlaying, () {
      super.radioPlaying = value;
    });
  }

  final _$MobxHomeBaseActionController = ActionController(name: 'MobxHomeBase');

  @override
  void onChangedVolume(double val) {
    final _$actionInfo = _$MobxHomeBaseActionController.startAction(
        name: 'MobxHomeBase.onChangedVolume');
    try {
      return super.onChangedVolume(val);
    } finally {
      _$MobxHomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIndex(int val) {
    final _$actionInfo = _$MobxHomeBaseActionController.startAction(
        name: 'MobxHomeBase.setIndex');
    try {
      return super.setIndex(val);
    } finally {
      _$MobxHomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUrl(String val) {
    final _$actionInfo =
        _$MobxHomeBaseActionController.startAction(name: 'MobxHomeBase.setUrl');
    try {
      return super.setUrl(val);
    } finally {
      _$MobxHomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkRadioPlaying(String val) {
    final _$actionInfo = _$MobxHomeBaseActionController.startAction(
        name: 'MobxHomeBase.checkRadioPlaying');
    try {
      return super.checkRadioPlaying(val);
    } finally {
      _$MobxHomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
volume: ${volume},
alert: ${alert},
index: ${index},
url: ${url},
radioPlaying: ${radioPlaying}
    ''';
  }
}
