import 'package:flutter/widgets.dart';

class AppBarProvider with ChangeNotifier {
  String _queryText = "";
  String get queryText => _queryText;
  set queryText(String queryText) {
    _queryText = queryText;
    notifyListeners();
  }
}
