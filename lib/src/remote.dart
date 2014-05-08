part of ripple_rest;

/**
 * An [RemoteException] is thrown on unsuccessful responses to RPC requests.
 */
class RemoteException implements Exception {
  String message;

  RemoteException(this.message);

  String toString() => message;
}

/**
 * The Ripple-REST RPC interface.
 *
 * [Ripple REST API documenation](https://dev.ripple.com)
 * [Ripple REST API endpoints]('/v1');
 */
abstract class Remote {
  /**
   * Send an HTTP GET request.
   */
  Future<Map> get(String path);

  /**
   * Send an HTTP POST request.
   */
  Future<Map> post(String path, Map body);

  /**
   * Queries for possible payment paths. Returns a [List] of potential [Payment]
   * objects.
   *
   * The optional [sourceCurrencies] parameter is a list of source currencies
   * to filter the resutls of the path-finding query.
   */
  Future<List<Payment>> getPaymentPaths(
      String account, String destinationAccount, String destinationAmount,
      {String sourceCurrencies}) {

    var path = 'accounts/$account/payments/paths/$destinationAccount/$destinationAmount';

    if (sourceCurrencies != null) {
      path = '$path?source_currencies=$sourceCurrencies';
    }

    return get(path).then((response) {
      if (_isSuccess(response)) {
        return response['payments'].map((p) => new Payment.fromMap(p)).toList();
      }
    });
  }

  /**
   * Returns the historical payments of an [account] as a [List] of [Payment]
   * objects.
   *
   * This method accepts optional parameters for filtering the results. More
   * specifically, you can filter by [sourceAccount], [destinationAccount],
   * [direction] (e.g. 'incoming', 'outgoing', 'pending', 'earliest_first'),
   * [startLedger], [endLedger]. Additionally, you can set the [resultsPerPage]
   * and the starting [page].
   */
  Future<List<Payment>> getPayments(String account, {
      String sourceAccount,
      String destinationAccount,
      bool excludeFailed,
      String direction,
      int startLedger,
      int endLedger,
      int resultsPerPage,
      int page}) {
    final params = [];

    if (sourceAccount != null) params.add('source_account=$sourceAccount');
    if (destinationAccount != null) params.add('destination_account=$destinationAccount');
    if (excludeFailed != null) params.add('exclude_failed=$excludeFailed');
    if (direction != null) params.add('direction=$direction');
    if (startLedger != null) params.add('start_ledger=$startLedger');
    if (endLedger != null) params.add('end_ledger=$endLedger');
    if (resultsPerPage != null) params.add('results_per_page=$resultsPerPage');
    if (page != null) params.add('page=$page');

    final path = 'accounts/$account/payments${params.isNotEmpty ? '?${params.join('&')}' : ''}';

    return get(path).then((response) {
      if (_isSuccess(response)) {
        // TODO: handle the [client_resource_id].
        return response['payments'].map((p) => new Payment.fromMap(p['payment'])).toList();
      }
    });
  }

  /**
   * Returns details for a specific payment indentified by a transaction [hash]
   * or a clientResourceId (i.e. an UUID).
   */
  Future<Payment> getPayment(String account, String hashOrId) {
    return get('accounts/$account/payments/$hashOrId').then((response) {
      if (_isSuccess(response)) {
        return response['payment'];
      }
    });
  }

  /**
   * Get the balances of an account.
   */
  Future<List<Balance>> getBalances(String account) {
    return get('accounts/$account/balances').then((response) {
      if (_isSuccess(response)) {
        return response['balances'].map((b) => new Balance.fromMap(b)).toList();
      }
    });
  }

  /**
   * Returns the settings of an [account].
   */
  Future<AccountSettings> getAccountSettings(String account) {
    return get('accounts/$account/settings').then((response) {
      if (_isSuccess(response)) {
        return new AccountSettings.fromMap(response['settings']);
      }
    });
  }

  /**
   * Returns the trustlines of an account.
   */
  Future<List<Trustline>> getTrustlines(String account) {
    return get('accounts/$account/trustlines').then((response) {
      if (_isSuccess(response)) {
        return response['trustlines'].map((b) => new Trustline.fromMap(b)).toList();
      }
    });
  }

  /**
   * Returns a notification corresponding to a transaction.
   */
  Future<Notification> getNotification(String account, String transactionHash) {
    return get('accounts/$account/notifications/$transactionHash').then((response) {
      if (_isSuccess(response)) {
        return new Notification.fromMap(response['notification']);
      }
    });
  }

  /**
   * Returns [true] if the REST server is connected to the rippled server.
   */
  Future<bool> isServerConnected() {
    return get('server/connected').then((response) {
      if (_isSuccess(response)) {
        return response['connected'];
      }
    });
  }

  /**
   * Returns the REST server status.
   */
  Future<Map> getServerStatus() {
    return get('server').then((response) {
      if (_isSuccess(response)) {
        return response;
      }
    });
  }

  /**
   * Returns details for the transaction identified by the given [transactionHash].
   *
   * The transaction details are returned as a [Map].
   */
  Future<Map> getTransaction(String transactionHash) {
    return get('tx/$transactionHash').then((response) {
      if (_isSuccess(response)) {
        return response['transaction'];
      }
    });
  }

  /**
   * Generates a new, random UUID. Useful as a value for [clientResourceId].
   */
  Future<String> generateUuid() {
    return get('uuid').then((response) {
      if (_isSuccess(response)) {
        return response['uuid'];
      }
    });
  }

  /**
   * Submits a payment to the Ripple network.
   *
   * To prevent double-spending only one payment is permitted for a given
   * [clientResourceId].
   */
  Future<Map> submitPayment(String clientResourceId, String secret, Payment payment) {
    return post('payments', {
        'secret': secret,
        'client_resource_id': clientResourceId,
        'payment': payment.toMap()}).then((response) {
      if (_isSuccess(response)) {
        response.remove('success');
        return response;
      }
    });
  }

  /**
   * Updates the settings of an [account].
   */
  Future<Map> setAccountSettings(String account, String secret, AccountSettings accountSettings) {
    return post('accounts/$account/settings', {
        'secret': secret,
        'settings': accountSettings.toMap()}).then((response) {
      if (_isSuccess(response)) {
        // TODO: Temporary, try to remove an object.
        response.remove('success');
        return response;
      }
    });
  }

  /**
   * Adds or updates a [trustline] of an [account].
   */
  Future<Trustline> setTrustline(String account, String secret, Trustline trustline) {
    return post('accounts/$account/trustlines', {
        'secret': secret,
        'trustline': trustline.toMap()}).then((response) {
      if (_isSuccess(response)) {
        return new Trustline.fromMap(response['trustline']);
      }
    });
  }

  bool _isSuccess(Map response) {
    if (!response['success']) {
      throw new RemoteException(response.containsKey('message') ? response['message'] : response['error']);
    }
    return true;
  }
}