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
	String transferRate;

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
		transactionSequence = map['transaction_sequence'];
		trustlineCount = map['trustline_count'];
		ledger = map['ledger'];
		hash = map['hash'];
	}

	Map toMap() => {
		'account': account,
		'regular_key': regularKey,
		'domain': domain,
		'email_hash': emailHash,
		'message_key': messageKey,
		'transfer_rate': transferRate,
		'require_destination_tag': requireDestinationTag,
		'require_authorization': requireAuthorization,
		'disallow_xrp': disallowXrp,
		'transaction_sequence': transactionSequence,
		'trustline_count': trustlineCount,
		'ledger': ledger,
		'hash': hash
	};
}
