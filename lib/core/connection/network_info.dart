// Permissions not implemented for android and macOS platforms.
// Check: https://pub.dev/packages/internet_connection_checker_plus

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  Future<bool>? isConnected();
}

class NetworkInfoStatus implements NetworkInfo {
  final InternetConnection connectionChecker;

  NetworkInfoStatus(this.connectionChecker);

  @override
  Future<bool> isConnected() => connectionChecker.hasInternetAccess;
}
