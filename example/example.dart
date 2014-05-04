import 'package:ripple_rest/ripple_rest.dart';
import 'package:ripple_rest/ripple_rest_io.dart' as ripple;

void main() {
  final client = new ripple.RestClient('http://192.168.0.14:5990');
  final remote = new Remote(client);

//  remote.getAccountSettings('rHb9CJAWyB4rj91VRWn96DkukG4bwdtyTh').then((settings) {
//    print(settings.domain);
//  });

  remote.getTransaction('6434F18B3997D81152F1AB31911E8D40E1346A05478419B7B3DF78B270C1151A').then((tx) {
    print(tx);
  });
}