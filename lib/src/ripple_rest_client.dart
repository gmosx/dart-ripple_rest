part of ripple_rest;

abstract class RippleRestClient {
  String url;
  String version;

  RippleRestClient(this.url, {this.version: 'v1'});

  Future<Map> get(String path);

  Future<Map> post(String path, Map params);
}