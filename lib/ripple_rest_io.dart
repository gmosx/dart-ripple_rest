//library ripple_rest.io;
//
//import 'dart:io';
//import 'dart:async';
//import 'dart:convert' show JSON;
//
//import 'package:http/http.dart' as http;
//
//import 'ripple_rest.dart';
//export 'ripple_rest.dart';
//
//class Client extends BaseClient {
//  http.Client _client;
//
//  Client(String url, {String version}) : super(url, version: version) {
//    _client = new http.Client();
//  }
//
//  @override
//  Future<Map> get(String path) {
//    return _client.get('$url/$version/$path').then((response) {
//      return JSON.decode(response.body);
//    });
//  }
//
//  @override
//  Future<Map> post(String path, Map params) {
//    // TODO: implement post
//    return null;
//  }
//}