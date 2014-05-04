part of ripple_rest;

// TODO: on error (success: false) return error message.
// TODO: on error throw exception?

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

  Future<Map> getTransaction(String transactionHash) {
    return _client.get('tx/$transactionHash').then((response) {
      return response['transaction'];
    });
  }

  Future<Payment> getPayment(String hashOrId) {
    return null;
  }

  Future<List<Balance>> getBalances() {
    return null;
  }

  Future<List<Trustline>> getTrustlines() {
    return null;
  }

  void getPaths() {
  }

  void setAccountSettings() {
  }

  void sendPayment() {
  }

  void setTrustline() {
  }

  _checkSuccess(Map response) {
    // TODO: implement me!
  }
}