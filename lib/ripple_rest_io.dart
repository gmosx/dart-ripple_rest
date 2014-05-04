library ripple_rest.io;

import 'dart:async';
import 'dart:convert' show JSON;

import 'package:http/http.dart' as http;

import 'ripple_rest.dart';
export 'ripple_rest.dart';

class RestClient extends RippleRestClient {
  http.Client _client;

  RestClient(String url, {String version: 'v1'}) : super(url, version: version) {
    _client = new http.Client();
  }

  @override
  Future<Map> get(String path) {
    return _client.get('$url/$version/$path').then((response) {
      return JSON.decode(response.body);
    });
  }

  @override
  Future<Map> post(String path, Map params) {
    // TODO: find out the correct encoding of body.
    return _client.post('$url/$version/$path', body: params).then((response) {
      return JSON.decode(response.body);
    });
  }
}