import 'package:es_developer_assessment/app/di/locator.dart';
import 'package:es_developer_assessment/domain/blocs/movies/movies_bloc.dart';
import 'package:es_developer_assessment/domain/blocs/movies/movies_events.dart';
import 'package:es_developer_assessment/domain/blocs/movies/movies_states.dart';
import 'package:es_developer_assessment/domain/models/movie/movie_model.dart';
import 'package:es_developer_assessment/presentation/widgets/movie_detail_shimmer.dart';
import 'package:es_developer_assessment/presentation/widgets/movie_tage_tile.dart';
import 'package:es_developer_assessment/presentation/widgets/no_internet_connection.dart';
import 'package:es_developer_assessment/presentation/widgets/production_company_tile.dart';
import 'package:es_developer_assessment/utils/enums.dart';
import 'package:es_developer_assessment/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key, required this.movieModel});

  final MovieModel movieModel;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late final MoviesBloc moviesBloc;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    moviesBloc = locator<MoviesBloc>();
    moviesBloc.add(GetMovieDetail(widget.movieModel.id!));
    moviesBloc.add(GetMovieVideos(widget.movieModel.id!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocProvider.value(
        value: moviesBloc,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            BlocBuilder<MoviesBloc, MoviesStates>(
              // buildWhen: (previous, current) => previous.movieVideoModel!= current.movieVideoModel,
              builder: (context, state) {
                if (state.apiStatus == ApiStatus.initial || state.apiStatus == ApiStatus.loading) {
                  return const SizedBox(height: 300, child: Center(child: CircularProgressIndicator()));
                }

                if (state.apiStatus == ApiStatus.error) {
                  return const Center();
                }
                if (state.movieVideoModel == null) {
                  return Center(child: Text("Something went wrong, please try again later.", style: Theme.of(context).textTheme.bodyMedium));
                }
                _controller = YoutubePlayerController(
                    initialVideoId: state.movieVideoModel!.key!, flags: const YoutubePlayerFlags(autoPlay: true, mute: false));
                return SizedBox(
                  height: 300,
                  child: YoutubePlayer(controller: _controller, showVideoProgressIndicator: true),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocBuilder<MoviesBloc, MoviesStates>(
                // buildWhen: (previous, current) => previous.movieDetailModel != current.movieDetailModel,
                builder: (context, state) {
                  if (state.apiStatus == ApiStatus.initial || state.apiStatus == ApiStatus.loading) {
                    return const MovieDetailShimmer();
                  }
                  if (state.apiStatus == ApiStatus.error) {
                    return const SizedBox(height: 750, child: NoInternetConnection());
                  }
                  return state.movieDetailModel == null
                      ? const MovieDetailShimmer()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.movieModel.title!, style: Theme.of(context).textTheme.titleLarge),
                            const SizedBox(height: 12),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.star, color: Colors.yellow, size: 16),
                                Text("${state.movieDetailModel!.voteAverage!.toStringAsFixed(2)}/10 IMDb",
                                    style: Theme.of(context).textTheme.bodyMedium),
                              ],
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              height: 20,
                              child: ListView.separated(
                                itemCount: state.movieDetailModel!.genres!.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => MovieTageTile(genreId: state.movieDetailModel!.genres![index].id!),
                                separatorBuilder: (BuildContext context, int index) {
                                  return const SizedBox(width: 8);
                                },
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text("Overview", style: Theme.of(context).textTheme.titleLarge),
                            const SizedBox(height: 6),
                            Text(state.movieDetailModel!.overview!, style: Theme.of(context).textTheme.bodyMedium),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                getTitleWithOption(context, "Release Date", formatDateString(state.movieDetailModel!.releaseDate!.toString())),
                                getTitleWithOption(context, "Language", state.movieDetailModel!.spokenLanguages![0].englishName!),
                                getTitleWithOption(context, "Runtime", "${state.movieDetailModel!.runtime!} min"),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text("Producers", style: Theme.of(context).textTheme.titleLarge),
                            const SizedBox(height: 6),
                            SizedBox(
                              height: 125,
                              child: ListView.separated(
                                itemCount: state.movieDetailModel!.productionCompanies!.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    ProductionCompanyTile(productionCompanies: state.movieDetailModel!.productionCompanies![index]),
                                separatorBuilder: (BuildContext context, int index) {
                                  return const SizedBox(width: 12);
                                },
                              ),
                            ),
                          ],
                        );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Column getTitleWithOption(BuildContext context, String title, String description) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodyMedium),
        Text(description, style: Theme.of(context).textTheme.titleSmall),
      ],
    );
  }
}
