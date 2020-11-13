// import 'package:inoface_lescopains/features/reservations/data/models/get_reservations_cantine_model.dart';
// import 'package:inoface_lescopains/features/reservations/data/models/response_pdf_reservations_model.dart';
// import 'package:inoface_lescopains/features/reservations/data/models/response_remove_reservations_model.dart';
// import 'package:inoface_lescopains/features/reservations/domain/usecases/input_pdf_reservation.dart';
// import 'package:inoface_lescopains/features/reservations/domain/usecases/input_remove_reservation.dart';
// import 'package:inoface_lescopains/features/reservations/domain/usecases/input_reservations_cantine_dates.dart';
// import 'package:inoface_lescopains/features/attestations/data/repositories/attestations_repository_impl.dart';
// import 'package:inoface_lescopains/features/attestations/data/database/attestations_remote_data_source.dart';
// import 'package:inoface_lescopains/features/informations/domain/usecases/input_informations_by_id.dart';
// import 'package:inoface_lescopains/features/reservations/domain/usecases/input_get_reservations.dart';
// import 'package:inoface_lescopains/features/attestations/data/models/demande_attestations_model.dart';
// import 'package:inoface_lescopains/features/attestations/domain/usecases/input_remove_demande.dart';
// import 'package:inoface_lescopains/features/evenements/domain/usecases/input_evenements_by_id.dart';
// import 'package:inoface_lescopains/features/informations/data/models/informations_model_by_id.dart';
// import 'package:inoface_lescopains/features/jours_feries/domain/usecases/input_jours_feries.dart';
// import 'package:inoface_lescopains/features/informations/domain/usecases/input_informations.dart';
// import 'package:inoface_lescopains/features/attestations/domain/usecases/input_attestation.dart';
// import 'package:inoface_lescopains/features/evenements/data/models/evenements_model_by_id.dart';
// import 'package:inoface_lescopains/features/reservations/domain/usecases/mobx_reservation.dart';
// import 'package:inoface_lescopains/features/attestations/data/models/remove_demande_model.dart';
// import 'package:inoface_lescopains/features/evenements/domain/usecases/input_evenements.dart';
// import 'package:inoface_lescopains/features/agenda/domain/usecases/input_agenda_config.dart';
// import 'package:inoface_lescopains/features/agenda/domain/usecases/input_agenda_by_id.dart';
// import 'package:inoface_lescopains/features/init_home/domain/entities/main_counts.dart';
// import 'package:inoface_lescopains/features/agenda/data/models/agenda_model_by_id.dart';
// import 'package:inoface_lescopains/features/agenda/domain/usecases/input_agenda.dart';
// import 'package:inoface_lescopains/features/agenda/data/models/add_note_model.dart';
// import 'package:inoface_lescopains/features/login/domain/usecases/input_login.dart';
// import 'package:inoface_lescopains/features/agenda/domain/usecases/send_note.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:inoface_lescopains/features/login/data/models/login_model.dart';
// import 'package:inoface_lescopains/core/injection/injection_container.dart';
// import 'package:inoface_lescopains/core/database/app_database.dart';
// import 'package:inoface_lescopains/core/network/network_info.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:inoface_lescopains/core/model/enfants_model.dart';
// import 'package:inoface_lescopains/core/ui/loading_dialog.dart';
// import 'package:inoface_lescopains/core/util/flash_helper.dart';
// import 'package:inoface_lescopains/core/util/color_helper.dart';
// import 'package:inoface_lescopains/core/error/exceptions.dart';
// import 'package:inoface_lescopains/core/util/url_service.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:image_picker_saver/image_picker_saver.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:inoface_lescopains/core/util/keys.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:path_provider/path_provider.dart';
// import 'package:date_format/date_format.dart';
// import 'package:date_utils/date_utils.dart';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/services.dart';
// import 'package:flutter/material.dart';
// import 'package:crypto/crypto.dart';
// import 'package:logger/logger.dart';
// import 'app_utils.dart';
// import 'dart:isolate';
// import 'dart:convert';
// import 'dart:math';
// import 'dart:io';
// import 'dart:ui';
//
//
// class AppUtilsImpl extends AppUtils {
//
//   //  final DocumentSnapshot document;
//   final DefaultCacheManager manager = new DefaultCacheManager();
//   final NetworkInfo networkInfo;
//   SharedPreferences preferences;
//   final AppDatabase database;
//   final http.Client client;
//   bool _permissisonReady;
//   var logger = Logger();
//
//
//   AppUtilsImpl({this.preferences, this.client, this.networkInfo, this.database}) {
//     Future.delayed(Duration(seconds: 3)).then((_) => sl.signalReady(this));
//     _deleteCache();
//   }
//
//   _deleteCache() async {
//     if (networkInfo != null && await networkInfo.isConnected) {
//       manager.emptyCache();
//     }
//   }
//
//   @override
//   Future<bool> getLocale() async {
//     return preferences.getBool(Keys.LOCALE) ?? true;
//   }
//
//   @override
//   Future<bool> introIsFirstTime() async {
//     return preferences.getBool(Keys.INTRO) ?? true;
//   }
//
//   @override
//   Future<void> setIntroFirstTime(bool val) async {
//     return await preferences.setBool(Keys.INTRO, val);
//   }
//
//   @override
//   Future<void> setLocale(bool val) async {
//     //! true -> FR  || //! false -> AR
//     return await preferences.setBool(Keys.LOCALE, val);
//   }
//
//   @override
//   Color colorPlatform() {
//     if (Platform.isAndroid)
//       return ColorHelper.COLOR_PINK;
//     return ColorHelper.COLOR_WITHE;
//   }
//
//   @override
//   Future<InputLogin> getItCacheInputLogin() async {
//     try {
//       final login_json = preferences.getString(Keys.CACHED_LOGIN_INPUT);
//
//       if (login_json != null) {
//         print('login_json: $login_json');
//         return InputLogin.fromJson(json.decode(login_json));
//       } else {
//         throw CacheException();
//       }
//     } catch(_) {
//       if(preferences != null)
//         preferences.remove(Keys.CACHED_LOGIN_INPUT);
//       throw CacheException();
//     }
//   }
//
//   @override
//   String generateMd5(String input) {
//     return md5.convert(utf8.encode(input)).toString();
//   }
//
//   @override
//   bool checkRole(LoginModel entity) {
//     try {
//       for (Role role in entity.personneModel.roles) {
//         //role.default_role == 1 &&
//         if (role.role_description.contains('Parent')) {
//           return true; // Get enfants
//         }
//       }
//       return false; // Get main
//     } catch(e) {
//       return false;
//     }
//   }
//
//   @override
//   bool checkInitHome(List<Role> roles) {
//     try {
//       for (Role role in roles) {
//         //role.default_role == 1 &&
//         if (role.role_description.contains('Parent')) {
//           return true; // Get enfants
//         }
//       }
//       return false;
//     } catch(e) {
//       return false;
//     }
//   }
//
//   @override
//   bool checkEnfants(EnfantsModel entity) {
//     try {
//       if (entity != null && !entity.erreur) {
//         return true;
//       } else return false;
//     } catch(e) {
//       return false;
//     }
//   }
//
//   @override
//   String checkTextEnfant(Enfant enfant) {
//     try {
//       if (enfant != null && enfant.prenom != null) {
//         return enfant.prenom;
//       } else return '---';
//     } catch(e) {
//       return '---';
//     }
//   }
//
//   @override
//   String getName(BuildContext context, Personne data) {
//     try {
//       if (context.locale.toString().contains('fr_FR')) {
//         return '${data.prenom +' '+ data.nom}';
//       } else {
//         return '${data.prenom_arabe +' '+ data.nom_arabe}';
//       }
//     } catch(e) {
//       return '--';
//     }
//   }
//
//   @override
//   String checkLanguage(String lang) {
//     if (lang == 'fr_FR')
//       return 'Français 🇫🇷';
//     else return '🇲🇦 العربية';
//   }
//
//   @override
//   Future<InputJoursFeries> getInputJoursFeries() async {
//     InputLogin inputLogin = await getItCacheInputLogin();
//     List<JoursFerie> jours = await database.joursFeriesDao.getAllJoursFerie();
//     return InputJoursFeries(
//       identifiant: inputLogin.identifiant,
//       motdepasse: inputLogin.motdepasse,
//       tokenmobile: inputLogin.tokenmobile,
//       jours: jours,
//     );
//   }
//
//   @override
//   Future<InputEvenements> getInputEvenements(int idPpersonne) async {
//     InputLogin inputLogin = await getItCacheInputLogin();
//     List<Evenement> evenements = await database.evenementsDao.getAllEvenement();
//     return InputEvenements(
//       identifiant: inputLogin.identifiant,
//       motdepasse: inputLogin.motdepasse,
//       tokenmobile: inputLogin.tokenmobile,
//       id_personne: idPpersonne,
//       evenements: evenements ?? null,
//     );
//   }
//
//   @override
//   Future<InputInformations> getInputInformations(int idPpersonne) async {
//     InputLogin inputLogin = await getItCacheInputLogin();
//     List<Information> informations = await database.informationsDao.getAllInformation();
// //    List bodyInfo = [];
// //    if (informations != null && informations.isNotEmpty) {
// //      for(Information info in informations) {
// //        bodyInfo.add({
// //          'id_information': info.id_information,
// //          'lastupdate': info.lastupdate,//DateFormat('yyyy-MMM-dd').format(),
// //        });
// //      }
// //    }
//     var jsonInfo = informations.map((e) => e.toJson()).toList();
//     return InputInformations(
//       identifiant: inputLogin.identifiant,
//       motdepasse: inputLogin.motdepasse,
//       tokenmobile: inputLogin.tokenmobile,
//       id_personne: idPpersonne,
//       informations: jsonInfo.toString(),//bodyInfo ?? null,
//     );
//   }
//
// //  @override
// //  Future<Map<DateTime, List>> joursFeriesEvents() async {
// //    final dateFormatter = new DateFormat('dd/MM/yyyy');
// //    final Map<DateTime, List> _events = Map();
// //    try {
// //      List<JoursFerie> listJours = await database.joursFeriesDao.getAllJoursFerie();
// //      if (listJours != null && listJours.isNotEmpty) {
// //        for (JoursFerie jour in listJours) {
// //          DateTime datePlan = dateFormatter.parse(jour.date_debut_jour_ferie);
// //          List<Planning> plans = await database.planningsDao.getAllSameDate(plan.date_planning);
// //          _events[datePlan] = plans;
// //        }
// //        return _events;
// //      }return _events;
// //    } catch(e) {
// //      return _events;
// //    }
// //  }
//
//   @override
//   Future<Map<DateTime, List>> joursFeriesEvents() async {
//     final Map<DateTime, List> _events = Map();
//     try {
//       List<JoursFerie> listJours = await database.joursFeriesDao.getAllJoursFerie();
//       if (listJours != null && listJours.isNotEmpty) {
//
//         for (JoursFerie jour in listJours) {
//           List<DateTime> list = _getListDate(
//             jour.date_debut_jour_ferie,
//             jour.date_fin_jour_ferie
//           );
//
//           for (DateTime d in list) {
//             if(_events.containsKey(d)) {
//               List _myList = [];
//               _myList.addAll(_events[d]);
//               _myList.add(jour);
//               _events[d] = _myList;
//             } else {
//               _events[d] = [jour];
//             }
//           }
//
//         }
//         return _events;
//       } return _events;
//     } catch(e) {
//       return _events;
//     }
//   }
//
//   @override
//   Future<Map<DateTime, List>> reservationsDate() async {
//     final Map<DateTime, List> _events = Map();
//     try {
//       List<ReservationsCantineDate> listDate = await database.reservationsCantineDatesDao.getAllReservationsCantineDates();
//       if (listDate != null && listDate.isNotEmpty) {
//
//         for (ReservationsCantineDate jour in listDate) {
//           _events[jour.date_cantine] = [jour];
//         }
//         return _events;
//       } return _events;
//     } catch(e) {
//       return _events;
//     }
//   }
//
//   static List<DateTime> _getListDate(DateTime start, DateTime end) {
//     var lastDat = _lastDayOfWeek(end);
//     var newLastDate = DateTime(lastDat.year, lastDat.month, lastDat.day);
//     return Utils.daysInRange(start, newLastDate).toList();
//   }
//
//   static DateTime _lastDayOfWeek(DateTime day) {
//     day = new DateTime.utc(day.year, day.month, day.day);
//     return day.add(new Duration(days: 1));
//   }
//
//   @override
//   String formatData(DateTime data) {
//     if (data != null) {
//       final f = new DateFormat('dd-MM-yyyy');
//       final dateformat = f.format(data);
//       return dateformat;
//     } else return '---';
//   }
//
//   @override
//   Future<void> finishShowCase() async {
//     await preferences.setBool(Keys.SHOW_CASE1, false);
//   }
//
//   @override
//   bool isFirstShowCase() {
//     return preferences.getBool(Keys.SHOW_CASE1) ?? true;
//   }
//
//   /*
//   Future<void> deleteAllData() async {
//     for (var table in database.allTables) {
//       await database.delete(table).go();
//     }
//   }
//    */
//
//   @override
//   Future<void> logOut() async {
//     await database.deleteAllData();
//     return await preferences.clear();
//     /*
//     await preferences.remove(Keys.CACHED_LOGIN_INPUT);
//     await preferences.remove(Keys.CACHED_LOGIN_RESPONSE);
//     await database.deleteAllMainCounts();
//     await database.deleteAllEnfants();
//     await database.deleteAllJoursFeries();
//     await database.deleteAllPersonnes();
//     return await database.deleteAllRoles();
//      */
//   }
//
//   @override
//   Future<void> cacheEnfant(Enfant enf) async {
//     await preferences.setString(Keys.CACHE_ENFANT, enf.toJsonString());
//   }
//
//   @override
//   Enfant getCacheEnfant() {
//     final json = preferences.getString(Keys.CACHE_ENFANT);
//     if (json != null) {
//       return Enfant.fromJson(jsonDecode(json));
//     } else {
//       return null;
//     }
//   }
//
//   @override
//   String convertDate(DateTime date) {
//     return DateFormat('dd MMMM yyyy', 'fr_FR').format(date);
//     var parsedDate = DateTime.parse(date.toString());
//     return formatDate(parsedDate, [dd, '-', mm, '-', yyyy]);
//   }
//
//   @override
//   String convertDateNotes(DateTime date) {
//     return DateFormat('dd MMMM yyyy hh:mm:ss', 'fr_FR').format(date);
//   }
//
//   Future<bool> requestDownload({BuildContext context, String url}) async {
//     try {
//
//       if (_permissisonReady != null && _permissisonReady) {
//
//         FlutterDownloader.registerCallback(_downloadCallback);
//         final _localPath = (await _findLocalPath()) + '/Download';
//         final savedDir = Directory(_localPath);
//         bool hasExisted = await savedDir.exists();
//         if (!hasExisted) {
//           savedDir.create();
//         }
//
//         await FlutterDownloader.enqueue(
//             url: url,
//             headers: {
//               "auth": "test_for_sql_encoding"
//             },
//             savedDir: _localPath,
//             showNotification: true,
//             openFileFromNotification: true).then((id) {
//           if(id != null) {
//
//           }
//         }).then((value) {
//           FlashHelper.successBar(context, message: 'successfully'.tr());
//         });
//
//       } else {
//         prepare();
//       }
//
//     } catch(e) {
//       FlashHelper.errorBar(context, message: 'download_fails'.tr());
//       return false;
//     }
//   }
//
//   Future<Null> prepare() async {
//     _permissisonReady = false;
//     _permissisonReady = await _checkPermission();
//   }
//
//
//   Future<bool> _checkPermission() async {
//     if (Platform.isAndroid) {
//       PermissionStatus permission = await PermissionHandler()
//           .checkPermissionStatus(PermissionGroup.storage);
//       if (permission != PermissionStatus.granted) {
//         Map<PermissionGroup, PermissionStatus> permissions =
//         await PermissionHandler()
//             .requestPermissions([PermissionGroup.storage]);
//         if (permissions[PermissionGroup.storage] == PermissionStatus.granted) {
//           return true;
//         }
//       } else {
//         return true;
//       }
//     } else {
//       return true;
//     }
//     return false;
//   }
//
//   Future<String> _findLocalPath() async {
//     final directory = Platform.isAndroid
//         ? await getExternalStorageDirectory()
//         : await getApplicationDocumentsDirectory();
//     return directory.path;
//   }
//
//   static void _downloadCallback(String id, DownloadTaskStatus status, int progress) {
//     print('Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');
//     final SendPort send = IsolateNameServer.lookupPortByName('downloader_send_port');
//     send.send([id, status, progress]);
//   }
//
//   // @override
//   // Future<bool> saveNetworkImageToPhoto(String url, {bool useCache: true}) async {
//   //   try {
//   //     var data = await getNetworkImageData(url, useCache: useCache);
//   //     var filePath = await ImagePickerSaver.saveFile(fileData: data);
//   //     return filePath != null && filePath != "" ?? false;
//   //   } catch(e) {
//   //     print('error, $e');
//   //     return false;
//   //   }
//   // }
//
//   @override
//   Future<InputAgendaConfig> getInputAgendaConfig(int idPersonne) async {
//     InputLogin login = await getItCacheInputLogin();
//     return InputAgendaConfig(
//       id_personne: idPersonne,
//       identifiant: login.identifiant,
//       motdepasse: login.motdepasse,
//       tokenmobile: login.tokenmobile,
//       lastupdate: formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn]),
//     );
//   }
//
//   @override
//   Future<InputAgenda> getInputAgenda(int idPersonne, String date) async {
//     InputLogin login = await getItCacheInputLogin();
//     return InputAgenda(
//       id_personne: idPersonne,
//       identifiant: login.identifiant,
//       motdepasse: login.motdepasse,
//       tokenmobile: login.tokenmobile,
//       date_agenda: date,
//     );
//   }
//
//   @override
//   Future<Map<DateTime, List>> agendaEvents() async {
//     final Map<DateTime, List> _events = Map();
//     return _events;
//   }
//
//   @override
//   bool checkAgenda(agendas, DateTime date) {
//     try {
//       //&& (agendas.first.date_agenda.year == date.year && agendas.first.date_agenda.month == date.month
//       //          && agendas.first.date_agenda.day == date.day)
//       if (agendas != null && agendas.isNotEmpty) {
//         return true;
//       } return false;
//     } catch(e) {
//       return false;
//     }
//   }
//
//   @override
//   Future<void> sendNotes({BuildContext context, String msg, int idAgenda}) async {
//     final noteLimit = await database.agendaNotesDao.getAgendaNoteByDate(DateTime.now());
//     final _id = Random().nextInt(2000);
//
//     if (noteLimit != null && noteLimit.length < 2) {
//
//       await database.agendaNotesDao.insertAgendaNote(AgendaNote(
//         date_agenda_note: DateTime.now(),
//         id_agenda_note: _id,
//         id_agenda: idAgenda,
//         send: false,
//         note: msg,
//       ));
//
//       if (await networkInfo.isConnected) {
//
//         final urlService = UrlService(preferences.getString(Keys.CODE_SCHOOL));
//         final login = await getItCacheInputLogin();
//         http.Response response = await client.post(
//             urlService.getUrl(urlService.ADD_NOTE), body: {
//           'inoface_ws': SendNote(
//             identifiant: login.identifiant,
//             motdepasse: login.motdepasse,
//             tokenmobile: login.tokenmobile,
//             id_agenda: idAgenda,
//             note: msg,
//           ).toString(),
//         });
//
//         AddNoteModel model = addNoteModelFromJson(response.body);
//         if (model != null) {
//           await database.agendaNotesDao.deleteAgendaNoteById(_id);
//           await database.agendaNotesDao.insertAgendaNote(AgendaNote(
//             date_agenda_note: model.agendaNote.date_agenda_note,
//             id_agenda_note: model.agendaNote.id_agenda_note,
//             id_agenda: model.agendaNote.id_agenda,
//             note: model.agendaNote.note,
//             send: true,
//           ));
//         } else {
//           FlashHelper.errorBar(context, message: 'error_server'.tr());
//         }
//       }
//
//     } else {
//       print("limit: ${noteLimit.length}");
//       FlashHelper.errorBar(context, message: 'limit_note'.tr());
//     }
//   }
//
//   Future<void> checkNotes(BuildContext context) async {
//     try {
//       final login = await getItCacheInputLogin();
//       final notes = await database.agendaNotesDao.getAgendaNoteBySend(false);
//
//       print('--> $notes');
//
//       if (notes != null && await networkInfo.isConnected) {
//         for (var not in notes) {
//           final urlService = UrlService(preferences.getString(Keys.CODE_SCHOOL));
//           http.Response response = await client.post(
//               urlService.getUrl(urlService.ADD_NOTE), body: {
//             'inoface_ws': SendNote(
//               identifiant: login.identifiant,
//               motdepasse: login.motdepasse,
//               tokenmobile: login.tokenmobile,
//               id_agenda: not.id_agenda,
//               note: not.note,
//             ).toString(),
//           });
//
//           AddNoteModel model = addNoteModelFromJson(response.body);
//           if (model != null) {
//             await database.agendaNotesDao.deleteAgendaNoteById(not.id_agenda_note);
//             await database.agendaNotesDao.insertAgendaNote(AgendaNote(
//               date_agenda_note: model.agendaNote.date_agenda_note,
//               id_agenda_note: model.agendaNote.id_agenda_note,
//               id_agenda: model.agendaNote.id_agenda,
//               note: model.agendaNote.note,
//               send: true,
//             ));
//           } else {
//             FlashHelper.errorBar(context, message: 'error_server'.tr());
//           }
//         }
//       }
//     } catch(e) {
//       print('error -> $e');
//     }
//   }
//
//   @override
//   Future<Map<DateTime, List>> agendaDates() async {
//     final Map<DateTime, List> _events = Map();
//     List _list = [];
//     try {
//       List<AgendaDate> dates = await database.agendaDatesDao.getAllAgendaDate();
//       if (dates != null && dates.isNotEmpty) {
//         for (AgendaDate agend in dates) {
//           _list.clear();
//           _list.add(agend);
//           _events[agend.date_agenda] = _list;
//           //_events[DateTime.parse(DateFormat('dd/MM/yyyy').format(agend.date_agenda))] = _list;
//         }
//         return _events;
//       } return _events;
//     } catch(e) {
//       return _events;
//     }
//   }
//
//   @override
//   Future<bool> getEvenementById({BuildContext context, int id, int idPer}) async {
//     try {
//       if (await networkInfo.isConnected) {
//         LoadingDialog.show(context);
//         final InputLogin inputLogin = await getItCacheInputLogin();
//         final input = InputEvenementsById(
//           id_evenement: id,
//           id_personne: idPer,
//           motdepasse: inputLogin.motdepasse,
//           tokenmobile: inputLogin.tokenmobile,
//           identifiant: inputLogin.identifiant,
//         );
//
//         print('input --> ${input.toString()}');
//         final urlService = UrlService(preferences.getString(Keys.CODE_SCHOOL));
//         http.Response response = await client.post(
//             urlService.getUrl(urlService.EVENEMENTS_BY_ID), body: {
//           'inoface_ws': input.toString(),
//
//         });
//
//         // final body = await rootBundle.loadString('assets/json/evenementbyid.json');
//         // EvenementsModelById modelById = evenementsByIdModelFromJson(body);
//         EvenementsModelById modelById = evenementsByIdModelFromJson(response.body);
//         if (modelById != null) {
//           if (modelById.erreur) {
//             FlashHelper.errorBar(context, message: modelById.message ?? 'error_server'.tr());
//             LoadingDialog.hide(context);
//             return false;
//           }
//
//           print("-------------------------------------------------------");
//           print(response.body);
//           await database.evenementsDao.insertEvenement(modelById.evenements);
//           await database.albumphotosDao.insertAllAlbumphoto(modelById.evenements.albumphotos);
//           await database.piecesjointesDao.insertAllPiecesjointe(modelById.evenements.piecesjointes);
//
//           LoadingDialog.hide(context);
//           return true;
//
//         } else {
//           LoadingDialog.hide(context);
//           FlashHelper.errorBar(context, message: 'error_server'.tr());
//           return false;
//         }
//
//       } else {
//         FlashHelper.errorBar(context, message: 'error_connection'.tr());
//         return false;
//       }
//     } catch (e) {
//       LoadingDialog.hide(context);
//       print('error -> $e');
//       FlashHelper.errorBar(context, message: 'error_server'.tr());
//     }
//   }
//
//   @override
//   Future<bool> getInformationById({BuildContext context, int id, int idPer}) async {
//     try {
//       if (await networkInfo.isConnected) {
//         LoadingDialog.show(context);
//         final InputLogin inputLogin = await getItCacheInputLogin();
//         final input = InputInformationsById(
//           id_information: id,
//           id_personne: idPer,
//           motdepasse: inputLogin.motdepasse,
//           tokenmobile: inputLogin.tokenmobile,
//           identifiant: inputLogin.identifiant,
//         );
//
//         print('input --> ${input.toString()}');
//         final urlService = UrlService(preferences.getString(Keys.CODE_SCHOOL));
//         http.Response response = await client.post(
//             urlService.getUrl(urlService.INFORMATIONS_BY_ID), body: {
//           'inoface_ws': input.toString(),
//
//         });
//
//         print(response.body);
//
//         // final body = await rootBundle.loadString('assets/json/Informationbyid.json');
//         // InformationsModelById modelById = informationsByIdModelFromJson(body);
//         InformationsModelById modelById = informationsByIdModelFromJson(response.body);
//         if (modelById != null) {
//           if (modelById.erreur) {
//             FlashHelper.errorBar(context, message: modelById.message ?? 'error_server'.tr());
//             LoadingDialog.hide(context);
//             return false;
//           }
//
//           print("-------------------------------------------------------");
//           print(modelById.informations);
//           await database.informationsDao.insertInformation(modelById.informations);
//           await database.piecesjointesDao.insertAllPiecesjointe(modelById.informations.piecesjointes);
//           LoadingDialog.hide(context);
//           return true;
//
//         } else {
//           LoadingDialog.hide(context);
//           FlashHelper.errorBar(context, message: 'error_server'.tr());
//           return false;
//         }
//
//       } else {
//         FlashHelper.errorBar(context, message: 'error_connection'.tr());
//         return false;
//       }
//     } catch (e) {
//       LoadingDialog.hide(context);
//       print('error -> $e');
//       FlashHelper.errorBar(context, message: 'error_server'.tr());
//     }
//   }
//
//   @override
//   Future<bool> getAgendaById({BuildContext context, int id, int idPer}) async {
//     try {
//       if (await networkInfo.isConnected) {
//         LoadingDialog.show(context);
//         final InputLogin inputLogin = await getItCacheInputLogin();
//         final input = InputAgendaById(
//           id_agenda: id,
//           id_personne: idPer,
//           motdepasse: inputLogin.motdepasse,
//           tokenmobile: inputLogin.tokenmobile,
//           identifiant: inputLogin.identifiant,
//         );
//
//         final urlService = UrlService(preferences.getString(Keys.CODE_SCHOOL));
//         http.Response response = await client.post(
//             urlService.getUrl(urlService.AGENDA_BY_ID), body: {
//           'inoface_ws': input.toString(),
//         });
//
//         AgendaModelById modelById = agendaModelByIdFromJson(response.body);
//         if (modelById != null) {
//           if (modelById.erreur) {
//             FlashHelper.errorBar(context, message: modelById.message ?? 'error_server'.tr());
//             LoadingDialog.hide(context);
//             return false;
//           }
//
//           await database.agendasDao.insertAgenda(modelById.agendas);
//           await database.agendaNotesDao.insertAllAgendaNote(modelById.agendas.agendaNotes);
//           await database.agendaDetailsDao.insertAllAgendaDetail(modelById.agendas.agendaDetails);
//           await database.agendaPhotoDetailsDao.insertAllAgendaPhotoDetail(modelById.agendas.agendaPhotoDetails);
//           LoadingDialog.hide(context);
//           return true;
//
//         } else {
//           LoadingDialog.hide(context);
//           FlashHelper.errorBar(context, message: 'error_server'.tr());
//           return false;
//         }
//
//       } else {
//         FlashHelper.errorBar(context, message: 'error_connection'.tr());
//         return false;
//       }
//     } catch (e) {
//       LoadingDialog.hide(context);
//       print('error -> $e');
//       FlashHelper.errorBar(context, message: 'error_server'.tr());
//     }
//   }
//
//   // @override
//   // Future<void> viewEvenements(int idPer) async {
//   //   MainCount count = await database.mainCountsDao.getMainCountById(idPer);
//   //   if (count != null) {
//   //     await database.viewsDao.updateCountEve(idPer: idPer, eve: count.count_evenements);
//   //   }
//   // }
//
//   @override
//   Future<void> viewEvenementsById({int idPer, int idEven}) async {
//     // MainCount count = await database.mainCountsDao.getMainCountById(idPer);
//     CountView countView = await database.countViewsDao.getCountViewEvent(idPer: idPer, idEvent: idEven);
//     if (countView != null) {
//       print('viewEvenementsById <--');
//       return;
//     } else {
//       print('viewEvenementsById -->');
//       await database.countViewsDao.insertCountView(CountView(id_personne: idPer, idEvent: idEven));
//       View view = await database.viewsDao.getViewByIdPers(idPer);
//       await database.viewsDao.updateCountEve(idPer: idPer, eve: view.count_evenements + 1);
//     }
//   }
//
//   // @override
//   // Future<void> viewInformations(int idPer) async {
//   //   MainCount count = await database.mainCountsDao.getMainCountById(idPer);
//   //   if (count != null) {
//   //     await database.viewsDao.updateCountInfo(idPer: idPer, countInfo: count.count_informations);
//   //   }
//   // }
//
//   @override
//   Future<void> viewInformationsById({int idPer, int idInfo}) async {
//     CountView countView = await database.countViewsDao.getCountViewInfo(idPer: idPer, idInfo: idInfo);
//     if (countView != null) {
//       print('viewInformationsById <--');
//       return;
//     } else {
//       print('viewInformationsById -->');
//       await database.countViewsDao.insertCountView(CountView(id_personne: idPer, idInfo: idInfo));
//       View view = await database.viewsDao.getViewByIdPers(idPer);
//       await database.viewsDao.updateCountInfo(idPer: idPer, countInfo: view.count_informations + 1);
//     }
//   }
//
//   // @override
//   // Future<void> viewJourFeries(int idPer) async {
//   //   MainCount count = await database.mainCountsDao.getMainCountById(idPer);
//   //   if (count != null) {
//   //     await database.viewsDao.updateCountJoursFeries(idPer: idPer, jour: count.count_jours_feries);
//   //   }
//   // }
//
//   @override
//   Future<void> viewJourFeriesById({int idPer, int idJour}) async {
//     CountView countView = await database.countViewsDao.getCountViewJour(idPer: idPer, idJour: idJour);
//     if (countView != null) {
//       print('viewJourFeriesById <--');
//       return;
//     } else {
//       print('viewJourFeriesById -->');
//       await database.countViewsDao.insertCountView(CountView(id_personne: idPer, idJour: idJour));
//       View view = await database.viewsDao.getViewByIdPers(idPer);
//       await database.viewsDao.updateCountJoursFeries(idPer: idPer, jour: view.count_jours_feries + 1);
//     }
//   }
//
//
//   @override
//   Future<MainCountWithViews> getCounter({int idPer}) async {
//     try {
//       return MainCountWithViews(
//         mainCount: await database.mainCountsDao.getMainCountById(idPer),
//         view: await database.viewsDao.getViewByIdPers(idPer),
//       );
//     } catch(e) {
//       print('error --------> $e');
//     }
//   }
//
//   @override
//   Future<bool> getDisplayGallery() async {
//     return preferences.getBool(Keys.DISPLAY_GALLERY) ?? false;
//   }
//
//   @override
//   Future<void> setDisplayGallery(bool val) async {
//     return await preferences.setBool(Keys.DISPLAY_GALLERY, val);
//   }
//
//   bool checkList(List list, String val) {
//     try {
//       for(String file in list) {
//         if (val.contains(file)) {
//           return true;
//         }
//       }
//       return false;
//     }catch(_) {
//       return false;
//     }
//   }
//
//   Future<File> createFileOfPdfUrl(String url) async {
//     final filename = url.substring(url.lastIndexOf("/") + 1);
//     var request = await HttpClient().getUrl(Uri.parse(url));
//     var response = await request.close();
//     var bytes = await consolidateHttpClientResponseBytes(response);
//     String dir = (await getApplicationDocumentsDirectory()).path;
//     File file = new File('$dir/$filename');
//     await file.writeAsBytes(bytes);
//     return file;
//   }
//
//   @override
//   Future<InputAttestation> getInputAttestation(int idPer) async {
//     try {
//       InputLogin login = await getItCacheInputLogin();
//       return InputAttestation(
//           id_personne: idPer,
//           identifiant: login.identifiant,
//           motdepasse: login.motdepasse,
//           tokenmobile: login.tokenmobile
//       );
//     } catch(e) {
//       throw CacheException();
//     }
//   }
//
//   @override
//   Future<InputAttestation> addDemandeAttestations(BuildContext context, int idPersonne) async {
//     final _formKey = GlobalKey<FormState>();
//     final TextEditingController _controller = new TextEditingController();
//     return await showDialog(context: context, builder: (context) => AlertDialog(
//       titlePadding: const EdgeInsets.all(0),
//       title: Container(
//         //height: 60, width: size.width - 100,
//         padding: const EdgeInsets.symmetric(vertical: 20),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 5.0),
//           child: Text('new_certificate'.tr(),
//             textAlign: TextAlign.center,
//             maxLines: 2,
//             style: TextStyle(
//               color: Colors.white,
//             ),
//           ),
//         ),
//         color: Colors.pink.shade700,
//       ),
//       content: Container(
//         child: Form(
//           key: _formKey,
//           child: TextFormField(
//             autofocus: true,
//             controller: _controller,
//             keyboardType: TextInputType.number,
//             decoration: InputDecoration(
//               labelText: 'number_copies'.tr(),
//               icon: new Icon(MdiIcons.file),
//             ),
//             validator: numberValidator,
//           ),
//         ),
//       ),
//       actions: <Widget>[
//         FlatButton(
//           child: Text('ok'.tr()),
//           onPressed: () async {
//             if(_formKey.currentState.validate()) {
//               if(int.parse(_controller.text.trim()) > 3) {
//                 FlashHelper.infoBar(context, message: "max_number".tr());
//               } else if (await _checkDateDemande(idPersonne) ?? false) {
//                 InputLogin login = await getItCacheInputLogin();
//                 final input = InputAttestation(
//                     id_personne: idPersonne,
//                     nombre_de_copies: int.parse(_controller.text.trim()),
//                     identifiant: login.identifiant,
//                     motdepasse: login.motdepasse,
//                     tokenmobile: login.tokenmobile
//                 );
//                 Navigator.pop(context, input);
//               } else {
//                 Navigator.pop(context);
//                 FlashHelper.infoBar(context, message: "limit_note".tr());
//               }
//             } else return null;
//           },
//         ),
//         FlatButton(
//           child: Text('cancel'.tr()),
//           onPressed: () => Navigator.pop(context),
//         )
//       ],
//     ));
//   }
//
//   String numberValidator(String value) {
//     if(value == null || value.isEmpty) {
//       return 'required_field'.tr();
//     }
//     final n = num.tryParse(value);
//     if(n == null) {
//       return 'required_field'.tr();
//     }
//     return null;
//   }
//
//   @override
//   Future<void> removeDemande({BuildContext context, int idPersonne, int id_eleveScolaire}) async {
//     await showDialog(context: context, builder: (context) => AlertDialog(
//       titlePadding: const EdgeInsets.all(0),
//       title: Container(
//         //height: 60, width: size.width - 100,
//         padding: const EdgeInsets.symmetric(vertical: 20),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 5.0),
//           child: Text('delete_selection'.tr(),
//             textAlign: TextAlign.center,
//             maxLines: 2,
//             style: TextStyle(
//               color: Colors.white,
//             ),
//           ),
//         ),
//         color: Colors.pink.shade700,
//       ),
//       content: Container(
//           child: Text('delete_demande'.tr())
//       ),
//
//       actions: <Widget>[
//         FlatButton(
//           child: Text('cancel'.tr()),
//           onPressed: () => Navigator.pop(context),
//         ),
//         FlatButton(
//             child: Text('delete'.tr()),
//             onPressed: () async {
//               LoadingDialog.show(context);
//               await _removeDemande(context: context, idPers: idPersonne, idEleveScolaire: id_eleveScolaire).whenComplete(() {
//                 LoadingDialog.hide(context);
//               });
//               Navigator.pop(context);
//             }
//         ),
//       ],
//     ));
//   }
//
//   Future<void> _removeDemande({BuildContext context, int idPers, int idEleveScolaire}) async {
//     final demandesAttestation = await database.demandesAttestationsDao.getDemandesAttestationsById(idEleveScolaire);
//     if (demandesAttestation.send == false) {
//       return await database.demandesAttestationsDao.deleteDemandesAttestations(demandesAttestation);
//     }
//
//     InputLogin login = await getItCacheInputLogin();
//     final input = InputAttestation(
//         id_personne: idPers,
//         identifiant: login.identifiant,
//         motdepasse: login.motdepasse,
//         tokenmobile: login.tokenmobile
//     );
//
//     final inputRemove = InputRemoveDemande(
//         id_eleve_attestation_scolaire: idEleveScolaire,
//         identifiant: login.identifiant,
//         motdepasse: login.motdepasse,
//         tokenmobile: login.tokenmobile
//     );
//
//     if (await networkInfo.isConnected) {
//       final urlService = UrlService(preferences.getString(Keys.CODE_SCHOOL));
//       http.Response response = await client.post(
//           urlService.getUrl(urlService.REMOVE_ATTESTATION), body: {
//         'inoface_ws': inputRemove.toString(),
//       });
//
//       print("response: ${response.body}");
//       RemoveDemandeModel model = removeDemandeModelFromJson(response.body);
//       if (model != null) {
//
//         if (model.erreur) {
//           FlashHelper.errorBar(context, message: model.message);
//         } else {
//           AttestationsRemoteDataSourceImpl _implRemot = AttestationsRemoteDataSourceImpl(
//             client: sl(), localDataSource: sl(),
//           );
//
//           AttestationsRepositoryImpl _impl = AttestationsRepositoryImpl(
//             remoteDataSource: sl(),
//             localDataSource: sl(),
//             networkInfo: sl(),
//           );
//
//           DemandeAttestationsModel attestationsModel = await _implRemot.getConcreteAttestations(input);
//           await _impl.localDataSource.cacheAttestations(attestationsModel, idPers);
//           FlashHelper.successBar(context, message: model.message);
//         }
//
//       } else {
//         FlashHelper.errorBar(context, message: 'something_wrong'.tr());
//       }
//
//     } else {
//       final removeDemande = RemoveDemandesAttestation(
//         send: false, id_personne: idPers,
//         id_eleve_scolaire: idEleveScolaire,
//       );
//       await database.removeDemandesAttestationsDao.insertRemoveDemandesAttestations(removeDemande);
//       return await database.demandesAttestationsDao.updateDemandesAttestationById(idEleveScolaire: idEleveScolaire, remove: true);
//     }
//   }
//
//   Future<void> checkSendAndRemoveDemandes([int id_personne]) async {
//     InputLogin login = await getItCacheInputLogin();
//     AttestationsRemoteDataSourceImpl _implRemot = AttestationsRemoteDataSourceImpl(
//       client: sl(), localDataSource: sl(),
//     );
//
//     AttestationsRepositoryImpl _impl = AttestationsRepositoryImpl(
//       remoteDataSource: sl(), localDataSource: sl(),
//       networkInfo: sl(),
//     );
//
//     List<DemandesAttestation> demandesAttestation = await database.demandesAttestationsDao.getAllDemandesAttestationsBySend(false);
//     if (demandesAttestation != null && demandesAttestation.isNotEmpty) {
//       for (DemandesAttestation demande in demandesAttestation) {
//
//         final input = InputAttestation(
//           nombre_de_copies: demande.nombre_de_copies,
//           id_personne: demande.id_personne_eleve,
//           identifiant: login.identifiant,
//           tokenmobile: login.tokenmobile,
//           motdepasse: login.motdepasse,
//         );
//         await _implRemot.addAttestations(input);
//
//         DemandeAttestationsModel attestationsModel = await _implRemot.getConcreteAttestations(input);
//         print("attestationsModel: ${attestationsModel.demandesAttestations}");
//         await _impl.localDataSource.cacheAttestations(attestationsModel, demandesAttestation.first.id_personne_eleve);
//       }
//     }
//
//
//     List<RemoveDemandesAttestation> listRemove = await database.removeDemandesAttestationsDao.getAllRemoveDemandesAttestations();
//     print('listRemove: ${listRemove.length}');
//
//     if (listRemove != null && listRemove.isNotEmpty) {
//
//       for (RemoveDemandesAttestation val in listRemove) {
//
//         final input = InputAttestation(
//             id_personne: val.id_personne,
//             identifiant: login.identifiant,
//             motdepasse: login.motdepasse,
//             tokenmobile: login.tokenmobile
//         );
//
//         final inputRemove = InputRemoveDemande(
//             id_eleve_attestation_scolaire: val.id_eleve_scolaire,
//             identifiant: login.identifiant,
//             motdepasse: login.motdepasse,
//             tokenmobile: login.tokenmobile
//         );
//
//         await _sendRemove(inputRemove, input, val.id_personne);
//       }
//     } else if (id_personne != null) {
//
//       final input = InputAttestation(
//           id_personne: id_personne,
//           identifiant: login.identifiant,
//           motdepasse: login.motdepasse,
//           tokenmobile: login.tokenmobile
//       );
//
//       DemandeAttestationsModel model = await _implRemot.getConcreteAttestations(input);
//       if (model != null && !model.erreur) {
//         await _implRemot.localDataSource.cacheAttestations(model, id_personne);
//       }
//     }
//
//   }
//
//   Future<void> _sendRemove(InputRemoveDemande inputRemove, InputAttestation input, int idPers) async {
//     try {
//       final urlService = UrlService(preferences.getString(Keys.CODE_SCHOOL));
//       http.Response response = await client.post(
//           urlService.getUrl(urlService.REMOVE_ATTESTATION), body: {
//         'inoface_ws': inputRemove.toString(),
//       });
//
//       print("response: ${response.body}");
//       RemoveDemandeModel model = removeDemandeModelFromJson(response.body);
//       if (model != null) {
//
//         if (model.erreur) {
//           //FlashHelper.errorBar(context, message: model.message);
//         } else {
//           await database.deleteAllRemoveDemandesAttestationsByIdEleveScolaire(inputRemove.id_eleve_attestation_scolaire);
//           AttestationsRemoteDataSourceImpl _implRemot = AttestationsRemoteDataSourceImpl(
//             client: sl(), localDataSource: sl(),
//           );
//
//
//           AttestationsRepositoryImpl _impl = AttestationsRepositoryImpl(
//             remoteDataSource: sl(), localDataSource: sl(),
//             networkInfo: sl(),
//           );
//
//           DemandeAttestationsModel attestationsModel = await _implRemot.getConcreteAttestations(input);
//           await _impl.localDataSource.cacheAttestations(attestationsModel, idPers);
//
//         }
//
//       }
//     } catch(e) {
//       print('error: -> $e');
//     }
//   }
//
//   Future<bool> _checkDateDemande(int idPersonne) async {
//     final listStatut = await database.demandesAttestationsDao.getAllDemandesAttestationsByStatut(
//       idPersonne: idPersonne, idstatut: 3,
//     ) ?? [];
//
//
//     print("listStatut: ${listStatut.length}");
//
//     final allList = await database.demandesAttestationsDao.getAllDemandesAttestationsById(idPersonne) ?? [];
//
//     print("listStatut: ${allList.length}");
//
//     if (listStatut.length == allList.length || allList.isEmpty)
//       return true;
//     return false;
//   }
//
//   @override
//   Future<InputReservationsCantineDates> getInputReservationDate(int idPersonne) async {
//     InputLogin inputLogin = await getItCacheInputLogin();
//     return InputReservationsCantineDates(
//       identifiant: inputLogin.identifiant,
//       motdepasse: inputLogin.motdepasse,
//       tokenmobile: inputLogin.tokenmobile,
//       id_personne: idPersonne,
//     );
//   }
//
//   @override
//   Future<InputGetReservations> getInputReservation(int idPersonne, DateTime dateTime) async {
//     InputLogin inputLogin = await getItCacheInputLogin();
//     return InputGetReservations(
//       identifiant: inputLogin.identifiant,
//       motdepasse: inputLogin.motdepasse,
//       tokenmobile: inputLogin.tokenmobile,
//       id_personne: idPersonne,
//       date_cantine: DateFormat('yyyy-MM-dd').format(dateTime),
//     );
//   }
//
//   @override
//   Future<void> reservationsCantine({
//     BuildContext context, int idPersonne,
//     DateTime dateTime, MobxReservation mobx,
//   }) async {
//     final Map<DateTime, List> _events = Map();
//     LoadingDialog.show(context);
//     if (await networkInfo.isConnected) {
//       InputLogin inputLogin = await getItCacheInputLogin();
//       final input = InputGetReservations(
//         identifiant: inputLogin.identifiant,
//         motdepasse: inputLogin.motdepasse,
//         tokenmobile: inputLogin.tokenmobile,
//         id_personne: idPersonne,
//         date_cantine: DateFormat('yyyy-MM-dd').format(dateTime),
//       );
//
//       print('-------------------');
//       print(input.toString());
//       final urlService = UrlService(preferences.getString(Keys.CODE_SCHOOL));
//       http.Response response = await client.post(
//           urlService.getUrl(urlService.ADD_RESERVATIONS), body: {
//         'inoface_ws': input.toString(),
//       });
//
//       GetReservationsCantineModel model = getReservationsCantineModelFromJson(response.body);
//
//       if (!model.erreur != null && model.reservationCantine != null) {
//         await database.reservationsCantinesDao.insertReservationsCantines(model.reservationCantine);
//
//         _events[dateTime] = [model.reservationCantine];
//         mobx.events.addAll(_events);
//
//         LoadingDialog.hide(context);
//         FlashHelper.successBar(context, message: model.message);
//       } else {
//         LoadingDialog.hide(context);
//         FlashHelper.errorBar(context, message: model.message ?? "error_server".tr());
//       }
//
//     } else {
//       LoadingDialog.hide(context);
//       FlashHelper.errorBar(context, message: "error_connection".tr());
//     }
//   }
//
//   @override
//   Future<void> removeReservations({
//     BuildContext context,
//     DateTime dateTime,
//     int id_journaliere,
//     MobxReservation mobx,
//   }) async {
//     LoadingDialog.show(context);
//     if (await networkInfo.isConnected) {
//       InputLogin inputLogin = await getItCacheInputLogin();
//       final input = InputRemoveReservation(
//         identifiant: inputLogin.identifiant,
//         motdepasse: inputLogin.motdepasse,
//         tokenmobile: inputLogin.tokenmobile,
//         id_cantine_journaliere: id_journaliere,
//       );
//
//       final urlService = UrlService(preferences.getString(Keys.CODE_SCHOOL));
//       http.Response response = await client.post(
//           urlService.getUrl(urlService.REMOVE_RESERVATIONS), body: {
//         'inoface_ws': input.toString(),
//       });
//
//       final model = responseRemoveReservationsModelFromJson(response.body);
//       if (model != null && !model.erreur) {
//         await database.reservationsCantinesDao.deleteReservationsById(journaliere: id_journaliere);
//         final event = mobx.events.keys.firstWhere((element) =>
//           element.year == dateTime.year &&
//           element.month == dateTime.month &&
//           element.day == dateTime.day
//         );
//         if (event != null) {
//           mobx.events.removeWhere((key, value) => key == event);
//         }
//         LoadingDialog.hide(context);
//         FlashHelper.successBar(context, message: model.message);
//       } else {
//         LoadingDialog.hide(context);
//         FlashHelper.errorBar(context, message: model.message ?? "error_server".tr());
//       }
//
//     } else {
//       LoadingDialog.hide(context);
//       FlashHelper.errorBar(context, message: "error_connection".tr());
//     }
//   }
//
//   @override
//   Future<ResponsePdfReservationsModel> getPdfReservations({
//       BuildContext context, int idPersonne, DateTime dateTimeLocal}) async {
//     if (await networkInfo.isConnected) {
//       InputLogin inputLogin = await getItCacheInputLogin();
//       final input = InputPdfReservation(
//         identifiant: inputLogin.identifiant,
//         motdepasse: inputLogin.motdepasse,
//         tokenmobile: inputLogin.tokenmobile,
//         date_cantine: dateTimeLocal != null ?
//         DateFormat('yyyy-MM-dd').format(dateTimeLocal) :
//         DateFormat('yyyy-MM-dd').format(DateTime.now()),
//       );
//
//       final urlService = UrlService(preferences.getString(Keys.CODE_SCHOOL));
//       http.Response response = await client.post(
//           urlService.getUrl(urlService.PDF_RESERVATIONS), body: {
//         'inoface_ws': input.toString(),
//       });
//
//       return responsePdfReservationsModelFromJson(response.body);
//
//     } else {
//       FlashHelper.errorBar(context, message: "error_connection".tr());
//       return ResponsePdfReservationsModel(
//         message: 'error_connection'.tr(),
//         erreur: true,
//       );
//     }
//   }
// }