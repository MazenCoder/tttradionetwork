import 'package:data_connection_checker/data_connection_checker.dart';

class NetworkConn {

  /// TEST
  // Future<bool> get isConnected => Future.value(true); //DataConnectionChecker().hasConnection ?? false;

  Future<bool> get isConnected => DataConnectionChecker().hasConnection ?? false;
}

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {

  final DataConnectionChecker connectionChecker;
  NetworkInfoImpl(this.connectionChecker);


  /// TEST
  // @override
  // Future<bool> get isConnected => Future.value(true); //connectionChecker.hasConnection ?? false;

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection ?? false;
}
