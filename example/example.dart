import 'package:ripple_rest/ripple_rest_io.dart';

void main() {
  final client = new RippleRestClient('http://192.168.0.14:5990');

//  client.getBalances('rHb9CJAWyB4rj91VRWn96DkukG4bwdtyTh').then((balances) {
//    balances.forEach((b) {
//      print("${b.currency}/${b.counterparty}: ${b.value}");
//    });
//  });
//
//  client.getTrustlines('rHb9CJAWyB4rj91VRWn96DkukG4bwdtyTh').then((trustlines) {
//    trustlines.forEach((t) {
//      print("${t.currency}/${t.counterparty}: ${t.limit}");
//    });
//  });
//
//  client.getTransaction('6434F18B3997D81152F1AB31911E8D40E1346A05478419B7B3DF78B270C1151A').then((tx) {
//    print(tx);
//  });
//
//  client.getTransaction('126434F18B3997D81152F1AB31911E8D40E1346A05478419B7B3DF78B270C1151A').catchError(print);
//
//  client.getNotification('rPs7nVbSops6xm4v77wpoPFf549cqjzUy9', 'EA1C8349FFFDB180BF6805FB69B32A41A5C86E27B4F79BED3CD8BA9A1E902721').then((notification) {
//    print(notification.toMap());
//  });
//
//  client.getServerStatus().then(print);
//  client.getServerConnected().then(print);
//
//  client.generateUuid().then(print);
//
//  client.getPayments('rHb9CJAWyB4rj91VRWn96DkukG4bwdtyTh', resultsPerPage: 3).then((payments) {
//    payments.forEach((p) {
//      print(p.toMap());
//    });
//  });

  var trustline = new Trustline(
    limit: '110',
    currency: 'XRP',
    counterparty: 'rPs7nVbSops6xm4v77wpoPFf549cqjzUy9',
    accountAllowsRippling: true
  );
  client.setTrustline('rHb9CJAWyB4rj91VRWn96DkukG4bwdtyTh', "secret", trustline).catchError(print);
}