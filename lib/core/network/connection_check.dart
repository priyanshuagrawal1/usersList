import 'package:data_connection_checker/data_connection_checker.dart';

class CheckConnection {
  DataConnectionChecker dataConnectionChecker;
  CheckConnection(this.dataConnectionChecker);

Future<bool> get isConnected => dataConnectionChecker.hasConnection;
}
