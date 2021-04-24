import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/sheet_provider.dart';
import 'appbar/searchappbar.dart';
import 'tab/tab_bar.dart';
import 'tab/tab_view.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {
  // Scroll Controller
  ScrollController? _scrollController;

  // Sheet Provider
  late SheetProvider _sheetProvider;

  // Tab Controller
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void didChangeDependencies() {
    _sheetProvider = Provider.of<SheetProvider>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: _sheetProvider.isExpanded,
      minChildSize: SheetProvider.minExtent,
      maxChildSize: SheetProvider.maxExtent,
      initialChildSize: _sheetProvider.initialExtent,
      builder: (ctx, scrollController) {
        // Set ScrollController
        _scrollController = scrollController;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SearchAppBar(scrollController: _scrollController),
            GiphyTabBar(tabController: _tabController),
            Expanded(
              child: GiphyTabView(
                tabController: _tabController,
                scrollController: _scrollController,
              ),
            ),
          ],
        );
      },
    );
  }
}
