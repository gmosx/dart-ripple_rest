// This file is generated automatically from the JSON schema, do *not* edit!

part of ripple_rest;

/**
 * A.
 */
class Notification {
  /** The Ripple address of the account to which the notification pertains. */
  String /*RippleAddress*/ account;

  /** The resource type this notification corresponds to. Possible values are "payment", "order", "trustline", "accountsettings". */
  String type;

  /** The direction of the transaction, from the perspective of the account being queried. Possible values are "incoming", "outgoing", and "passthrough". */
  String direction;

  /** The state of the transaction from the perspective of the Ripple Ledger. Possible values are "validated" and "failed". */
  String state;

  /** The rippled code indicating the success or failure type of the transaction. The code "tesSUCCESS" indicates that the transaction was successfully validated and written into the Ripple Ledger. All other codes will begin with the following prefixes: "tec", "tef", "tel", or "tej". */
  String result;

  /** The string representation of the index number of the ledger containing the validated or failed transaction. Failed payments will only be written into the Ripple Ledger if they fail after submission to a rippled and a Ripple Network fee is claimed. */
  String ledger;

  /** The 256-bit hash of the transaction. This is used throughout the Ripple protocol as the unique identifier for the transaction. */
  String /*Hash256*/ hash;

  /** The timestamp representing when the transaction was validated and written into the Ripple ledger. */
  DateTime timestamp;

  /** A URL that can be used to fetch the full resource this notification corresponds to. */
  String transactionUrl;

  /** A URL that can be used to fetch the notification that preceded this one chronologically. */
  String previousNotificationUrl;

  /** A URL that can be used to fetch the notification that followed this one chronologically. */
  String nextNotificationUrl;

  Notification({
    this.account,
    this.type,
    this.direction,
    this.state,
    this.result,
    this.ledger,
    this.hash,
    this.timestamp,
    this.transactionUrl,
    this.previousNotificationUrl,
    this.nextNotificationUrl});

  Notification.fromMap(Map map) {
    account = map['account'];
    type = map['type'];
    direction = map['direction'];
    state = map['state'];
    result = map['result'];
    ledger = map['ledger'];
    hash = map['hash'];
    timestamp = map.containsKey('timestamp') ? DateTime.parse(map['timestamp']) : null;
    transactionUrl = map['transaction_url'];
    previousNotificationUrl = map['previous_notification_url'];
    nextNotificationUrl = map['next_notification_url'];
  }

  Map toMap() {
    final map = {};

    if (account != null) map['account'] = account;
    if (type != null) map['type'] = type;
    if (direction != null) map['direction'] = direction;
    if (state != null) map['state'] = state;
    if (result != null) map['result'] = result;
    if (ledger != null) map['ledger'] = ledger;
    if (hash != null) map['hash'] = hash;
    if (timestamp != null) map['timestamp'] = timestamp.toString();
    if (transactionUrl != null) map['transaction_url'] = transactionUrl;
    if (previousNotificationUrl != null) map['previous_notification_url'] = previousNotificationUrl;
    if (nextNotificationUrl != null) map['next_notification_url'] = nextNotificationUrl;

    return map;
  }
}
