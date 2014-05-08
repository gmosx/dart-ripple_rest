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

    test("provides a UUID generator", () {
      client.generateUuid().then(expectAsync((uuid) {
        expect(uuid.length, equals(36));
      }));
    });

    test("provides access to account payment history", () {
      client.getPayments('rHb9CJAWyB4rj91VRWn96DkukG4bwdtyTh', resultsPerPage: 3).then(expectAsync((List<Payment> payments) {
        expect(payments.length, equals(3));
        expect(payments.first.destinationAmount.value, equals('2'));
        expect(payments.first.sourceBalanceChanges.length, equals(3));
        expect(payments[1].destinationAccount, equals('r3kmLJN5D28dHuH8vZNUZpMC43pEHpaocV'));
      }));
    });

    test("provides access to the REST server status", () {
      client.getServerStatus().then(expectAsync((Map status) {
        expect(status.containsKey('rippled_server_url'), isTrue);
      }));
    });

    test("provides access to the server connection status", () {
      client.isServerConnected().then(expectAsync((bool connected) {
        expect(connected, isTrue);
      }));
    });
  });
}