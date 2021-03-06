import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import 'models/collection.dart';
import 'models/gif.dart';
import 'models/languages.dart';
import 'models/rating.dart';
import 'models/type.dart';

class GiphyClient {
  static final baseUri = Uri(scheme: 'https', host: 'api.giphy.com');

  final String? _apiKey;
  final Client _client;
  final String _randomId;
  final String _apiVersion = 'v1';

  GiphyClient({required String? apiKey, Client? client, String? randomId})
      : _apiKey = apiKey,
        _randomId = randomId ?? '',
        _client = client ?? Client();

  Future<GiphyCollection> trending({
    int offset = 0,
    int? limit = 30,
    String? rating = GiphyRating.g,
    String? lang = GiphyLanguage.english,
    String type = GiphyType.gifs,
  }) async {
    return _fetchCollection(
      baseUri.replace(
        path: '$_apiVersion/$type/trending',
        queryParameters: <String, String?>{
          'offset': '$offset',
          'limit': '$limit',
          'rating': rating,
          'lang': lang
        },
      ),
    );
  }

  Future<GiphyCollection> search(
    String query, {
    int offset = 0,
    int? limit = 30,
    String? rating = GiphyRating.g,
    String? lang = GiphyLanguage.english,
    String type = GiphyType.gifs,
  }) async {
    return _fetchCollection(
      baseUri.replace(
        path: '$_apiVersion/$type/search',
        queryParameters: <String, String?>{
          'q': query,
          'offset': '$offset',
          'limit': '$limit',
          'rating': rating,
          'lang': lang,
        },
      ),
    );
  }

  Future<GiphyCollection> emojis({
    int offset = 0,
    int? limit = 30,
    String rating = GiphyRating.g,
    String lang = GiphyLanguage.english,
  }) async {
    return _fetchCollection(
      baseUri.replace(
        path: '$_apiVersion/${GiphyType.emoji}',
        queryParameters: <String, String>{
          'offset': '$offset',
          'limit': '$limit',
          'rating': rating,
          'lang': lang,
        },
      ),
    );
  }

  Future<GiphyGif> random({
    String? tag,
    String rating = GiphyRating.g,
    String type = GiphyType.gifs,
  }) async {
    return _fetchGif(
      baseUri.replace(
        path: '$_apiVersion/$type/random',
        queryParameters: <String, String?>{
          'tag': tag,
          'rating': rating,
        },
      ),
    );
  }

  Future<GiphyGif> byId(String id) async =>
      _fetchGif(baseUri.replace(path: 'v1/gifs/$id'));

  Future<String?> getRandomId() async =>
      _getRandomId(baseUri.replace(path: 'v1/randomid'));

  Future<GiphyGif> _fetchGif(Uri uri) async {
    final response = await _getWithAuthorization(uri);

    return GiphyGif.fromMap((json.decode(response.body)
        as Map<String, dynamic>)['data'] as Map<String, dynamic>);
  }

  Future<GiphyCollection> _fetchCollection(Uri uri) async {
    final response = await _getWithAuthorization(uri);

    return GiphyCollection.fromMap(
        json.decode(response.body) as Map<String, dynamic>);
  }

  Future<String?> _getRandomId(Uri uri) async {
    final response = await _getWithAuthorization(uri);
    final decoded = json.decode(response.body);
    return decoded["data"]["random_id"] as String?;
  }

  Future<Response> _getWithAuthorization(Uri uri) async {
    final response = await _client.get(
      uri
          .replace(
            queryParameters: Map<String, String?>.from(uri.queryParameters)
              ..putIfAbsent('api_key', () => _apiKey)
              ..putIfAbsent('random_id', () => _randomId),
          )
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw GiphyClientError(response.statusCode, response.body);
    }
  }
}

class GiphyClientError {
  final int statusCode;
  final String exception;

  GiphyClientError(this.statusCode, this.exception);

  @override
  String toString() {
    return 'GiphyClientError{statusCode: $statusCode, exception: $exception}';
  }
}
