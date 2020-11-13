// import 'package:inoface_lescopains/features/informations/presentation/widgets/details_informations.dart';
// import 'package:inoface_lescopains/features/evenements/presentation/widgets/details_evenement.dart';
// import 'package:inoface_lescopains/features/home/domain/entities/notification_entity.dart';
// import 'package:inoface_lescopains/features/agenda/presentation/pages/agenda_page.dart';
// import 'package:inoface_lescopains/core/injection/injection_container.dart';
// import 'package:inoface_lescopains/core/database/app_database.dart';
// import 'package:inoface_lescopains/core/util/flash_helper.dart';
// import 'package:inoface_lescopains/core/ui/loading_dialog.dart';
// import 'package:inoface_lescopains/core/mobx/mobx_home.dart';
// import 'package:inoface_lescopains/core/util/app_utils.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:inoface_lescopains/core/util/keys.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'dart:io';
//
//
//
// class FirebaseNotifications {
//   FirebaseMessaging _firebaseMessaging;
//   bool isOnMessage = false;
//   MobxHome _mobx;
//   AppDatabase db;
//
//   void setUpFirebase([BuildContext context, MobxHome mobx]) {
//     if (_firebaseMessaging == null) {
//       _firebaseMessaging = FirebaseMessaging();
//     }
//     firebaseCloudMessaging_Listeners(context);
//     if(context != null) {
//       this.db = Provider.of<AppDatabase>(context, listen: false);
//     }
//
//     if(mobx != null) {
//       this._mobx = mobx;
//     }
//   }
//
//   void firebaseCloudMessaging_Listeners([BuildContext context]) {
//     try {
//       if (Platform.isIOS) iOS_Permission();
//
//       _firebaseMessaging.configure(
//         onMessage: (Map<String, dynamic> message) async {
//           if(message.isNotEmpty) {
//             print('on message $message');
//             final entity = NotificationEntity.fromJson(message);
//             if (entity != null) {
//               return _showDialogNotification(context, entity);
//             }
//           }
//         },
//         onResume: (Map<String, dynamic> message) async {
//           if(message.isNotEmpty) {
//             print('on message resume $message');
//             final entity = NotificationEntity.fromJson(message);
//             if (entity != null) {
//               return _checkTypeMessage(context, entity);
//             }
//           }
//         },
//         onLaunch: (Map<String, dynamic> message) async {
//           if(message.isNotEmpty) {
//             print('on message launch $message');
//             final entity = NotificationEntity.fromJson(message);
//             if (entity != null) {
//               return _checkTypeMessage(context, entity);
//             }
//           }
//         },
//         onBackgroundMessage: Platform.isAndroid ? myBackgroundMessageHandler : null,
//       );
//     } catch(_) {}
//   }
//
//   Future<String> getToken([BuildContext context]) async {
//     try {
//       if(_firebaseMessaging == null) {
//         setUpFirebase(context);
//       }
//       if (Platform.isIOS) iOS_Permission();
//
//       return await _firebaseMessaging.getToken();
//       // if(token != null && token.isNotEmpty) {
//         //_sendToken(token);
//       // }
//       // return token;
//     } catch(_) {}
//   }
//
//   void iOS_Permission() {
//     try {
//       _firebaseMessaging.requestNotificationPermissions(
//           IosNotificationSettings(sound: true, badge: true, alert: true));
//       _firebaseMessaging.onIosSettingsRegistered
//           .listen((IosNotificationSettings settings) {
//         print("Settings registered: $settings");
//       });
//     } catch(_) {}
//   }
//
//   Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
//     if (message.containsKey('data')) {
//       final String data = message['data']['lien'] ?? '';
//       if(data.isNotEmpty) {
//
//       }
//     }
//
//     if (message.containsKey('notification')) {
//       // Handle notification message
//       final dynamic notification = message['notification'];
//     }
//
//     // Or do other work.
//   }
//
//   void _sendToken(String token) async {
//     try {
//       final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//       //final Firestore _firestore = Firestore.instance;
//       CollectionReference collection = _firestore.collection(Keys.FCM_TOKENS);
//       print("token: $token");
//       await collection.doc(token).set({
//         "token": token
//       }).catchError((e) {
//         print("error, send Token:$e");
//       });
//     } catch(_){}
//   }
//
//   Future<void> _showDialogNotification(BuildContext context, NotificationEntity entity) async {
//     await showDialog(context: context, builder: (context) {
//       return AlertDialog(
//         titlePadding: const EdgeInsets.all(0),
//         contentPadding: const EdgeInsets.all(0),
//         title: Container(
//           color: Colors.pink,
//           padding: const EdgeInsets.all(10),
//           child: AutoSizeText("new_notification".tr(),
//             textAlign: TextAlign.center,
//             maxFontSize: 18,
//             style: TextStyle(
//               color: Colors.white,
//             ),
//             maxLines: 2,
//           ),
//         ),
//         actions: <Widget>[
//           FlatButton(
//             child: Text('yes'.tr()),
//             onPressed: () async {
//               isOnMessage = true;
//               // LoadingDialog.show(context);
//               await _checkTypeMessage(context, entity);
//             },
//           ),
//
//           FlatButton(
//             child: Text('ignore'.tr()),
//             onPressed: () => Navigator.pop(context),
//           ),
//         ],
//       );
//     });
//   }
//
//   Future<void> _checkTypeMessage(BuildContext context, NotificationEntity entity) async {
//     try {
//       switch(entity.type) {
//         case Keys.NOTIFICATION_EVE: {
//           print('type is eve');
//           final even = await db.evenementsDao.getEvenementByIdEveAndIdPer(idEve: entity.id, idPer: entity.idPersonne);
//           if (even == null) {
//             final evenId = await sl<AppUtils>().getEvenementById(context: context, id: entity.id, idPer: entity.idPersonne);
//             if (evenId ?? false) {
//               await _routPage(context: context, entity: entity);
//             }
//           } else {
//             await _routPage(context: context, entity: entity);
//           }
//           break;
//         }
//
//         case Keys.NOTIFICATION_INFO: {
//           print('type is info');
//           final even = await db.informationsDao.getInformationByIdEveAndIdPer(idInfo: entity.id, idPer: entity.idPersonne);
//           if (even == null) {
//             final infoId = await sl<AppUtils>().getInformationById(context: context, id: entity.id, idPer: entity.idPersonne);
//             if (infoId ?? false) {
//               await _routPage(context: context, entity: entity);
//             }
//           } else {
//             await _routPage(context: context, entity: entity);
//           }
//           break;
//         }
//
//         case Keys.NOTIFICATION_AGEN: {
//           print('type is agen');
//           final agenda = await db.agendasDao.getAgendasByIdAgendaAndIdPer(idAgenda: entity.id, idPer: entity.idPersonne);
//           if (agenda == null) {
//             final agendaId = await sl<AppUtils>().getAgendaById(context: context, id: entity.id, idPer: entity.idPersonne);
//             if (agendaId ?? false) {
//               await _routPage(context: context, entity: entity);
//             }
//           } else {
//             await _routPage(context: context, entity: entity);
//           }
//           break;
//         }
//       }
//     } catch(e) {
//       LoadingDialog.hide(context);
//     }
//   }
//
//   Future<void> _routPage({BuildContext context, NotificationEntity entity}) async {
//     try {
//       final enfant = await db.enfantsDao.getEnfantById(entity.idPersonne);
//       this._mobx.onChangedEnfant(enfant);
//       await sl<AppUtils>().cacheEnfant(enfant);
//       var page;
//
//       switch(entity.type) {
//         case Keys.NOTIFICATION_EVE: {
//           List<Evenement> events = await db.evenementsDao.getAllEvenementByIdPer(entity.idPersonne) ?? [];
//           int index = events.indexWhere((element) => element.id_evenement == entity.id);
//           if (events == null || events.isEmpty) return;
//           page = DetailsEvenement(events: events, index: index);
//           break;
//         }
//         case Keys.NOTIFICATION_INFO: {
//           List<Information> infos = await db.informationsDao.getAllInformationByIdPer(entity.idPersonne) ?? [];
//           int index = infos.indexWhere((element) => element.id_information == entity.id);
//           if (infos == null || infos.isEmpty) return;
//           page = DetailsInformations(infos: infos, index: index);
//           break;
//         }
//         case Keys.NOTIFICATION_AGEN: {
//           final agenda = await db.agendasDao.getAgendasByIdAgendaAndIdPer(idAgenda: entity.id, idPer: entity.idPersonne);
//           if (agenda == null) return;
//           page = AgendaPage(entity.idPersonne, agenda.date_agenda);
//           break;
//         }
//       }
//       print('finish');
//       if (isOnMessage) {
//         // LoadingDialog.hide(context);
//         Navigator.pop(context);
//         isOnMessage = false;
//       }
//       Navigator.push(context, MaterialPageRoute(builder: (context) => page));
//     } catch(e) {
//       LoadingDialog.hide(context);
//       FlashHelper.errorBar(context, message: 'error_server'.tr());
//     }
//   }
//
// }