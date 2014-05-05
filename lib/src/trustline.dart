// This file is generated automatically from the JSON schema, do *not* edit!

part of ripple_rest;

/**
 * A simplified Trustline object used by the ripple-rest API.
 */
class Trustline {
  /** The account from whose perspective this trustline is being viewed. */
  String /*RippleAddress*/ account;

  /** The other party in this trustline. */
  String /*RippleAddress*/ counterparty;

  /** The code of the currency in which this trustline denotes trust. */
  String /*Currency*/ currency;

  /** The maximum value of the currency that the account may hold issued by the counterparty. */
  String /*FloatString*/ limit;

  /** The maximum value of the currency that the counterparty may hold issued by the account. */
  String /*FloatString*/ reciprocatedLimit;

  /** Set to true if the account has explicitly authorized the counterparty to hold currency it issues. This is only necessary if the account's settings include require_authorization_for_incoming_trustlines. */
  bool authorizedByAccount;

  /** Set to true if the counterparty has explicitly authorized the account to hold currency it issues. This is only necessary if the counterparty's settings include require_authorization_for_incoming_trustlines. */
  bool authorizedByCounterparty;

  /** If true it indicates that the account allows pairwise rippling out through this trustline. */
  bool accountAllowsRippling;

  /** If true it indicates that the counterparty allows pairwise rippling out through this trustline. */
  bool counterpartyAllowsRippling;

  /** The string representation of the index number of the ledger containing this trustline or, in the case of historical queries, of the transaction that modified this Trustline. */
  String ledger;

  /** If this object was returned by a historical query this value will be the hash of the transaction that modified this Trustline. The transaction hash is used throughout the Ripple Protocol to uniquely identify a particular transaction. */
  String /*Hash256*/ hash;

  /** If the trustline was changed this will be a full Trustline object representing the previous values. If the previous object also had a previous object that will be removed to reduce data complexity. Trustline changes can be walked backwards by querying the API for previous.hash repeatedly. */
  Trustline previous;

  Trustline({
    this.account,
    this.counterparty,
    this.currency,
    this.limit,
    this.reciprocatedLimit,
    this.authorizedByAccount,
    this.authorizedByCounterparty,
    this.accountAllowsRippling,
    this.counterpartyAllowsRippling,
    this.ledger,
    this.hash,
    this.previous});

  Trustline.fromMap(Map map) {
    account = map['account'];
    counterparty = map['counterparty'];
    currency = map['currency'];
    limit = map['limit'];
    reciprocatedLimit = map['reciprocated_limit'];
    authorizedByAccount = map['authorized_by_account'];
    authorizedByCounterparty = map['authorized_by_counterparty'];
    accountAllowsRippling = map['account_allows_rippling'];
    counterpartyAllowsRippling = map['counterparty_allows_rippling'];
    ledger = map['ledger'];
    hash = map['hash'];
    previous = map['previous'];
  }

  Map toMap() {
    final map = {};

    if (account != null) map['account'] = account;
    if (counterparty != null) map['counterparty'] = counterparty;
    if (currency != null) map['currency'] = currency;
    if (limit != null) map['limit'] = limit;
    if (reciprocatedLimit != null) map['reciprocated_limit'] = reciprocatedLimit;
    if (authorizedByAccount != null) map['authorized_by_account'] = authorizedByAccount;
    if (authorizedByCounterparty != null) map['authorized_by_counterparty'] = authorizedByCounterparty;
    if (accountAllowsRippling != null) map['account_allows_rippling'] = accountAllowsRippling;
    if (counterpartyAllowsRippling != null) map['counterparty_allows_rippling'] = counterpartyAllowsRippling;
    if (ledger != null) map['ledger'] = ledger;
    if (hash != null) map['hash'] = hash;
    if (previous != null) map['previous'] = previous;

    return map;
  }
}
