import 'package:unittest/unittest.dart';

import 'package:ripple_rest/ripple_rest_io.dart';

void main() {
  group("The Ripple REST API", () {
    final client = new RippleRestClient('http://192.168.0.14:5990');

    test("provides access to the server status", () {
      client.getServerStatus().then(expectAsync((status) {
        expect(status['success'], true);
      }));
    });

    test("provides access to account settings", () {
      client.getAccountSettings('rHb9CJAWyB4rj91VRWn96DkukG4bwdtyTh').then(expectAsync((settings) {
        expect(settings.domain, 'example.org');
      }));
    });

    test("provides access to account balances", () {
      client.getBalances('rHb9CJAWyB4rj91VRWn96DkukG4bwdtyTh').then(expectAsync((List<Balance> balances) {
        expect(balances.length, greaterThan(0));
        expect(balances.first.currency, equals('XRP'));
      }));
    });

    test("provides access to transactions", () {
      client.getTransaction('6434F18B3997D81152F1AB31911E8D40E1346A05478419B7B3DF78B270C1151A').then(expectAsync((tx) {
        expect(tx['Fee'], equals("12"));
        expect(tx['LimitAmount']['currency'], equals('USD'));
      }));
    });


  });
}