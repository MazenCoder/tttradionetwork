
class UrlService {

  /// Webservice url
  // final String BASE_URL = "http://inoser-education.com/lescopains/json/";
  String codeSchool = '';
  UrlService(this.codeSchool);


  //! TEST
  static String BASE_URL = "http://inoser2.cnrst.ma/Inoface/json/";

  final String LOGIN_INOFACE = "login_ws";
  final String ENFANTS = "enfants_ws";
  final String MAIN_COUNT = "main_count_ws";
  final String JOURS_FERIES = "jours_feries_ws";
  final String EVENEMENTS = "evenements_ws";
  final String EVENEMENTS_BY_ID = "EvenementByID_ws";
  final String INFORMATIONS = "informations_ws";
  final String INFORMATIONS_BY_ID = "InformationByID_ws";
  final String FORGIT_PASSWORD = "Forget_password_ws";
  final String QRCODE = "login_with_Qrcode_ws";
  final String GET_URL_QRCODE = "http://inoser2.cnrst.ma/Inoface/json/GetUrlFromQrcode_ws";
  final String AGEND_CONGIG = "agenda_config_ws";
  final String AGEND = "agenda_ws";
  final String AGENDA_DATES = "agenda_dates_ws";
  final String AGENDA_BY_ID = "agenda_byID_ws";
  final String ADD_NOTE = "addnote_ws";
  final String ADD_DEMANDE_ATTESTATION = "add_demandeattestation_ws";
  final String DEMANDE_ATTESTATION = "demandeattestations_ws";
  final String REMOVE_ATTESTATION = "remove_demandeattestation_ws";
  final String PRIVACY = 'https://sites.google.com/view/inoface';

  final String RESERVATIONS_DATE = 'reservationscantinedates_ws';
  final String GET_RESERVATIONS = 'Getreservationcantine_ws';
  final String ADD_RESERVATIONS = 'add_reservationcantine_ws';
  final String REMOVE_RESERVATIONS = 'remove_reservationcantine_ws';
  final String PDF_RESERVATIONS = 'plancantinepdf_ws';

  String getUrl(String service) {
    // print('url --> ${'http://inoser2.cnrst.ma/$codeSchool/json/$service'}');
    // return 'http://inoser2.cnrst.ma/$codeSchool/json/$service'; //! TEST
    return 'http://inoser-education.com/$codeSchool/json/$service';
  }

  /*
  static const String LOGIN_INOFACE = BASE_URL+"login_ws";
  static const String ENFANTS = BASE_URL+"enfants_ws";
  static const String MAIN_COUNT = BASE_URL+"main_count_ws";
  static const String JOURS_FERIES = BASE_URL+"jours_feries_ws";
  static const String EVENEMENTS = BASE_URL+"evenements_ws";
  static const String EVENEMENTS_BY_ID = BASE_URL+"EvenementByID_ws";
  static const String INFORMATIONS = BASE_URL+"informations_ws";
  static const String INFORMATIONS_BY_ID = BASE_URL+"InformationByID_ws";
  static const String FORGIT_PASSWORD = BASE_URL+"Forget_password_ws";
  static const String QRCODE = BASE_URL+"login_with_Qrcode_ws";
  static const String AGEND_CONGIG = BASE_URL+"agenda_config_ws";
  static const String AGEND = BASE_URL+"agenda_ws";
  static const String AGENDA_DATES = BASE_URL+"agenda_dates_ws";
  static const String AGENDA_BY_ID = BASE_URL+"agenda_byID_ws";
  static const String ADD_NOTE = BASE_URL+"addnote_ws";
  static const String ADD_DEMANDE_ATTESTATION = BASE_URL+"add_demandeattestation_ws";
  static const String DEMANDE_ATTESTATION = BASE_URL+"demandeattestations_ws";
  static const String REMOVE_ATTESTATION = BASE_URL+"remove_demandeattestation_ws";
  static const String PRIVACY = 'https://sites.google.com/view/inoface';

  static const String RESERVATIONS_DATE = BASE_URL+'reservationscantinedates_ws';
  static const String GET_RESERVATIONS = BASE_URL+'Getreservationcantine_ws';
  static const String ADD_RESERVATIONS = BASE_URL+'add_reservationcantine_ws';
  static const String REMOVE_RESERVATIONS = BASE_URL+'remove_reservationcantine_ws';
  static const String PDF_RESERVATIONS = BASE_URL+'plancantinepdf_ws';
   */
}