// This file is generated automatically from the JSON schema, do *not* edit!

part of ripple_rest;

/**
 * An Amount on the Ripple Protocol, used also for XRP in the ripple-rest API.
 */
class Amount {
  /** The quantity of the currency, denoted as a string to retain floating point precision. */
  String /*FloatString*/ value;

  /** The currency expressed as a three-character code. */
  String /*Currency*/ currency;

  /** The Ripple account address of the currency's issuer or gateway, or an empty string if the currency is XRP. */
  String issuer;

  /** The Ripple account address of the currency's issuer or gateway, or an empty string if the currency is XRP. */
  String counterparty;

  Amount({
    this.value,
    this.currency,
    this.issuer,
    this.counterparty});

  Amount.fromMap(Map map) {
    value = map['value'];
    currency = map['currency'];
    issuer = map['issuer'];
    counterparty = map['counterparty'];
  }

  Map toMap() {
    final map = {};

    if (value != null) map['value'] = value;
    if (currency != null) map['currency'] = currency;
    if (issuer != null) map['issuer'] = issuer;
    if (counterparty != null) map['counterparty'] = counterparty;

    return map;
  }
}
