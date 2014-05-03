import 'package:ripple_rest/ripple_rest.dart';
import 'package:ripple_rest/ripple_rest_io.dart' as ripple;

void main() {
  final client = new ripple.RestClient('http://192.168.0.14:5990');
  final remote = new Remote(client);

  remote.getAccountSettings('rHb9CJAWyB4rj91VRWn96DkukG4bwdtyTh').then((settings) {
    print(settings.domain);
  });
}