part of ripple_rest;

/**
 * [Schema](https://github.com/ripple/ripple-rest/blob/develop/schemas/Trustline.json)
 */
class Trustline {
  Map _data = {};

  Trustline.fromData(this._data);

  bool get isAuthorizedByAccount => _data['authorized_by_account'];

  bool get isAuthorizedByCounterparty => _data['authorized_by_counterparty'];
}