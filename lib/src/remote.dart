part of ripple_rest;

// TODO: add support for stack traces, zones, etc.
/**
 * An RpcException is thrown on unsuccessful responses to RPC requests.
 */
class RpcException implements Exception {
  String message;

  RpcException(this.message);

  String toString() => message;
}

/**
 * The Ripple-REST rpc interface.
 */
abstract class Remote {
  Remote();

  /**
   * Send an HTTP GET request.
   */
  Future<Map> get(String path);

  /**
   * Send an HTTP POST request.
   */
  Future<Map> post(String path, Map params);

  Future<AccountSettings> getAccountSettings(String account) {
    return get('accounts/$account/settings').then((response) {
      if (_isSuccess(response)) {
        return new AccountSettings.fromMap(response['settings']);
      }
    });
  }

  Future<Map> getTransaction(String transactionHash) {
    return get('tx/$transactionHash').then((response) {
      if (_isSuccess(response)) {
        return response['transaction'];
      }
    });
  }

  Future<Payment> getPayment(String hashOrId) {
    return null;
  }

  Future<List<Balance>> getBalances(String account) {
    return get('accounts/$account/balances').then((response) {
      if (_isSuccess(response)) {
        return response['balances'].map((b) => new Balance.fromMap(b));
      }
    });
  }

  Future<List<Trustline>> getTrustlines(String account) {
    return get('accounts/$account/trustlines').then((response) {
      if (_isSuccess(response)) {
        return response['trustlines'].map((b) => new Trustline.fromMap(b));
      }
    });
  }

  void getPaths() {
  }

  void setAccountSettings() {
  }

  void sendPayment() {
  }

  void setTrustline() {
  }

  bool _isSuccess(Map response) {
    if (!response['success']) {
      throw new RpcException(response['message']);
    }
    return true;
  }
}