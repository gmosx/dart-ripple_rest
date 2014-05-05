Ripple REST API client
======================

A wrapper around the [Ripple REST API](https://dev.ripple.com).


Features
--------

* Future based API.
* PODO (Plain Old Dart Objects) automatically generated from the JSON schema.
* Works on the browser and the command line.


Example usage
-------------

```dart
  // import for web (browser) applications.
  import 'package:ripple_rest/ripple_rest_html';
  // or, import for console applications.
  import 'package:ripple_rest/ripple_rest_io'; 

  final client = new RippleRestClient('http://localhost:5990');
  
  // Get the balances of an account.

  client.getBalances('rHb9CJAWyB4rj91VRWn96DkukG4bwdtyTh').then((balances) {
    balances.forEach((b) {
      print("${b.currency}/${b.counterparty}: ${b.value}");
    });
  });

  // Update an account trustline.
  
  var trustline = new Trustline(
    limit: '110',
    currency: 'XRP',
    counterparty: 'rPs7nVbSops6xm4v77wpoPFf549cqjzUy9',
    accountAllowsRippling: true
  );
  client.setTrustline('rHb9CJAWyB4rj91VRWn96DkukG4bwdtyTh', "secret", trustline).catchError(print);
```  


Links
-----

* [Ripple-REST API reference](https://dev.ripple.com/#ripple-rest-api)
* [Ripple-REST API repository](https://github.com/ripple/ripple-rest)


Note to contributors
--------------------

If you'd like to contribute back to the core, you can 
[fork this repository](https://help.github.com/articles/fork-a-repo) and send us 
a pull request, when it is ready.

Please be aware that one of this project's design goals is to keep the API 
as clean, consistent and Dartish as possible.

If you are new to Git or GitHub, please read [this guide](https://help.github.com/) 
first.


Credits
-------

Copyright (c) 2014 George Moschovitis <george.moschovitis@gmail.com>.
