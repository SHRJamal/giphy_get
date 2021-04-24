import 'package:equatable/equatable.dart';

import 'images.dart';
import 'user.dart';

class GiphyGif extends Equatable {
  final String title;
  final String type;
  final String id;
  final String slug;
  final String url;
  final String bitlyGifUrl;
  final String bitlyUrl;
  final String embedUrl;
  final String username;
  final String source;
  final String rating;
  final String contentUrl;
  final String sourceTld;
  final String sourcePostUrl;
  final int isSticker;
  final DateTime importDatetime;
  final DateTime trendingDatetime;
  final GiphyUser? user;
  final GiphyImages? images;

  GiphyGif({
    required this.title,
    required this.type,
    required this.id,
    required this.slug,
    required this.url,
    required this.bitlyGifUrl,
    required this.bitlyUrl,
    required this.embedUrl,
    required this.username,
    required this.source,
    required this.rating,
    required this.contentUrl,
    required this.sourceTld,
    required this.sourcePostUrl,
    required this.isSticker,
    required this.importDatetime,
    required this.trendingDatetime,
    this.user,
    this.images,
  });

  factory GiphyGif.fromMap(Map<String, dynamic> json) => GiphyGif(
        title: json['title'] as String? ?? '',
        type: json['type'] as String? ?? '',
        id: json['id'] as String? ?? '',
        slug: json['slug'] as String? ?? '',
        url: json['url'] as String? ?? '',
        bitlyGifUrl: json['bitly_gif_url'] as String? ?? '',
        bitlyUrl: json['bitly_url'] as String? ?? '',
        embedUrl: json['embed_url'] as String? ?? '',
        username: json['username'] as String? ?? '',
        source: json['source'] as String? ?? '',
        rating: json['rating'] as String? ?? '',
        contentUrl: json['content_url'] as String? ?? '',
        sourceTld: json['source_tld'] as String? ?? '',
        sourcePostUrl: json['source_post_url'] as String? ?? '',
        isSticker: json['is_sticker'] as int? ?? 0,
        importDatetime: json['import_datetime'] == null
            ? DateTime.now()
            : DateTime.parse(json['import_datetime'] as String),
        trendingDatetime: json['trending_datetime'] == null
            ? DateTime.now()
            : DateTime.parse(json['trending_datetime'] as String),
        user: json['user'] == null
            ? null
            : GiphyUser.fromMap(json['user'] as Map<String, dynamic>),
        images: json['images'] == null
            ? null
            : GiphyImages.fromMap(json['images'] as Map<String, dynamic>),
      );

  @override
  List<Object?> get props {
    return [
      title,
      type,
      id,
      slug,
      url,
      bitlyGifUrl,
      bitlyUrl,
      embedUrl,
      username,
      source,
      rating,
      contentUrl,
      sourceTld,
      sourcePostUrl,
      isSticker,
      importDatetime,
      trendingDatetime,
      user,
      images,
    ];
  }

  @override
  bool get stringify => true;
}
