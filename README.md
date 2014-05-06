Ripple REST API client
======================


A wrapper around the [Ripple REST API](https://dev.ripple.com).


Features
--------

* Future-based API.
* Typed PODO (Plain Old Dart Objects) automatically generated from the JSON schema.
* Works on the browser and the command line.


Example usage
-------------

```dart
  // import for web (browser) applications (dart:html).
  import 'package:ripple_rest/ripple_rest_html';
  // or, import for console applications (dart:io).
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

For more examples check out the following files:

* [example/example.dart](https://github.com/gmosx/dart-ripple_rest/blob/master/example/example.dart)
* [test/ripple_rest_io_test.dart](https://github.com/gmosx/dart-ripple_rest/blob/master/test/ripple_rest_io_test.dart)


Documentation
-------------

To generate the documentation for this library, run the following command from
within it's directory:

```
$ docsgen --serve .
```

then browse [](http://localhost:8080)


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
