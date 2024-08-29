import 'package:es_developer_assessment/app/routes/routes_name.dart';
import 'package:es_developer_assessment/data/api/endpoints.dart';
import 'package:es_developer_assessment/domain/models/movie/movie_model.dart';
import 'package:es_developer_assessment/presentation/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

class HorizontalMovieTile extends StatelessWidget {
  const HorizontalMovieTile({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context,RoutesName.movieDetailRoute, arguments: movie),
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: SizedBox(
          width: 125,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CustomImageView(imagePath: Endpoints.baseUrlForImage + movie.posterPath.toString(), width: 125, height: 175, fit: BoxFit.cover),
              ),
              const SizedBox(height: 8),
              Text(movie.title!, style: Theme.of(context).textTheme.titleSmall, maxLines: 2, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.star, color: Colors.yellow, size: 16),
                  Text("${movie.voteAverage!.toStringAsFixed(2)}/10 IMDb", style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
