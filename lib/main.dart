import 'package:es_developer_assessment/app/di/locator.dart';
import 'package:es_developer_assessment/app/my_app.dart';
import 'package:es_developer_assessment/domain/blocs/movies/movies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();
  setupLocator();
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: await getTemporaryDirectory());

  runApp(
    BlocProvider(
      create: (context) => MoviesBloc(moviesRepository: locator()),
      child: const MyApp(),
    ),
  );
}
