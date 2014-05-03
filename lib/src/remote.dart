part of ripple_rest;

class Remote {
  RippleRestClient _client;

  Remote(this._client);

  Future<AccountSettings> getAccountSettings(String account) {
    return _client.get('accounts/$account/settings').then((response) {
      if (response['success']) {
        return new AccountSettings.fromMap(response['settings']);
      } else {
        return null;
      }
    });
  }

  Future<List<Balance>> getBalances() {
    return null;
  }

  Future<List<Trustline>> getTrustlines() {
    return null;
  }
}