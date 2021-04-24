import 'package:equatable/equatable.dart';

class GiphyUser extends Equatable {
  final String avatarUrl;
  final String bannerUrl;
  final String profileUrl;
  final String username;
  final String displayName;
  final String twitter;
  final String guid;
  final String metadataDescription;
  final String attributionDisplayName;
  final String name;
  final String description;
  final String facebookUrl;
  final String twitterUrl;
  final String instagramUrl;
  final String tumblrUrl;
  final bool suppressChrome;
  final String websiteUrl;
  final String websiteDisplayUrl;

  GiphyUser({
    required this.avatarUrl,
    required this.bannerUrl,
    required this.profileUrl,
    required this.username,
    required this.displayName,
    required this.twitter,
    required this.guid,
    required this.metadataDescription,
    required this.attributionDisplayName,
    required this.name,
    required this.description,
    required this.facebookUrl,
    required this.twitterUrl,
    required this.instagramUrl,
    required this.tumblrUrl,
    required this.suppressChrome,
    required this.websiteUrl,
    required this.websiteDisplayUrl,
  });

  factory GiphyUser.fromMap(Map<String, dynamic> json) {
    return GiphyUser(
      avatarUrl: json['avatar_url'] as String? ?? '',
      bannerUrl: json['banner_url'] as String? ?? '',
      profileUrl: json['profile_url'] as String? ?? '',
      username: json['username'] as String? ?? '',
      displayName: json['display_name'] as String? ?? '',
      twitter: json['twitter'] as String? ?? '',
      guid: json['guid'] as String? ?? '',
      metadataDescription: json['metadata_description'] as String? ?? '',
      attributionDisplayName: json['attribution_display_name'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      facebookUrl: json['facebook_url'] as String? ?? '',
      twitterUrl: json['twitter_url'] as String? ?? '',
      instagramUrl: json['instagram_url'] as String? ?? '',
      tumblrUrl: json['tumblr_url'] as String? ?? '',
      suppressChrome: json['suppress_chrome'] as bool? ?? false,
      websiteUrl: json['website_url'] as String? ?? '',
      websiteDisplayUrl: json['website_display_url'] as String? ?? '',
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      avatarUrl,
      bannerUrl,
      profileUrl,
      username,
      displayName,
      twitter,
      guid,
      metadataDescription,
      attributionDisplayName,
      name,
      description,
      facebookUrl,
      twitterUrl,
      instagramUrl,
      tumblrUrl,
      suppressChrome,
      websiteUrl,
      websiteDisplayUrl,
    ];
  }
}
