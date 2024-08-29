import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_detail_model.freezed.dart';
part 'movie_detail_model.g.dart';

@freezed
class MovieDetailModel with _$MovieDetailModel {
  const factory MovieDetailModel({
    @Default(false) bool? adult,
    @Default("") @JsonKey(name: "backdrop_path") String? backdropPath,
    @Default(0) int? budget,
    @Default([]) List<Genres>? genres,
    @Default("") String? homepage,
    @Default(0) int? id,
    @Default("") @JsonKey(name: "imdb_id") String? imdbId,
    @Default([]) @JsonKey(name: "origin_country") List<String>? originCountry,
    @Default("") @JsonKey(name: "original_language") String? originalLanguage,
    @Default("") @JsonKey(name: "original_title") String? originalTitle,
    @Default("") String? overview,
    @Default(0.0) double? popularity,
    @Default("") @JsonKey(name: "poster_path") String? posterPath,
    @Default([]) @JsonKey(name: "production_companies") List<ProductionCompanies>? productionCompanies,
    @Default([]) @JsonKey(name: "production_countries") List<ProductionCountries>? productionCountries,
    @JsonKey(name: "release_date") DateTime? releaseDate,
    @Default(0) int? revenue,
    @Default(0) int? runtime,
    @Default([]) @JsonKey(name: "spoken_languages") List<SpokenLanguages>? spokenLanguages,
    @Default("") String? status,
    @Default("") String? tagline,
    @Default("") String? title,
    @Default(false) bool? video,
    @Default(0.0) @JsonKey(name: "vote_average") double? voteAverage,
    @Default(0) @JsonKey(name: "vote_count") int? voteCount,
  }) = _MovieDetailModel;

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) => _$MovieDetailModelFromJson(json);
}

@freezed
class Genres with _$Genres {
  const factory Genres({
    int? id,
    String? name,
  }) = _Genres;

  factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);
}

@freezed
class ProductionCompanies with _$ProductionCompanies {
  const factory ProductionCompanies({
    int? id,
    @JsonKey(name: "logo_path") String? logoPath,
    String? name,
    @JsonKey(name: "origin_country") String? originCountry,
  }) = _ProductionCompanies;

  factory ProductionCompanies.fromJson(Map<String, dynamic> json) => _$ProductionCompaniesFromJson(json);
}

@freezed
class ProductionCountries with _$ProductionCountries {
  const factory ProductionCountries({
    @JsonKey(name: "iso_3166_1") String? iso31661,
    String? name,
  }) = _ProductionCountries;

  factory ProductionCountries.fromJson(Map<String, dynamic> json) => _$ProductionCountriesFromJson(json);
}

@freezed
class SpokenLanguages with _$SpokenLanguages {
  const factory SpokenLanguages({
    @JsonKey(name: "english_name") String? englishName,
    @JsonKey(name: "iso_639_1") String? iso6391,
    String? name,
  }) = _SpokenLanguages;

  factory SpokenLanguages.fromJson(Map<String, dynamic> json) => _$SpokenLanguagesFromJson(json);
}
