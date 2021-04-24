import 'package:equatable/equatable.dart';

class GiphyFullImage extends Equatable {
  final String url;
  final double width;
  final double height;
  final double size;
  final String mp4;
  final String mp4Size;
  final String webp;
  final String webpSize;

  GiphyFullImage({
    required this.url,
    required this.width,
    required this.height,
    required this.size,
    required this.mp4,
    required this.mp4Size,
    required this.webp,
    required this.webpSize,
  });

  factory GiphyFullImage.fromMap(Map<String, dynamic> json) => GiphyFullImage(
        url: json['url'] as String? ?? '',
        width: double.parse( json['width'] as String? ?? '1'),
        height:double.parse(  json['height'] as String? ?? '1'),
        size: double.parse( json['size'] as String? ?? '1'),
        mp4: json['mp4'] as String? ?? '',
        mp4Size: json['mp4_size'] as String? ?? '',
        webp: json['webp'] as String? ?? '',
        webpSize: json['webp_size'] as String? ?? '',
      );

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      url,
      width,
      height,
      size,
      mp4,
      mp4Size,
      webp,
      webpSize,
    ];
  }
}

class GiphyOriginalImage extends Equatable {
  final String url;
  final String width;
  final String height;
  final String size;
  final String frames;
  final String mp4;
  final String mp4Size;
  final String webp;
  final String webpSize;
  final String hash;

  GiphyOriginalImage({
    required this.url,
    required this.width,
    required this.height,
    required this.size,
    required this.frames,
    required this.mp4,
    required this.mp4Size,
    required this.webp,
    required this.webpSize,
    required this.hash,
  });

  factory GiphyOriginalImage.fromMap(Map<String, dynamic> json) {
    return GiphyOriginalImage(
      url: json['url'] as String? ?? '',
      width: json['width'] as String? ?? '',
      height: json['height'] as String? ?? '',
      size: json['size'] as String? ?? '',
      frames: json['frames'] as String? ?? '',
      mp4: json['mp4'] as String? ?? '',
      mp4Size: json['mp4_size'] as String? ?? '',
      webp: json['webp'] as String? ?? '',
      webpSize: json['webp_size'] as String? ?? '',
      hash: json['hash'] as String? ?? '',
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      url,
      width,
      height,
      size,
      frames,
      mp4,
      mp4Size,
      webp,
      webpSize,
      hash,
    ];
  }
}

class GiphyStillImage extends Equatable {
  final String url;
  final String width;
  final String height;
  final String size;

  GiphyStillImage({
    required this.url,
    required this.width,
    required this.height,
    required this.size,
  });

  factory GiphyStillImage.fromMap(Map<String, dynamic> json) =>
      GiphyStillImage(
        url: json['url'] as String? ?? '',
        width: json['width'] as String? ?? '',
        height: json['height'] as String? ?? '',
        size: json['size'] as String? ?? '',
      );

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [url, width, height, size];
}

class GiphyDownsampledImage extends Equatable {
  final String url;
  final String width;
  final String height;
  final String size;
  final String webp;
  final String webpSize;

  GiphyDownsampledImage({
    required this.url,
    required this.width,
    required this.height,
    required this.size,
    required this.webp,
    required this.webpSize,
  });

  factory GiphyDownsampledImage.fromMap(Map<String, dynamic> json) {
    return GiphyDownsampledImage(
      url: json['url'] as String? ?? '',
      width: json['width'] as String? ?? '',
      height: json['height'] as String? ?? '',
      size: json['size'] as String? ?? '',
      webp: json['webp'] as String? ?? '',
      webpSize: json['webp_size'] as String? ?? '',
    );
  }

  @override
  List<Object> get props {
    return [
      url,
      width,
      height,
      size,
      webp,
      webpSize,
    ];
  }

  @override
  bool get stringify => true;
}

class GiphyLoopingImage extends Equatable {
  final String mp4;
  final String mp4Size;

  GiphyLoopingImage({
    this.mp4 = '',
    this.mp4Size = '',
  });

  factory GiphyLoopingImage.fromMap(Map<String, dynamic> json) =>
      GiphyLoopingImage(
        mp4: json['mp4'] as String? ?? '',
        mp4Size: json['mp4_size'] as String? ?? '',
      );

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [mp4, mp4Size];
}

class GiphyPreviewImage extends Equatable {
  final String width;
  final String height;
  final String mp4;
  final String mp4Size;

  GiphyPreviewImage({
    this.width = '',
    this.height = '',
    this.mp4 = '',
    this.mp4Size = '',
  });

  factory GiphyPreviewImage.fromMap(Map<String, dynamic> json) {
    return GiphyPreviewImage(
      width: json['width'] as String? ?? '',
      height: json['height'] as String? ?? '',
      mp4: json['mp4'] as String? ?? '',
      mp4Size: json['mp4_size'] as String? ?? '',
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [width, height, mp4, mp4Size];
}

class GiphyDownsizedImage extends Equatable {
  final String url;
  final String width;
  final String height;
  final String size;

  GiphyDownsizedImage({
    this.url = '',
    this.width = '',
    this.height = '',
    this.size = '',
  });

  factory GiphyDownsizedImage.fromMap(Map<String, dynamic> json) {
    return GiphyDownsizedImage(
      url: json['url'] as String? ?? '',
      width: json['width'] as String? ?? '',
      height: json['height'] as String? ?? '',
      size: json['size'] as String? ?? '',
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [url, width, height, size];
}

class GiphyWebPImage extends Equatable {
  final String url;
  final String width;
  final String height;
  final String size;

  GiphyWebPImage({
    this.url = '',
    this.width = '',
    this.height = '',
    this.size = '',
  });

  factory GiphyWebPImage.fromMap(Map<String, dynamic> json) {
    return GiphyWebPImage(
      url: json['url'] as String? ?? '',
      width: json['width'] as String? ?? '',
      height: json['height'] as String? ?? '',
      size: json['size'] as String? ?? '',
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [url, width, height, size];
}
