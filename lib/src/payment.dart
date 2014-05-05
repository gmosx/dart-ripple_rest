// This file is generated automatically from the JSON schema, do *not* edit!

part of ripple_rest;

/**
 * A flattened Payment object used by the ripple-rest API.
 */
class Payment {
  /** The Ripple account address of the Payment sender. */
  String /*RippleAddress*/ sourceAccount;

  /** A string representing an unsigned 32-bit integer most commonly used to refer to a sender's hosted account at a Ripple gateway. */
  String /*UINT32*/ sourceTag;

  /** An optional amount that can be specified to constrain cross-currency payments. */
  Amount sourceAmount;

  /** An optional cushion for the source_amount to increase the likelihood that the payment will succeed. The source_account will never be charged more than source_amount.value + source_slippage. */
  String /*FloatString*/ sourceSlippage;

  /** null. */
  String /*RippleAddress*/ destinationAccount;

  /** A string representing an unsigned 32-bit integer most commonly used to refer to a receiver's hosted account at a Ripple gateway. */
  String /*UINT32*/ destinationTag;

  /** The amount the destination_account will receive. */
  Amount destinationAmount;

  /** A 256-bit hash that can be used to identify a particular payment. */
  String /*Hash256*/ invoiceId;

  /** A "stringified" version of the Ripple PathSet structure that users should treat as opaque. */
  String paths;

  /** A boolean that, if set to true, indicates that this payment should go through even if the whole amount cannot be delivered because of a lack of liquidity or funds in the source_account account. */
  bool partialPayment;

  /** A boolean that can be set to true if paths are specified and the sender would like the Ripple Network to disregard any direct paths from the source_account to the destination_account. This may be used to take advantage of an arbitrage opportunity or by gateways wishing to issue balances from a hot wallet to a user who has mistakenly set a trustline directly to the hot wallet. */
  bool noDirectRipple;

  /** The direction of the payment, from the perspective of the account being queried. Possible values are "incoming", "outgoing", and "passthrough". */
  String direction;

  /** The state of the payment from the perspective of the Ripple Ledger. Possible values are "validated" and "failed" and "new" if the payment has not been submitted yet. */
  String state;

  /** The rippled code indicating the success or failure type of the payment. The code "tesSUCCESS" indicates that the payment was successfully validated and written into the Ripple Ledger. All other codes will begin with the following prefixes: "tec", "tef", "tel", or "tej". */
  String result;

  /** The string representation of the index number of the ledger containing the validated or failed payment. Failed payments will only be written into the Ripple Ledger if they fail after submission to a rippled and a Ripple Network fee is claimed. */
  String ledger;

  /** The 256-bit hash of the payment. This is used throughout the Ripple protocol as the unique identifier for the transaction. */
  String /*Hash256*/ hash;

  /** The timestamp representing when the payment was validated and written into the Ripple ledger. */
  DateTime timestamp;

  /** The Ripple Network transaction fee, represented in whole XRP (NOT "drops", or millionths of an XRP, which is used elsewhere in the Ripple protocol). */
  String /*FloatString*/ fee;

  /** Parsed from the validated transaction metadata, this array represents all of the changes to balances held by the source_account. Most often this will have one amount representing the Ripple Network fee and, if the source_amount was not XRP, one amount representing the actual source_amount that was sent. */
  List<Amount> sourceBalanceChanges;

  /** Parsed from the validated transaction metadata, this array represents the changes to balances held by the destination_account. For those receiving payments this is important to check because if the partial_payment flag is set this value may be less than the destination_amount. */
  List<Amount> destinationBalanceChanges;

  Payment({
    this.sourceAccount,
    this.sourceTag,
    this.sourceAmount,
    this.sourceSlippage,
    this.destinationAccount,
    this.destinationTag,
    this.destinationAmount,
    this.invoiceId,
    this.paths,
    this.partialPayment,
    this.noDirectRipple,
    this.direction,
    this.state,
    this.result,
    this.ledger,
    this.hash,
    this.timestamp,
    this.fee,
    this.sourceBalanceChanges,
    this.destinationBalanceChanges});

  Payment.fromMap(Map map) {
    sourceAccount = map['source_account'];
    sourceTag = map.containsKey('source_tag') ? map['source_tag'].toString() : null;
    sourceAmount = map.containsKey('source_amount') ? new Amount.fromMap(map['source_amount']) : null;
    sourceSlippage = map['source_slippage'];
    destinationAccount = map['destination_account'];
    destinationTag = map.containsKey('destination_tag') ? map['destination_tag'].toString() : null;
    destinationAmount = map.containsKey('destination_amount') ? new Amount.fromMap(map['destination_amount']) : null;
    invoiceId = map['invoice_id'];
    paths = map['paths'];
    partialPayment = map['partial_payment'];
    noDirectRipple = map['no_direct_ripple'];
    direction = map['direction'];
    state = map['state'];
    result = map['result'];
    ledger = map['ledger'];
    hash = map['hash'];
    timestamp = map.containsKey('timestamp') ? DateTime.parse(map['timestamp']) : null;
    fee = map['fee'];
    sourceBalanceChanges = map.containsKey('source_balance_changes') ? map['source_balance_changes'].map((x) => new Amount.fromMap(x)).toList() : null;
    destinationBalanceChanges = map.containsKey('destination_balance_changes') ? map['destination_balance_changes'].map((x) => new Amount.fromMap(x)).toList() : null;
  }

  Map toMap() {
    final map = {};

    if (sourceAccount != null) map['source_account'] = sourceAccount;
    if (sourceTag != null) map['source_tag'] = sourceTag;
    if (sourceAmount.toMap() != null) map['source_amount'] = sourceAmount.toMap();
    if (sourceSlippage != null) map['source_slippage'] = sourceSlippage;
    if (destinationAccount != null) map['destination_account'] = destinationAccount;
    if (destinationTag != null) map['destination_tag'] = destinationTag;
    if (destinationAmount.toMap() != null) map['destination_amount'] = destinationAmount.toMap();
    if (invoiceId != null) map['invoice_id'] = invoiceId;
    if (paths != null) map['paths'] = paths;
    if (partialPayment != null) map['partial_payment'] = partialPayment;
    if (noDirectRipple != null) map['no_direct_ripple'] = noDirectRipple;
    if (direction != null) map['direction'] = direction;
    if (state != null) map['state'] = state;
    if (result != null) map['result'] = result;
    if (ledger != null) map['ledger'] = ledger;
    if (hash != null) map['hash'] = hash;
    if (timestamp.toString() != null) map['timestamp'] = timestamp.toString();
    if (fee != null) map['fee'] = fee;
    if (sourceBalanceChanges != null) map['source_balance_changes'] = sourceBalanceChanges;
    if (destinationBalanceChanges != null) map['destination_balance_changes'] = destinationBalanceChanges;

    return map;
  }
}
