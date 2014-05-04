import 'package:unittest/unittest.dart';
import 'package:ripple_rest/ripple_rest_io.dart' as ripple;

void main() {
  group("Ripple REST API for dart:io", () {
    final client = new ripple.RestClient('http://192.168.0.14:5990');

    test("server status", () {
      client.getServerStatus().then(expectAsync((status) {
        expect(status['success'], true);
      }));
    });
  });
}