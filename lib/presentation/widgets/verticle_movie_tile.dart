import 'package:es_developer_assessment/app/routes/routes_name.dart';
import 'package:es_developer_assessment/data/api/endpoints.dart';
import 'package:es_developer_assessment/domain/models/movie/movie_model.dart';
import 'package:es_developer_assessment/presentation/widgets/custom_image_view.dart';
import 'package:es_developer_assessment/presentation/widgets/movie_tage_tile.dart';
import 'package:es_developer_assessment/utils/functions.dart';
import 'package:flutter/material.dart';

class VerticleMovieTile extends StatelessWidget {
  const VerticleMovieTile({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, RoutesName.movieDetailRoute, arguments: movie),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CustomImageView(imagePath: Endpoints.baseUrlForImage + movie.posterPath!, width: 100, height: 125, fit: BoxFit.cover),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title!, style: Theme.of(context).textTheme.titleMedium, maxLines: 2, overflow: TextOverflow.ellipsis, softWrap: true),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 16),
                      Text("${movie.voteAverage!.toStringAsFixed(2)}/10 IMDb", style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 20,
                    child: ListView.separated(
                      itemCount: movie.genreIds!.length > 3 ? 3 : movie.genreIds!.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => MovieTageTile(genreId: movie.genreIds![index]),
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(width: 8);
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(formatDateString(movie.releaseDate.toString()), style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
