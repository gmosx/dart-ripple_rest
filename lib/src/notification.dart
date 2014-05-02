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

	Notification.fromMap(Map map) {
		account = map['account'];
		type = map['type'];
		direction = map['direction'];
		state = map['state'];
		result = map['result'];
		ledger = map['ledger'];
		hash = map['hash'];
		timestamp = map['timestamp'];
		transactionUrl = map['transaction_url'];
		previousNotificationUrl = map['previous_notification_url'];
		nextNotificationUrl = map['next_notification_url'];
	}

	Map toMap() => {
		'account': account,
		'type': type,
		'direction': direction,
		'state': state,
		'result': result,
		'ledger': ledger,
		'hash': hash,
		'timestamp': timestamp,
		'transaction_url': transactionUrl,
		'previous_notification_url': previousNotificationUrl,
		'next_notification_url': nextNotificationUrl
	};
}
