// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:async' show Future;
//
// class PreferenceUtils {
//
//   static Future<SharedPreferences> get _instance async => _prefsInstance ??= await SharedPreferences.getInstance();
//   static SharedPreferences _prefsInstance;
//   static PreferenceUtils _preferenceUtils;
//
//   // call this method from iniState() function of mainApp().
//   static Future<PreferenceUtils> init() async {
//     if (_prefsInstance == null) {
//       _prefsInstance = await _instance;
//     }
//     if (_preferenceUtils == null) {
//       _preferenceUtils = PreferenceUtils();
//     }
//     return _preferenceUtils;
//   }
//
//   static String getString(String key, [String defValue]) {
//     return _prefsInstance.getString(key) ?? defValue ?? "";
//   }
//
//   static bool containsKey(String key, [bool defValue]) {
//     return _prefsInstance.containsKey(key) ?? defValue ?? false;
//   }
//
//   static Future<bool> setString(String key, String value) async {
//     return await _prefsInstance?.setString(key, value) ?? Future.value(false);
//   }
//
//   static Future<bool> removeKey(String key, [bool defValue]) async {
//     return await _prefsInstance.remove(key) ?? defValue ?? false;
//   }
//
//   static List<String> getKeys() {
//     return _prefsInstance.getKeys().toList();
//   }
//
//   // static PreferenceUtils _instance;
//   // static SharedPreferences _preferences;
//   // static Future<PreferenceUtils> getInstance() async {
//   //   if (_instance == null) {
//   //     _instance = PreferenceUtils();
//   //   }
//   //   if (_preferences == null) {
//   //     _preferences = await SharedPreferences.getInstance();
//   //   }
//   //   return _instance;
//   // }
// }