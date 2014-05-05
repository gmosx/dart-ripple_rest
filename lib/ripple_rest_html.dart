library ripple_rest.html;

import 'dart:html';
import 'dart:async';
import 'dart:convert' show JSON;

import 'ripple_rest.dart';
export 'ripple_rest.dart';

/**
 * Ripple REST API client, dart:html version.
 */
class RippleRestClient extends Rpc {
  String url;
  String version;

  RippleRestClient(this.url, {this.version: 'v1'});

  @override
  Future<Map> get(String path) {
    return HttpRequest.request('$url/$version/$path', method: 'GET').then((request) {
      return JSON.decode(request.response.body);
    });
  }

  @override
  Future<Map> post(String path, Map body) {
    return HttpRequest.request(
        '$url/$version/$path',
        method: 'POST',
        requestHeaders: {'Content-Type': 'application/json'},
        sendData: JSON.encode(body)).then((request) {
      return JSON.decode(request.response.body);
    });
  }
}