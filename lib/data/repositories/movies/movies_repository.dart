import 'package:es_developer_assessment/data/api/dio_client.dart';
import 'package:es_developer_assessment/data/api/endpoints.dart';

class MoviesRepository {
  final DioClient _dioClient;

  MoviesRepository({required DioClient dioClient}) : _dioClient = dioClient;

  Future<dynamic> getUpcommingMovies(Map<String, dynamic> params, Map<String, dynamic> headers) async =>
      await _dioClient.getService(Endpoints.upcomingMovies, params, headers);

  Future<dynamic> getPopularMovies(Map<String, dynamic> params, Map<String, dynamic> headers) async =>
      await _dioClient.getService(Endpoints.popularMovies, params, headers);

  Future<dynamic> getMovieDetail(Map<String, dynamic> params, Map<String, dynamic> headers) async =>
      await _dioClient.getService("${Endpoints.movieDetailAndVideos}${params["movieId"]}", params, headers);

  Future<dynamic> getMovieVideos(Map<String, dynamic> params, Map<String, dynamic> headers) async =>
      await _dioClient.getService("${Endpoints.movieDetailAndVideos}${params["movieId"]}/videos", params, headers);
}
