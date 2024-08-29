import 'package:es_developer_assessment/data/repositories/movies/movies_repository.dart';
import 'package:es_developer_assessment/domain/blocs/movies/movies_events.dart';
import 'package:es_developer_assessment/domain/blocs/movies/movies_states.dart';
import 'package:es_developer_assessment/domain/models/movie/movie_model.dart';
import 'package:es_developer_assessment/domain/models/movie_detail/movie_detail_model.dart';
import 'package:es_developer_assessment/domain/models/movie_video/movie_video_model.dart';
import 'package:es_developer_assessment/utils/enums.dart';
import 'package:es_developer_assessment/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class MoviesBloc extends HydratedBloc<MoviesEvents, MoviesStates> {
  final MoviesRepository moviesRepository;

  MoviesBloc({required this.moviesRepository}) : super(const MoviesStates()) {
    on<GetUpcomingMovies>(_getUpcomingMovies);
    on<GetPopularMovies>(_getPopularMovies);
    on<GetMovieDetail>(_getMovieDetail);
    on<GetMovieVideos>(_getMovieVideos);
  }
  Future<void> _getUpcomingMovies(GetUpcomingMovies event, Emitter<MoviesStates> emit) async {
    // if (state.isLoadingMoreUpcomingMovies) return;
    emit(state.copyWith(apiStatus: ApiStatus.loading, isLoadingMoreUpcomingMovies: true));

    try {
      final moviesData = await moviesRepository.getUpcommingMovies({"page": event.currentPage}, {});

      List<MovieModel> upcomingMovies = moviesData['results'].map<MovieModel>((movie) => MovieModel.fromJson(movie)).toList();

      final existingMovieIds = state.upcomingMovies?.map((movie) => movie.id).toSet() ?? {};

      List<MovieModel> allUpcomingMovies = [
        if (state.upcomingMovies != null) ...state.upcomingMovies!,
        ...upcomingMovies.where((movie) => !existingMovieIds.contains(movie.id))
      ];

      emit(state.copyWith(
          apiStatus: ApiStatus.success,
          upcomingMovies: allUpcomingMovies,
          currentPageForUpcomingMovies: event.currentPage + 1,
          isLoadingMoreUpcomingMovies: false));
    } catch (error) {
      debugPrint('GetUpcomingMovies Error: $error');
      if (error.toString() == "No internet connection") {
        emit(state.copyWith(apiStatus: ApiStatus.noInternet, errorMessage: error.toString(), isLoadingMoreUpcomingMovies: false));
      } else {
        emit(state.copyWith(apiStatus: ApiStatus.error, errorMessage: error.toString(), isLoadingMoreUpcomingMovies: false));
      }
    }
  }

  Future<void> _getPopularMovies(GetPopularMovies event, Emitter<MoviesStates> emit) async {
    // if (state.isLoadingMorePopularMovies) return;
    emit(state.copyWith(apiStatus: ApiStatus.loading, isLoadingMorePopularMovies: true));

    try {
      final moviesData = await moviesRepository.getPopularMovies({"page": event.currentPage}, {});

      List<MovieModel> popularMovies = moviesData['results'].map<MovieModel>((movie) => MovieModel.fromJson(movie)).toList();

      final existingMovieIds = state.popularMovies?.map((movie) => movie.id).toSet() ?? {};

      List<MovieModel> allPopularMovies = [
        if (state.popularMovies != null) ...state.popularMovies!,
        ...popularMovies.where((movie) => !existingMovieIds.contains(movie.id))
      ];

      emit(state.copyWith(
          apiStatus: ApiStatus.success,
          popularMovies: allPopularMovies,
          currentPageForPopularMovies: event.currentPage + 1,
          isLoadingMorePopularMovies: false));
    } catch (error) {
      debugPrint('GetPopularMovies Error: $error');
      if (error.toString() == "No internet connection") {
        emit(state.copyWith(apiStatus: ApiStatus.noInternet, errorMessage: error.toString(), isLoadingMoreUpcomingMovies: false));
      } else {
        emit(state.copyWith(apiStatus: ApiStatus.error, errorMessage: error.toString(), isLoadingMoreUpcomingMovies: false));
      }
    }
  }

  Future<void> _getMovieDetail(GetMovieDetail event, Emitter<MoviesStates> emit) async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));

    try {
      if (state.movieDetailsCache.containsKey(event.movieId)) {
        emit(state.copyWith(apiStatus: ApiStatus.success, movieDetailsCache: state.movieDetailsCache));
      } else {
        final movieDetail = await moviesRepository.getMovieDetail({"movieId": event.movieId}, {});

        final movieDetailModel = MovieDetailModel.fromJson(movieDetail);

        emit(state.copyWith(
          apiStatus: ApiStatus.success,
          movieDetailsCache: {...state.movieDetailsCache, event.movieId: movieDetailModel},
        ));
      }
    } catch (error) {
      debugPrint('GetMovieDetail Error: $error');
      if (error.toString() == "No internet connection") {
        emit(state.copyWith(apiStatus: ApiStatus.noInternet, errorMessage: error.toString(), isLoadingMoreUpcomingMovies: false));
      } else {
        emit(state.copyWith(apiStatus: ApiStatus.error, errorMessage: error.toString(), isLoadingMoreUpcomingMovies: false));
      }
    }
  }

  Future<void> _getMovieVideos(GetMovieVideos event, Emitter<MoviesStates> emit) async {
    bool isConnected = await isConnectedToInternet();
    if (!isConnected) {
      emit(state.copyWith(apiStatus: ApiStatus.noInternet));
      return;
    }
    emit(state.copyWith(apiStatus: ApiStatus.loading));

    try {
      final movieVideos = await moviesRepository.getMovieVideos({"movieId": event.movieId}, {});

      List<MovieVideoModel> movieVideosList = movieVideos['results'].map<MovieVideoModel>((movie) => MovieVideoModel.fromJson(movie)).toList();
      MovieVideoModel movieVideoModel = movieVideosList.firstWhere((element) => element.type == 'Trailer');

      emit(state.copyWith(apiStatus: ApiStatus.success, movieVideoModel: movieVideoModel));
    } catch (error) {
      debugPrint('GetMovieVideos Error: $error');
      if (error.toString() == "No internet connection") {
        emit(state.copyWith(apiStatus: ApiStatus.noInternet, errorMessage: error.toString(), isLoadingMoreUpcomingMovies: false));
      } else {
        emit(state.copyWith(apiStatus: ApiStatus.error, errorMessage: error.toString(), isLoadingMoreUpcomingMovies: false));
      }
    }
  }

  @override
  MoviesStates? fromJson(Map<String, dynamic> json) {
    return MoviesStates.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(MoviesStates state) {
    return state.toJson();
  }
}
