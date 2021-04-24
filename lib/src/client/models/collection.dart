import 'package:equatable/equatable.dart';

import 'gif.dart';

class GiphyCollection extends Equatable {
  final List<GiphyGif> data;
  final GiphyPagination? pagination;
  final GiphyMeta? meta;

  GiphyCollection({
    required this.data,
    this.pagination,
    this.meta,
  });

  factory GiphyCollection.fromMap(Map<String, dynamic> json) =>
      GiphyCollection(
        data: [
          for (final e in json['data'] as List? ?? [])
            if (e != null) GiphyGif.fromMap(Map<String, dynamic>.from(e))
        ],
        pagination: json['pagination'] == null
            ? null
            : GiphyPagination.fromMap(
                json['pagination'] as Map<String, dynamic>),
        meta: json['meta'] == null
            ? null
            : GiphyMeta.fromMap(json['meta'] as Map<String, dynamic>),
      );

  @override
  List<Object?> get props => [data, pagination, meta];

  @override
  bool get stringify => true;
}

class GiphyPagination extends Equatable {
  final int totalCount;
  final int count;
  final int offset;

  GiphyPagination({
    required this.totalCount,
    required this.count,
    required this.offset,
  });

  factory GiphyPagination.fromMap(Map<String, dynamic> json) =>
      GiphyPagination(
        totalCount: json['total_count'] as int? ?? 0,
        count: json['count'] as int? ?? 0,
        offset: json['offset'] as int? ?? 0,
      );

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [totalCount, count, offset];
}

class GiphyMeta extends Equatable {
  final int status;
  final String msg;
  final String responseId;

  GiphyMeta({
    required this.status,
    required this.msg,
    required this.responseId,
  });

  factory GiphyMeta.fromMap(Map<String, dynamic> json) => GiphyMeta(
        status: json['status'] as int? ?? 0,
        msg: json['msg'] as String? ?? '',
        responseId: json['response_id'] as String? ?? '',
      );

  @override
  List<Object?> get props => [status, msg, responseId];

  @override
  bool get stringify => true;
}
