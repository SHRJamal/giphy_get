import 'package:flutter/widgets.dart';

import '../client/models/languages.dart';
import '../client/models/rating.dart';

class TabProvider with ChangeNotifier {
  String? apiKey;
  Color? tabColor;
  String? searchText;
  String? rating = GiphyRating.g;
  String? lang = GiphyLanguage.english;
  String? randomID = "";

  // TabType
  String? _tabType;
  String? get tabType => _tabType;
  set tabType(String? tabType) {
    _tabType = tabType;
    notifyListeners();
  }

  // Constructor
  TabProvider({
    this.apiKey,
    this.tabColor,
    this.searchText,
    this.rating,
    this.randomID,
    this.lang,
  });
  void setTabColor(Color tabColor) {
    this.tabColor = tabColor;
    notifyListeners();
  }
}
