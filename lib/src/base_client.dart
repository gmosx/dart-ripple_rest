part of ripple_rest;

abstract class BaseClient {
  String url;
  String version;

  BaseClient(this.url, {this.version: 'v1'});

  Future<Map> get(String path);

  Future<Map> post(String path, Map params);

  Future<AccountSettings> getAccountSettings(String account) {
    return get('accounts/$account/settings').then((data) {
      return new AccountSettings.fromData(data);
    });
  }

  Future<List<Balance>> getBalances() {
    return null;
  }

  Future<List<Trustline>> getTrustlines() {
    return null;
  }
}