import 'package:ripple_rest/ripple_rest_io.dart';

void main() {
  final client = new Client('localhost:5990');
  print(client.getAccountSettings('rHb9CJAWyB4rj91VRWn96DkukG4bwdtyTh'));
}