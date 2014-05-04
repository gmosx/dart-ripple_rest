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
   *
   * [Ripple REST API documenation](https://dev.ripple.com)
   * [Ripple REST API endpoints]('/v1');
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

  Future<List<Payment>> getPayments(String account) {
    return get('accounts/$account/payments').then((response) {
      if (_isSuccess(response)) {
        // TODO: handle the [client_resource_id].
        return response['payments'].map((p) => new Payment.fromMap(p['payment']));
      }
    });
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

  /**
   *
   */
  Future<Notification> getNotification(String account, String transactionHash) {
    return get('accounts/$account/notifications/$transactionHash').then((response) {
      if (_isSuccess(response)) {
        return new Notification.fromMap(response['notification']);
      }
    });
  }

  /**
   *
   */
  Future<Map> getServerStatus() {
    return get('server').then((response) {
      if (_isSuccess(response)) {
        return response;
      }
    });
  }

  /**
   *
   */
  Future<bool> getServerConnected() {
    return get('server/connected').then((response) {
      if (_isSuccess(response)) {
        return response['connected'];
      }
    });
  }

  void getPaths() {
  }

  Future<String> generateUuid() {
    return get('uuid').then((response) {
      if (_isSuccess(response)) {
        return response['uuid'];
      }
    });
  }

  void setAccountSettings() {
  }

  void submitPayment() {
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