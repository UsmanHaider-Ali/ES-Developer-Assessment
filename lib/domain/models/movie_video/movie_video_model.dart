import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_video_model.freezed.dart';
part 'movie_video_model.g.dart';

@freezed
class MovieVideoModel with _$MovieVideoModel {
  const factory MovieVideoModel({
    @JsonKey(name: "iso_639_1") String? iso639_1,
    @JsonKey(name: "iso_3166_1") String? iso3166_1,
    String? name,
    String? key,
    String? site,
    int? size,
    String? type,
    bool? official,
    @JsonKey(name: "published_at") DateTime? publishedAt,
    String? id,
  }) = _MovieVideoModel;

  factory MovieVideoModel.fromJson(Map<String, dynamic> json) => _$MovieVideoModelFromJson(json);
}
