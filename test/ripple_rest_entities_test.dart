import 'dart:convert' show JSON;

import 'package:unittest/unittest.dart';

import 'package:ripple_rest/ripple_rest.dart';

void main() {
  group("fromMap", () {
    test("deserializes 'Timestamp' fields into DateTime properties", () {
      final json = '{"timestamp": "2014-04-18T01:21:00.000Z"}';
      final notification = new Notification.fromMap(JSON.decode(json));

      expect(notification.timestamp.runtimeType, equals(DateTime));
      expect(notification.timestamp.year, equals(2014));
      expect(notification.timestamp.month, equals(4));
      expect(notification.timestamp.day, equals(18));
      expect(notification.timestamp.hour, equals(1));
    });

    test("deserializes JSON arrays into lists", () {
      final json = '''
{
  "source_balance_changes": 
    [ 
      {
        "value": "-1.000012",
        "currency": "XRP",
        "issuer": ""
      }
    ]
}
''';
      final payment = new Payment.fromMap(JSON.decode(json));

      expect(payment.sourceBalanceChanges.first.currency, equals('XRP'));
    });
  });

  group("toMap", () {
    final settings = new AccountSettings(
      domain: 'www.test.org',
      hash: 'dummyhash'
    );

    test("serializes non-null properties", () {
      final map = settings.toMap();
      expect(map['domain'], 'www.test.org');
      expect(map['hash'], 'dummyhash');
      expect(map.length, 2);
    });
  });
}