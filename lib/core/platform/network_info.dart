import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get icConnected;
}

class NetworkInfoImplements implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImplements({required this.connectionChecker});

  @override
  Future<bool> get icConnected => connectionChecker.hasConnection;
}
