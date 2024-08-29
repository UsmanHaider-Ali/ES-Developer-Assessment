import 'package:dio/dio.dart';
import 'package:es_developer_assessment/data/api/dio_client.dart';
import 'package:es_developer_assessment/data/repositories/movies/movies_repository.dart';
import 'package:es_developer_assessment/domain/blocs/movies/movies_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton<Dio>(() => Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
      )));
  locator.registerLazySingleton<DioClient>(() => DioClient(dio: locator(), apiKey: dotenv.env['API_KEY']!));

  locator.registerLazySingleton<MoviesRepository>(() => MoviesRepository(dioClient: locator()));

  locator.registerFactory<MoviesBloc>(() => MoviesBloc(moviesRepository: locator()));
}
