import 'package:equatable/equatable.dart';
import 'package:es_developer_assessment/domain/models/movie/movie_model.dart';
import 'package:es_developer_assessment/domain/models/movie_detail/movie_detail_model.dart';
import 'package:es_developer_assessment/domain/models/movie_video/movie_video_model.dart';
import 'package:es_developer_assessment/utils/enums.dart';

class MoviesStates extends Equatable {
  final ApiStatus apiStatus;
  final List<MovieModel>? upcomingMovies;
  final List<MovieModel>? popularMovies;
  final Map<int, MovieDetailModel> movieDetailsCache;
  final MovieVideoModel? movieVideoModel;
  final String? errorMessage;
  final int currentPageForUpcomingMovies;
  final int currentPageForPopularMovies;
  final bool isLoadingMoreUpcomingMovies;
  final bool isLoadingMorePopularMovies;

  const MoviesStates({
    this.apiStatus = ApiStatus.loading,
    this.upcomingMovies,
    this.popularMovies,
    this.movieDetailsCache = const {},
    this.movieVideoModel,
    this.errorMessage,
    this.currentPageForUpcomingMovies = 1,
    this.currentPageForPopularMovies = 1,
    this.isLoadingMoreUpcomingMovies = false,
    this.isLoadingMorePopularMovies = false,
  });

  MoviesStates copyWith({
    ApiStatus? apiStatus,
    List<MovieModel>? upcomingMovies,
    List<MovieModel>? popularMovies,
    Map<int, MovieDetailModel>? movieDetailsCache,
    MovieVideoModel? movieVideoModel,
    String? errorMessage,
    int? currentPageForUpcomingMovies,
    int? currentPageForPopularMovies,
    bool? isLoadingMoreUpcomingMovies,
    bool? isLoadingMorePopularMovies,
  }) =>
      MoviesStates(
        apiStatus: apiStatus ?? this.apiStatus,
        upcomingMovies: upcomingMovies ?? this.upcomingMovies,
        popularMovies: popularMovies ?? this.popularMovies,
        movieDetailsCache: movieDetailsCache ?? this.movieDetailsCache,
        movieVideoModel: movieVideoModel ?? this.movieVideoModel,
        errorMessage: errorMessage ?? this.errorMessage,
        currentPageForUpcomingMovies: currentPageForUpcomingMovies ?? this.currentPageForUpcomingMovies,
        currentPageForPopularMovies: currentPageForPopularMovies ?? this.currentPageForPopularMovies,
        isLoadingMoreUpcomingMovies: isLoadingMoreUpcomingMovies ?? this.isLoadingMoreUpcomingMovies,
        isLoadingMorePopularMovies: isLoadingMorePopularMovies ?? this.isLoadingMorePopularMovies,
      );

  @override
  List<Object?> get props => [
        apiStatus,
        upcomingMovies,
        popularMovies,
        movieDetailsCache,
        movieVideoModel,
        errorMessage,
        currentPageForUpcomingMovies,
        currentPageForPopularMovies,
        isLoadingMoreUpcomingMovies,
        isLoadingMorePopularMovies,
      ];

  factory MoviesStates.fromJson(Map<String, dynamic> json) {
    final movieDetailsCacheJson = json['movieDetailsCache'] as Map<String, dynamic>?;

    final movieDetailsCache = movieDetailsCacheJson?.map<int, MovieDetailModel>((key, value) {
          return MapEntry(int.parse(key), MovieDetailModel.fromJson(value as Map<String, dynamic>));
        }) ??
        {};

    return MoviesStates(
      apiStatus: ApiStatus.values[json['apiStatus'] ?? 0],
      upcomingMovies: (json['upcomingMovies'] as List<dynamic>?)?.map((movie) => MovieModel.fromJson(movie as Map<String, dynamic>)).toList(),
      popularMovies: (json['popularMovies'] as List<dynamic>?)?.map((movie) => MovieModel.fromJson(movie as Map<String, dynamic>)).toList(),
      movieDetailsCache: movieDetailsCache,
      movieVideoModel: json['movieVideoModel'] != null ? MovieVideoModel.fromJson(json['movieVideoModel'] as Map<String, dynamic>) : null,
      errorMessage: json['errorMessage'] as String?,
      currentPageForUpcomingMovies: json['currentPageForUpcomingMovies'] ?? 1,
      currentPageForPopularMovies: json['currentPageForPopularMovies'] ?? 1,
      isLoadingMoreUpcomingMovies: json['isLoadingMoreUpcomingMovies'] ?? false,
      isLoadingMorePopularMovies: json['isLoadingMorePopularMovies'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'apiStatus': apiStatus.index,
      'upcomingMovies': upcomingMovies?.map((movie) => movie.toJson()).toList(),
      'popularMovies': popularMovies?.map((movie) => movie.toJson()).toList(),
      'movieDetailsCache': movieDetailsCache.map((key, value) => MapEntry(key.toString(), value.toJson())),
      'movieVideoModel': movieVideoModel?.toJson(),
      'errorMessage': errorMessage,
      'currentPageForUpcomingMovies': currentPageForUpcomingMovies,
      'currentPageForPopularMovies': currentPageForPopularMovies,
      'isLoadingMoreUpcomingMovies': isLoadingMoreUpcomingMovies,
      'isLoadingMorePopularMovies': isLoadingMorePopularMovies,
    };
  }
}
