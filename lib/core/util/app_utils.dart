// import 'package:flutter/material.dart';
// import 'dart:io';
//
//
// abstract class AppUtils extends ChangeNotifier {
//
//   Future<bool> getLocale();
//   Future<bool> introIsFirstTime();
//   Future<void> setIntroFirstTime(bool val);
//   Future<void> setLocale(bool val);
//   Color colorPlatform();
//   Future<InputLogin> getItCacheInputLogin();
//   String generateMd5(String input);
//   bool checkRole(LoginModel entity);
//   bool checkInitHome(List<Role> roles);
//   bool checkEnfants(EnfantsModel entity);
//   String checkTextEnfant(Enfant enfant);
//   String getName(BuildContext context, Personne data);
//   String checkLanguage(String lang);
//   Future<InputJoursFeries> getInputJoursFeries();
//   Future<InputEvenements> getInputEvenements(int idPpersonne);
//   Future<InputInformations> getInputInformations(int idPpersonne);
//   Future<Map<DateTime, List>> joursFeriesEvents();
//   Future<Map<DateTime, List>> agendaEvents();
//   String formatData(DateTime dateTimed);
//   Future<void> finishShowCase();
//   bool isFirstShowCase();
//   Future<void> logOut();
//   Future<void> cacheEnfant(Enfant enf);
//   Enfant getCacheEnfant();
//   String convertDate(DateTime date);
//   String convertDateNotes(DateTime date);
//   // Future<bool> saveNetworkImageToPhoto(String url, {bool useCache: true});
//   Future<InputAgendaConfig> getInputAgendaConfig(int idPersonne);
//   Future<InputAgenda> getInputAgenda(int idPersonne, String date);
//   bool checkAgenda(List<AgendaMod> agendas, DateTime date);
//   Future<void> sendNotes({BuildContext context, String msg, int idAgenda});
//   Future<void> checkNotes(BuildContext context);
//   Future<Map<DateTime, List>> agendaDates();
//   Future<bool> getEvenementById({BuildContext context, int id, int idPer});
//   Future<bool> getInformationById({BuildContext context, int id, int idPer});
//   Future<bool> getAgendaById({BuildContext context, int id, int idPer});
//   // Future<void> viewEvenements(int idPer);
//   Future<void> viewEvenementsById({int idPer, int idEven});
//   // Future<void> viewInformations(int idPer);
//   Future<void> viewInformationsById({int idPer, int idInfo});
//   // Future<void> viewJourFeries(int idPer);
//   Future<void> viewJourFeriesById({int idPer, int idJour});
//   Future<MainCountWithViews> getCounter({int idPer});
//   Future<bool> getDisplayGallery();
//   Future<void> setDisplayGallery(bool val);
//   Future<bool> requestDownload({BuildContext context, String url});
//   Future<void> prepare();
//   bool checkList(List list, String val);
//   Future<File> createFileOfPdfUrl(String url);
//   Future<InputAttestation> getInputAttestation(int idPer);
//   Future<InputAttestation> addDemandeAttestations(BuildContext context, int idPersonne);
//   Future<void> removeDemande({BuildContext context, int idPersonne, int id_eleveScolaire});
//   Future<void> checkSendAndRemoveDemandes([int id_personne]);
//   Future<InputReservationsCantineDates>getInputReservationDate(int idPersonne);
//   Future<Map<DateTime, List>> reservationsDate();
//   Future<InputGetReservations> getInputReservation(int idPersonne, DateTime dateTime);
//   Future<void> reservationsCantine({BuildContext context, int idPersonne, DateTime dateTime, MobxReservation mobx});
//   Future<void> removeReservations({BuildContext context, int id_journaliere, MobxReservation mobx, DateTime dateTime});
//   Future<ResponsePdfReservationsModel> getPdfReservations({BuildContext context, int idPersonne, DateTime dateTimeLocal});
//
// }
