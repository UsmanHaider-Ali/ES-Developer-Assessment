import 'package:es_developer_assessment/app/di/locator.dart';
import 'package:es_developer_assessment/domain/blocs/movies/movies_bloc.dart';
import 'package:es_developer_assessment/domain/blocs/movies/movies_events.dart';
import 'package:es_developer_assessment/domain/blocs/movies/movies_states.dart';
import 'package:es_developer_assessment/presentation/widgets/horizontal_movie_tile.dart';
import 'package:es_developer_assessment/presentation/widgets/verticle_movie_tile.dart';
import 'package:es_developer_assessment/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  late final MoviesBloc moviesBloc;
  late final ScrollController _upcomingMoviesScrollController;
  late final ScrollController _popularMoviesScrollController;

  @override
  void initState() {
    super.initState();
    moviesBloc = locator<MoviesBloc>();
    _upcomingMoviesScrollController = ScrollController();
    _popularMoviesScrollController = ScrollController();

    moviesBloc.add(const GetUpcomingMovies(1));
    moviesBloc.add(const GetPopularMovies(1));

    _upcomingMoviesScrollController.addListener(_onUpcomingMoviesScroll);
    _popularMoviesScrollController.addListener(_onPopularMoviesScroll);
  }

  void _onUpcomingMoviesScroll() {
    if (_upcomingMoviesScrollController.position.atEdge && _upcomingMoviesScrollController.position.pixels != 0) {
      final currentPage = moviesBloc.state.currentPageForUpcomingMovies;
      final isLoading = moviesBloc.state.isLoadingMoreUpcomingMovies;
      if (!isLoading) moviesBloc.add(GetUpcomingMovies(currentPage));
    }
  }

  void _onPopularMoviesScroll() {
    if (_popularMoviesScrollController.position.atEdge && _popularMoviesScrollController.position.pixels != 0) {
      final currentPage = moviesBloc.state.currentPageForPopularMovies;
      final isLoading = moviesBloc.state.isLoadingMorePopularMovies;
      if (!isLoading) moviesBloc.add(GetPopularMovies(currentPage));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: moviesBloc,
        child: ListView(
          shrinkWrap: true,
          controller: _popularMoviesScrollController,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(16.0),
          children: [
            Text("Upcoming Movies", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            SizedBox(
              height: 250,
              child: BlocBuilder<MoviesBloc, MoviesStates>(
                bloc: moviesBloc,
                buildWhen: (previous, current) => previous.upcomingMovies != current.upcomingMovies,
                builder: (context, state) {
                  debugPrint('Upcoming Movies Builder building...');
                  if (state.apiStatus == ApiStatus.initial || (state.apiStatus == ApiStatus.loading && !state.isLoadingMoreUpcomingMovies)) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    controller: _upcomingMoviesScrollController,
                    itemCount: state.upcomingMovies?.length ?? 0,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => HorizontalMovieTile(movie: state.upcomingMovies![index]),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            Text("Popular Movies", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            BlocBuilder<MoviesBloc, MoviesStates>(
              buildWhen: (previous, current) => previous.popularMovies != current.popularMovies,
              builder: (context, state) {
                if (state.apiStatus == ApiStatus.initial || (state.apiStatus == ApiStatus.loading && !state.isLoadingMorePopularMovies)) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                return ListView.builder(
                  itemCount: state.popularMovies?.length ?? 0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return VerticleMovieTile(movie: state.popularMovies![index]);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _upcomingMoviesScrollController.dispose();
    _popularMoviesScrollController.dispose();
    super.dispose();
  }
}
