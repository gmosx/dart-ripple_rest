part of ripple_rest;

// TODO: on error (success: false) return error message.
// TODO: on error throw exception?

/**
 * The Ripple-REST rpc interface.
 */
abstract class Remote {
  Remote();

  Future<Map> get(String path);

  Future<Map> post(String path, Map params);

  Future<AccountSettings> getAccountSettings(String account) {
    return get('accounts/$account/settings').then((response) {
      if (response['success']) {
        return new AccountSettings.fromMap(response['settings']);
      } else {
        return null;
      }
    });
  }

  Future<Map> getTransaction(String transactionHash) {
    return get('tx/$transactionHash').then((response) {
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