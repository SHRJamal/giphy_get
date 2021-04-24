import 'package:equatable/equatable.dart';

import 'image.dart';

class GiphyImages extends Equatable {
  final GiphyStillImage fixedHeightStill;
  final GiphyStillImage originalStill;
  final GiphyFullImage fixedWidth;
  final GiphyStillImage fixedHeightSmallStill;
  final GiphyDownsampledImage fixedHeightDownsampled;
  final GiphyPreviewImage preview;
  final GiphyFullImage fixedHeightSmall;
  final GiphyStillImage downsizedStill;
  final GiphyDownsizedImage downsized;
  final GiphyDownsizedImage downsizedLarge;
  final GiphyStillImage fixedWidthSmallStill;
  final GiphyWebPImage previewWebp;
  final GiphyStillImage fixedWidthStill;
  final GiphyFullImage fixedWidthSmall;
  final GiphyPreviewImage downsizedSmall;
  final GiphyDownsampledImage fixedWidthDownsampled;
  final GiphyPreviewImage downsizedMedium;
  final GiphyOriginalImage original;
  final GiphyFullImage fixedHeight;
  final GiphyPreviewImage hd;
  final GiphyLoopingImage looping;
  final GiphyPreviewImage originalMp4;
  final GiphyDownsizedImage previewGif;
  final GiphyStillImage w480Still;

  GiphyImages({
    required this.fixedHeightStill,
    required this.originalStill,
    required this.fixedWidth,
    required this.fixedHeightSmallStill,
    required this.fixedHeightDownsampled,
    required this.preview,
    required this.fixedHeightSmall,
    required this.downsizedStill,
    required this.downsized,
    required this.downsizedLarge,
    required this.fixedWidthSmallStill,
    required this.previewWebp,
    required this.fixedWidthStill,
    required this.fixedWidthSmall,
    required this.downsizedSmall,
    required this.fixedWidthDownsampled,
    required this.downsizedMedium,
    required this.original,
    required this.fixedHeight,
    required this.hd,
    required this.looping,
    required this.originalMp4,
    required this.previewGif,
    required this.w480Still,
  });

  factory GiphyImages.fromMap(Map<String, dynamic> map) {
    return GiphyImages(
      fixedHeightStill: GiphyStillImage.fromMap(map['fixedHeightStill'] ?? {}),
      originalStill: GiphyStillImage.fromMap(map['originalStill'] ?? {}),
      fixedWidth: GiphyFullImage.fromMap(map['fixedWidth'] ?? {}),
      fixedHeightSmallStill:
          GiphyStillImage.fromMap(map['fixedHeightSmallStill'] ?? {}),
      fixedHeightDownsampled:
          GiphyDownsampledImage.fromMap(map['fixedHeightDownsampled'] ?? {}),
      preview: GiphyPreviewImage.fromMap(map['preview'] ?? {}),
      fixedHeightSmall: GiphyFullImage.fromMap(map['fixedHeightSmall'] ?? {}),
      downsizedStill: GiphyStillImage.fromMap(map['downsizedStill'] ?? {}),
      downsized: GiphyDownsizedImage.fromMap(map['downsized'] ?? {}),
      downsizedLarge: GiphyDownsizedImage.fromMap(map['downsizedLarge'] ?? {}),
      fixedWidthSmallStill:
          GiphyStillImage.fromMap(map['fixedWidthSmallStill'] ?? {}),
      previewWebp: GiphyWebPImage.fromMap(map['previewWebp'] ?? {}),
      fixedWidthStill: GiphyStillImage.fromMap(map['fixedWidthStill'] ?? {}),
      fixedWidthSmall: GiphyFullImage.fromMap(map['fixedWidthSmall'] ?? {}),
      downsizedSmall: GiphyPreviewImage.fromMap(map['downsizedSmall'] ?? {}),
      fixedWidthDownsampled:
          GiphyDownsampledImage.fromMap(map['fixedWidthDownsampled'] ?? {}),
      downsizedMedium: GiphyPreviewImage.fromMap(map['downsizedMedium'] ?? {}),
      original: GiphyOriginalImage.fromMap(map['original'] ?? {}),
      fixedHeight: GiphyFullImage.fromMap(map['fixedHeight'] ?? {}),
      hd: GiphyPreviewImage.fromMap(map['hd'] ?? {}),
      looping: GiphyLoopingImage.fromMap(map['looping'] ?? {}),
      originalMp4: GiphyPreviewImage.fromMap(map['originalMp4'] ?? {}),
      previewGif: GiphyDownsizedImage.fromMap(map['previewGif'] ?? {}),
      w480Still: GiphyStillImage.fromMap(map['w480Still'] ?? {}),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      fixedHeightStill,
      originalStill,
      fixedWidth,
      fixedHeightSmallStill,
      fixedHeightDownsampled,
      preview,
      fixedHeightSmall,
      downsizedStill,
      downsized,
      downsizedLarge,
      fixedWidthSmallStill,
      previewWebp,
      fixedWidthStill,
      fixedWidthSmall,
      downsizedSmall,
      fixedWidthDownsampled,
      downsizedMedium,
      original,
      fixedHeight,
      hd,
      looping,
      originalMp4,
      previewGif,
      w480Still,
    ];
  }
}
