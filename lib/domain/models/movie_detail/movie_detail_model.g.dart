// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieDetailModelImpl _$$MovieDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MovieDetailModelImpl(
      adult: json['adult'] as bool? ?? false,
      backdropPath: json['backdrop_path'] as String? ?? "",
      budget: (json['budget'] as num?)?.toInt() ?? 0,
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => Genres.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      homepage: json['homepage'] as String? ?? "",
      id: (json['id'] as num?)?.toInt() ?? 0,
      imdbId: json['imdb_id'] as String? ?? "",
      originCountry: (json['origin_country'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      originalLanguage: json['original_language'] as String? ?? "",
      originalTitle: json['original_title'] as String? ?? "",
      overview: json['overview'] as String? ?? "",
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
      posterPath: json['poster_path'] as String? ?? "",
      productionCompanies: (json['production_companies'] as List<dynamic>?)
              ?.map((e) =>
                  ProductionCompanies.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      productionCountries: (json['production_countries'] as List<dynamic>?)
              ?.map((e) =>
                  ProductionCountries.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      releaseDate: json['release_date'] == null
          ? null
          : DateTime.parse(json['release_date'] as String),
      revenue: (json['revenue'] as num?)?.toInt() ?? 0,
      runtime: (json['runtime'] as num?)?.toInt() ?? 0,
      spokenLanguages: (json['spoken_languages'] as List<dynamic>?)
              ?.map((e) => SpokenLanguages.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      status: json['status'] as String? ?? "",
      tagline: json['tagline'] as String? ?? "",
      title: json['title'] as String? ?? "",
      video: json['video'] as bool? ?? false,
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: (json['vote_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$MovieDetailModelImplToJson(
        _$MovieDetailModelImpl instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'budget': instance.budget,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'id': instance.id,
      'imdb_id': instance.imdbId,
      'origin_country': instance.originCountry,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'production_companies': instance.productionCompanies,
      'production_countries': instance.productionCountries,
      'release_date': instance.releaseDate?.toIso8601String(),
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'spoken_languages': instance.spokenLanguages,
      'status': instance.status,
      'tagline': instance.tagline,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };

_$GenresImpl _$$GenresImplFromJson(Map<String, dynamic> json) => _$GenresImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$GenresImplToJson(_$GenresImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$ProductionCompaniesImpl _$$ProductionCompaniesImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductionCompaniesImpl(
      id: (json['id'] as num?)?.toInt(),
      logoPath: json['logo_path'] as String?,
      name: json['name'] as String?,
      originCountry: json['origin_country'] as String?,
    );

Map<String, dynamic> _$$ProductionCompaniesImplToJson(
        _$ProductionCompaniesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logo_path': instance.logoPath,
      'name': instance.name,
      'origin_country': instance.originCountry,
    };

_$ProductionCountriesImpl _$$ProductionCountriesImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductionCountriesImpl(
      iso31661: json['iso_3166_1'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$ProductionCountriesImplToJson(
        _$ProductionCountriesImpl instance) =>
    <String, dynamic>{
      'iso_3166_1': instance.iso31661,
      'name': instance.name,
    };

_$SpokenLanguagesImpl _$$SpokenLanguagesImplFromJson(
        Map<String, dynamic> json) =>
    _$SpokenLanguagesImpl(
      englishName: json['english_name'] as String?,
      iso6391: json['iso_639_1'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$SpokenLanguagesImplToJson(
        _$SpokenLanguagesImpl instance) =>
    <String, dynamic>{
      'english_name': instance.englishName,
      'iso_639_1': instance.iso6391,
      'name': instance.name,
    };
