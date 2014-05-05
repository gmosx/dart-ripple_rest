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
      client.getBalances('rHb9CJAWyB4rj91VRWn96DkukG4bwdtyTh').then(expectAsync((balances) {
        expect(balances.length, greaterThan(0));
      }));
    });
  });
}