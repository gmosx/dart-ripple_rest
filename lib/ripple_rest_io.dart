library ripple_rest.io;

import 'dart:async';
import 'dart:convert' show JSON;

import 'package:http/http.dart' as http;

import 'ripple_rest.dart';
export 'ripple_rest.dart';

/**
 * Ripple REST API client, dart:io version.
 */
class RestClient extends Remote {
  String url;
  String version;
  http.Client _client;

  RestClient(this.url, {this.version: 'v1'}) {
    _client = new http.Client();
  }

  @override
  Future<Map> get(String path) {
    return _client.get('$url/$version/$path').then((response) {
      return JSON.decode(response.body);
    });
  }

  @override
  Future<Map> post(String path, Map body) {
    return _client.post(
        '$url/$version/$path',
        headers: {'Content-Type': 'application/json'},
        body: JSON.encode(body)).then((response) {
      return JSON.decode(response.body);
    });
  }
}