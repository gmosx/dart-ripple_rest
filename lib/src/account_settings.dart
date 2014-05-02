part of ripple_rest;

/**
 * The settings of an [Account].
 */
class AccountSettings {
  Map _data;

  AccountSettings.fromData(this._data);

  String get account => _data['account'];

  String get ledger => _data['ledger'];
}