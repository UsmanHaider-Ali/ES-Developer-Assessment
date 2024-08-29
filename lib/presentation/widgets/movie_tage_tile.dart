import 'package:es_developer_assessment/resources/colors_manager.dart';
import 'package:es_developer_assessment/utils/functions.dart';
import 'package:flutter/material.dart';

class MovieTageTile extends StatelessWidget {
  const MovieTageTile({super.key, required this.genreId});

  final int genreId;

  @override
  Widget build(BuildContext context) {
    // String? genreName = Genre.getNameById(genreId);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 8, left: 8, top: 2, bottom: 2),
        child: Center(child: Text(genreId.getGenreName()!, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorsManager.primary))),
      ),
    );
  }
}
