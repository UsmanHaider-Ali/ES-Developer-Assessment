import 'package:equatable/equatable.dart';
import 'package:es_developer_assessment/domain/models/movie/movie_model.dart';
import 'package:es_developer_assessment/domain/models/movie_detail/movie_detail_model.dart';
import 'package:es_developer_assessment/domain/models/movie_video/movie_video_model.dart';
import 'package:es_developer_assessment/utils/enums.dart';

class MoviesStates extends Equatable {
  final ApiStatus apiStatus;

  final List<MovieModel>? upcomingMovies;
  final List<MovieModel>? popularMovies;
  final MovieDetailModel? movieDetailModel;
  final MovieVideoModel? movieVideoModel;

  final String? errorMessage;
  final int currentPageForUpcomingMovies;
  final int currentPageForPopularMovies;
  final bool isLoadingMoreUpcomingMovies;
  final bool isLoadingMorePopularMovies;

  const MoviesStates({
    this.apiStatus = ApiStatus.initial,
    this.upcomingMovies,
    this.popularMovies,
    this.movieDetailModel,
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
    MovieDetailModel? movieDetailModel,
    MovieVideoModel? movieVideoModel,
    String? errorMessage,
    int? currentPageForUpcomingMovies,
    int? currentPageForPopularMovies,
    bool isLoadingMoreUpcomingMovies=false,
    bool isLoadingMorePopularMovies = false,
  }) =>
      MoviesStates(
        apiStatus: apiStatus ?? this.apiStatus,
        upcomingMovies: upcomingMovies ?? this.upcomingMovies,
        popularMovies: popularMovies ?? this.popularMovies,
        movieDetailModel: movieDetailModel ?? this.movieDetailModel,
        movieVideoModel: movieVideoModel ?? this.movieVideoModel,
        errorMessage: errorMessage ?? this.errorMessage,
        currentPageForUpcomingMovies: currentPageForUpcomingMovies ?? this.currentPageForUpcomingMovies,
        currentPageForPopularMovies: currentPageForPopularMovies ?? this.currentPageForPopularMovies,
        isLoadingMoreUpcomingMovies: isLoadingMoreUpcomingMovies,
        isLoadingMorePopularMovies: isLoadingMorePopularMovies,
      );

  @override
  List<Object?> get props => [
        apiStatus,
        upcomingMovies,
        popularMovies,
        movieDetailModel,
        movieVideoModel,
        errorMessage,
        currentPageForUpcomingMovies,
        currentPageForPopularMovies,
        isLoadingMoreUpcomingMovies,
        isLoadingMorePopularMovies,
      ];
}
