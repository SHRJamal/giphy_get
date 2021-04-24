import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../client/client.dart';
import '../../client/models/collection.dart';
import '../../client/models/gif.dart';
import '../../client/models/type.dart';
import '../../providers/app_bar_provider.dart';
import '../../providers/tab_provider.dart';

class GiphyTabDetail extends StatefulWidget {
  final String type;
  final ScrollController? scrollController;
  const GiphyTabDetail({
    Key? key,
    required this.type,
    this.scrollController,
  }) : super(key: key);

  @override
  _GiphyTabDetailState createState() => _GiphyTabDetailState();
}

class _GiphyTabDetailState extends State<GiphyTabDetail> {
  // Tab Provider
  late TabProvider _tabProvider;

  // AppBar Provider
  late AppBarProvider _appBarProvider;

  // Collection
  GiphyCollection? _collection;

  // List of gifs
  List<GiphyGif> _list = [];

  // Direction
  late Axis _scrollDirection;

  // Axis count
  late int _crossAxisCount;

  // Spacing between gifs in grid
  final _spacing = 8.0;

  // Default gif with
  late double _gifWidth;

  // Limit of query
  int? _limit;

  // is Loading gifs
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    // Tab Provider
    _tabProvider = Provider.of<TabProvider>(context, listen: false);

    // AppBar Provider
    _appBarProvider = Provider.of<AppBarProvider>(context, listen: false);

    // GridOptions
    _scrollDirection = Axis.vertical;

    // Gif WIDTH
    switch (widget.type) {
      case GiphyType.gifs:
        _gifWidth = 200.0;
        break;
      case GiphyType.stickers:
        _gifWidth = 150.0;
        break;
      case GiphyType.emoji:
        _gifWidth = 80.0;
        break;
      default:
        break;
    }

    // ScrollController
    widget.scrollController!.addListener(_scrollListener);

    // Listen query
    _appBarProvider.addListener(_listenerQuery);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Set items count responsive
    _crossAxisCount = (MediaQuery.of(context).size.width / _gifWidth).round();

    // Set vertical max items count
    final _mainAxisCount =
        ((MediaQuery.of(context).size.height - 30) / _gifWidth).round();

    _limit = _crossAxisCount * _mainAxisCount;

    // Load Initial Data
    _loadMore();
  }

  @override
  void dispose() {
    // dispose listener
    // Important
    widget.scrollController!.removeListener(_scrollListener);
    _appBarProvider.removeListener(_listenerQuery);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_list.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: StaggeredGridView.countBuilder(
        scrollDirection: _scrollDirection,
        controller: widget.scrollController,
        itemCount: _list.length,
        crossAxisCount: _crossAxisCount,
        mainAxisSpacing: _spacing,
        crossAxisSpacing: _spacing,
        itemBuilder: (_, i) {
          final gif = _list[i];
          return ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: InkWell(
              onTap: () => _selectedGif(gif),
              child: CachedNetworkImage(
                imageUrl: gif.images!.original.webp,
                fit: BoxFit.fill,
              ),
            ),
          );
        },
        staggeredTileBuilder: (idx) => StaggeredTile.fit(1),
      ),
    );
  }

  Future<void> _loadMore() async {
    //Return if is loading or no more gifs
    if (_isLoading || _collection?.pagination?.totalCount == _list.length) {
      return;
    }

    _isLoading = true;

    // Giphy Client from library
    final client = GiphyClient(
      apiKey: _tabProvider.apiKey,
      randomId: _tabProvider.randomID,
    );

    // Offset pagination for query
    final offset = _collection == null
        ? 0
        : _collection!.pagination!.offset + _collection!.pagination!.count;

    // Get Gif or Emoji
    if (widget.type == GiphyType.emoji) {
      _collection = await client.emojis(offset: offset, limit: _limit);
    } else {
      // If query text is not null search gif else trendings
      if (_appBarProvider.queryText.isNotEmpty &&
          widget.type != GiphyType.emoji) {
        _collection = await client.search(
          _appBarProvider.queryText,
          lang: _tabProvider.lang,
          offset: offset,
          rating: _tabProvider.rating,
          type: widget.type,
          limit: _limit,
        );
      } else {
        _collection = await client.trending(
          lang: _tabProvider.lang,
          offset: offset,
          rating: _tabProvider.rating,
          type: widget.type,
          limit: _limit,
        );
      }
    }

    // Set result to list
    if (_collection!.data.isNotEmpty && mounted) {
      setState(() {
        _list.addAll(_collection!.data);
      });
    }

    _isLoading = false;
  }

  // Scroll listener. if scroll end load more gifs
  void _scrollListener() {
    if ((widget.scrollController!.position.extentAfter < 500) && !_isLoading) {
      _loadMore();
    }
  }

  // Return selected gif
  void _selectedGif(GiphyGif gif) {
    Navigator.pop(context, gif);
  }

  // listener query
  void _listenerQuery() {
    // Reset pagination
    _collection = null;

    // Reset list
    _list = [];

    // Load data
    _loadMore();
  }

  TValue? case2<TOptionType, TValue>(
    TOptionType selectedOption,
    Map<TOptionType, TValue> branches, [
    TValue? defaultValue,
  ]) {
    if (!branches.containsKey(selectedOption)) {
      return defaultValue;
    }

    return branches[selectedOption];
  }
}
