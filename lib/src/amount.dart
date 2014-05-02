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

	Amount.fromMap(Map map) {
		value = map['value'];
		currency = map['currency'];
		issuer = map['issuer'];
		counterparty = map['counterparty'];
	}

	Map toMap() => {
		'value': value,
		'currency': currency,
		'issuer': issuer,
		'counterparty': counterparty
	};
}
