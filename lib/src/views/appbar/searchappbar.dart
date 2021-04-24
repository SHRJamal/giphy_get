import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../client/models/type.dart';
import '../../providers/app_bar_provider.dart';
import '../../providers/sheet_provider.dart';
import '../../providers/tab_provider.dart';
import 'logo.dart';

class SearchAppBar extends StatefulWidget {
  // Scroll Controller
  final ScrollController? scrollController;

  const SearchAppBar({
    Key? key,
    this.scrollController,
  }) : super(key: key);

  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  // Tab Provider
  late TabProvider _tabProvider;

  // AppBar Provider
  late AppBarProvider _appBarProvider;

  // Sheet Provider
  late SheetProvider _sheetProvider;

  // Input controller
  final _textEditingController = TextEditingController();
  // Input Focus
  final _focus = FocusNode();

  //Colors
  Color? _canvasColor;
  Color? _searchBackgroundColor;

  //Is DarkMode
  late bool _isDarkMode;

  @override
  void initState() {
    // Focus
    _focus.addListener(_focusListener);

    // Listener TextField
    _textEditingController.addListener(() {
      if (_textEditingController.text.isNotEmpty) {
        _appBarProvider.queryText = _textEditingController.text;
      }
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    //Colors
    _canvasColor = Theme.of(context).canvasColor;
    _searchBackgroundColor = Theme.of(context).textTheme.bodyText1!.color;

    //Is DarkMode
    _isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Providers
    _tabProvider = Provider.of<TabProvider>(context);

    _sheetProvider = Provider.of<SheetProvider>(context);

    // AppBar Provider
    _appBarProvider = Provider.of<AppBarProvider>(context);

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: _canvasColor,
      elevation: 0.0,
      titleSpacing: 10.0,
      automaticallyImplyLeading: false,
      actions: const [],
      title: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            width: 50,
            height: 2,
            color: _searchBackgroundColor,
          ),
          if (_tabProvider.tabType == GiphyType.emoji)
            SizedBox(
              height: 40.0,
              child: GiphyLogo(),
            )
          else
            Container(
              decoration: BoxDecoration(
                  color: _isDarkMode ? Colors.white : Colors.grey[300],
                  borderRadius: BorderRadius.circular(8.0)),
              height: 40.0,
              child: Center(
                child: TextField(
                  autofocus:
                      _sheetProvider.initialExtent == SheetProvider.maxExtent,
                  focusNode: _focus,
                  controller: _textEditingController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      prefixIcon: _searchIcon(),
                      hintStyle: TextStyle(color: Colors.black45),
                      hintText: _tabProvider.searchText,
                      border: InputBorder.none),
                  autocorrect: false,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _searchIcon() {
    if (kIsWeb) {
      return Icon(Icons.search);
    } else {
      return ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.pinkAccent,
            Colors.purple[700]!,
          ],
        ).createShader(bounds),
        child: Icon(Icons.search),
      );
    }
  }

  void _focusListener() {
    // Set to max extent height if Textfield has focus
    if (_focus.hasFocus &&
        _sheetProvider.initialExtent == SheetProvider.minExtent) {
      _sheetProvider.initialExtent = SheetProvider.maxExtent;
    }
  }
}
