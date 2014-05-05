// This file is generated automatically from the JSON schema, do *not* edit!

part of ripple_rest;

/**
 * An object.
 */
class AccountSettings {
  /** The Ripple address of the account in question. */
  String /*RippleAddress*/ account;

  /** The hash of an optional additional public key that can be used for signing and verifying transactions. */
  String /*RippleAddress*/ regularKey;

  /** The domain associated with this account. The ripple.txt file can be looked up to verify this information. */
  String /*URL*/ domain;

  /** The MD5 128-bit hash of the account owner's email address. */
  String /*Hash128*/ emailHash;

  /** An optional public key, represented as hex, that can be set to allow others to send encrypted messages to the account owner. */
  String messageKey;

  /** A number representation of the rate charged each time a holder of currency issued by this account transfers it. By default the rate is 100. A rate of 101 is a 1% charge on top of the amount being transferred. Up to nine decimal places are supported. */
  int /*UINT32*/ transferRate;

  /** If set to true incoming payments will only be validated if they include a destination_tag. This may be used primarily by gateways that operate exclusively with hosted wallets. */
  bool requireDestinationTag;

  /** If set to true incoming trustlines will only be validated if this account first creates a trustline to the counterparty with the authorized flag set to true. This may be used by gateways to prevent accounts unknown to them from holding currencies they issue. */
  bool requireAuthorization;

  /** If set to true incoming XRP payments will be allowed. */
  bool disallowXrp;

  /** A string representation of the last sequence number of a validated transaction created by this account. */
  String /*UINT32*/ transactionSequence;

  /** The number of trustlines owned by this account. This value does not include incoming trustlines where this account has not explicitly reciprocated trust. */
  String /*UINT32*/ trustlineCount;

  /** The string representation of the index number of the ledger containing these account settings or, in the case of historical queries, of the transaction that modified these settings. */
  String ledger;

  /** If this object was returned by a historical query this value will be the hash of the transaction that modified these settings. The transaction hash is used throughout the Ripple Protocol to uniquely identify a particular transaction. */
  String /*Hash256*/ hash;

  AccountSettings({
    this.account,
    this.regularKey,
    this.domain,
    this.emailHash,
    this.messageKey,
    this.transferRate,
    this.requireDestinationTag,
    this.requireAuthorization,
    this.disallowXrp,
    this.transactionSequence,
    this.trustlineCount,
    this.ledger,
    this.hash});

  AccountSettings.fromMap(Map map) {
    account = map['account'];
    regularKey = map['regular_key'];
    domain = map['domain'];
    emailHash = map['email_hash'];
    messageKey = map['message_key'];
    transferRate = map['transfer_rate'];
    requireDestinationTag = map['require_destination_tag'];
    requireAuthorization = map['require_authorization'];
    disallowXrp = map['disallow_xrp'];
    transactionSequence = map.containsKey('transaction_sequence') ? map['transaction_sequence'].toString() : null;
    trustlineCount = map.containsKey('trustline_count') ? map['trustline_count'].toString() : null;
    ledger = map['ledger'];
    hash = map['hash'];
  }

  Map toMap() {
    final map = {};

    if (account != null) map['account'] = account;
    if (regularKey != null) map['regular_key'] = regularKey;
    if (domain != null) map['domain'] = domain;
    if (emailHash != null) map['email_hash'] = emailHash;
    if (messageKey != null) map['message_key'] = messageKey;
    if (transferRate != null) map['transfer_rate'] = transferRate;
    if (requireDestinationTag != null) map['require_destination_tag'] = requireDestinationTag;
    if (requireAuthorization != null) map['require_authorization'] = requireAuthorization;
    if (disallowXrp != null) map['disallow_xrp'] = disallowXrp;
    if (transactionSequence != null) map['transaction_sequence'] = transactionSequence;
    if (trustlineCount != null) map['trustline_count'] = trustlineCount;
    if (ledger != null) map['ledger'] = ledger;
    if (hash != null) map['hash'] = hash;

    return map;
  }
}
