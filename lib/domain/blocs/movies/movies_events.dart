import 'package:equatable/equatable.dart';

abstract class MoviesEvents extends Equatable {
  const MoviesEvents();

  @override
  List<Object> get props => [];
}

class GetUpcomingMovies extends MoviesEvents {
  const GetUpcomingMovies(this.currentPage);
  final int currentPage;

  @override
  List<Object> get props => [currentPage];
}

class GetPopularMovies extends MoviesEvents {
  const GetPopularMovies(this.currentPage);
  final int currentPage;

  @override
  List<Object> get props => [currentPage];
}

class GetMovieDetail extends MoviesEvents {
  const GetMovieDetail(this.movieId);
  final int movieId;

  @override
  List<Object> get props => [movieId];
}

class GetMovieVideos extends MoviesEvents {
  const GetMovieVideos(this.movieId);
  final int movieId;

  @override
  List<Object> get props => [movieId];
}
