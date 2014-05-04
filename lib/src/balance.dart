part of ripple_rest;

// This file is generated automatically from the JSON schema, do *not* edit!

/**
 * A simplified representation of an account Balance.
 */
class Balance {
	/** The quantity of the currency, denoted as a string to retain floating point precision. */
	String /*FloatString*/ value;

	/** The currency expressed as a three-character code. */
	String /*Currency*/ currency;

	/** The Ripple account address of the currency's issuer or gateway, or an empty string if the currency is XRP. */
	String counterparty;

	Balance.fromMap(Map map) {
		value = map['value'];
		currency = map['currency'];
		counterparty = map['counterparty'];
	}

	Map toMap() => {
		'value': value,
		'currency': currency,
		'counterparty': counterparty
	};
}
