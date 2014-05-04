import 'package:ripple_rest/ripple_rest_io.dart' as ripple;

void main() {
  final client = new ripple.RestClient('http://192.168.0.14:5990');

//  client.getAccountSettings('rHb9CJAWyB4rj91VRWn96DkukG4bwdtyTh').then((settings) {
//    print(settings.domain);
//  });
//
//  client.getBalances('rHb9CJAWyB4rj91VRWn96DkukG4bwdtyTh').then((balances) {
//    balances.forEach((b) {
//      print("${b.currency}/${b.counterparty}: ${b.value}");
//    });
//  });

  client.getTrustlines('rHb9CJAWyB4rj91VRWn96DkukG4bwdtyTh').then((trustlines) {
    trustlines.forEach((t) {
      print("${t.currency}/${t.counterparty}: ${t.limit}");
    });
  });

  client.getTransaction('6434F18B3997D81152F1AB31911E8D40E1346A05478419B7B3DF78B270C1151A').then((tx) {
    print(tx);
  });

  client.getTransaction('126434F18B3997D81152F1AB31911E8D40E1346A05478419B7B3DF78B270C1151A').catchError(print);
}