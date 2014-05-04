part of ripple_rest;

// TODO: on error (success: false) return error message.
// TODO: on error throw exception?

/**
 * An RpcException is thrown on unsuccessful responses to RPC requests.
 */
class RpcException implements Exception {
  String message;

  RpcException(this.message);
  // TODO: add support for stack traces, zones, etc.
  String toString() => message;
}

/**
 * The Ripple-REST rpc interface.
 */
abstract class Remote {
  Remote();

  Future<Map> get(String path);

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

  bool _isSuccess(Map response) {
    if (!response['success']) {
      throw new RpcException(response['message']);
    }
    return true;
  }
}