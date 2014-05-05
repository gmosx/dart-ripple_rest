// This file is generated automatically from the JSON schema, do *not* edit!

part of ripple_rest;

/**
 * A simplified Order object used by the ripple-rest API (note that "orders" are referred to elsewhere in the Ripple protocol as "offers").
 */
class Order {
  /** The Ripple account address of the order's creator. */
  String /*RippleAddress*/ account;

  /** If set to true the order it indicates that the creator is looking to receive the base_amount in exchange for the counter_amount. If undefined or set to false it indicates that the creator is looking to sell the base_amount to receive the counter_amount. */
  bool buy;

  /** The amount of currency the seller_account is seeking to buy. If other orders take part of this one, this value will change to represent the amount left in the order. This may be specified along with the counter_amount OR exchange_rate but not both. When the order is parsed from the Ripple Ledger the base currency will be determined according to the Priority Ranking of Currencies (XRP,EUR,GBP,AUD,NZD,USD,CAD,CHF,JPY,CNY) and if neither currency is listed in the ranking the base currency will be the one that is alphabetically first. */
  Amount baseAmount;

  /** The amount of currency being sold. If other orders take part of this one, this value will change to represent the amount left in the order. This may be specified along with the base_amount OR the exchange_rate but not both. */
  Amount counterAmount;

  /** A string representation of the order price, defined as the cost one unit of the base currency in terms of the counter currency. This may be specified along with the base_amount OR the counter_amount but not both. If it is unspecified it will be computed automatically based on the counter_amount divided by the base_amount. */
  String /*FloatString*/ exchangeRate;

  /** The ISO combined date and time string representing the point beyond which the order will no longer be considered active or valid. */
  DateTime expirationTimestamp;

  /** A string representation of the number of ledger closes after submission during which the order should be considered active. */
  String ledgerTimeout;

  /** If set to true this order will only take orders that are available at the time of execution and will not create an entry in the Ripple Ledger. */
  bool immediateOrCancel;

  /** If set to true this order will only take orders that fill the base_amount and are available at the time of execution and will not create an entry in the Ripple Ledger. */
  bool fillOrKill;

  /** If set to true and it is a buy order it will buy up to the base_amount even if the counter_amount is exceeded, if it is a sell order it will sell up to the counter_amount even if the base_amount is exceeded. */
  bool maximizeBuyOrSell;

  /** If this is set to the sequence number of an outstanding order, that order will be cancelled and replaced with this one. */
  String cancelReplace;

  /** The sequence number of this order from the perspective of the seller_account. The seller_account and the sequence number uniquely identify the order in the Ripple Ledger. */
  String sequence;

  /** The Ripple Network transaction fee, represented in whole XRP (NOT "drops", or millionths of an XRP, which is used elsewhere in the Ripple protocol) used to create the order. */
  String /*FloatString*/ fee;

  /** If the order is active the state will be "active". If this object represents a historical order the state will be "validated", "filled" if the order was removed because it was fully filled, "cancelled" if it was deleted by the owner, "expired" if it reached the expiration_timestamp, or "failed" if there was an error with the initial attempt to place the order. */
  String state;

  /** The string representation of the index number of the ledger containing this order or, in the case of historical queries, of the transaction that modified this Order. . */
  String ledger;

  /** When returned as the result of a historical query this will be the hash of Ripple transaction that created, modified, or deleted this order. The transaction hash is used throughout the Ripple Protocol to uniquely identify a particular transaction. */
  String /*Hash256*/ hash;

  /** If the order was modified or partially filled this will be a full Order object. If the previous object also had a previous object that will be removed to reduce data complexity. Order changes can be walked backwards by querying the API for previous.hash repeatedly. */
  Order previous;

  Order({
    this.account,
    this.buy,
    this.baseAmount,
    this.counterAmount,
    this.exchangeRate,
    this.expirationTimestamp,
    this.ledgerTimeout,
    this.immediateOrCancel,
    this.fillOrKill,
    this.maximizeBuyOrSell,
    this.cancelReplace,
    this.sequence,
    this.fee,
    this.state,
    this.ledger,
    this.hash,
    this.previous});

  Order.fromMap(Map map) {
    account = map['account'];
    buy = map['buy'];
    baseAmount = map.containsKey('base_amount') ? new Amount.fromMap(map['base_amount']) : null;
    counterAmount = map.containsKey('counter_amount') ? new Amount.fromMap(map['counter_amount']) : null;
    exchangeRate = map['exchange_rate'];
    expirationTimestamp = map.containsKey('expiration_timestamp') ? DateTime.parse(map['expiration_timestamp']) : null;
    ledgerTimeout = map['ledger_timeout'];
    immediateOrCancel = map['immediate_or_cancel'];
    fillOrKill = map['fill_or_kill'];
    maximizeBuyOrSell = map['maximize_buy_or_sell'];
    cancelReplace = map['cancel_replace'];
    sequence = map['sequence'];
    fee = map['fee'];
    state = map['state'];
    ledger = map['ledger'];
    hash = map['hash'];
    previous = map['previous'];
  }

  Map toMap() {
    final map = {};

    if (account != null) map['account'] = account;
    if (buy != null) map['buy'] = buy;
    if (baseAmount.toMap() != null) map['base_amount'] = baseAmount.toMap();
    if (counterAmount.toMap() != null) map['counter_amount'] = counterAmount.toMap();
    if (exchangeRate != null) map['exchange_rate'] = exchangeRate;
    if (expirationTimestamp.toString() != null) map['expiration_timestamp'] = expirationTimestamp.toString();
    if (ledgerTimeout != null) map['ledger_timeout'] = ledgerTimeout;
    if (immediateOrCancel != null) map['immediate_or_cancel'] = immediateOrCancel;
    if (fillOrKill != null) map['fill_or_kill'] = fillOrKill;
    if (maximizeBuyOrSell != null) map['maximize_buy_or_sell'] = maximizeBuyOrSell;
    if (cancelReplace != null) map['cancel_replace'] = cancelReplace;
    if (sequence != null) map['sequence'] = sequence;
    if (fee != null) map['fee'] = fee;
    if (state != null) map['state'] = state;
    if (ledger != null) map['ledger'] = ledger;
    if (hash != null) map['hash'] = hash;
    if (previous != null) map['previous'] = previous;

    return map;
  }
}
