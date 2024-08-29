import 'package:es_developer_assessment/data/api/endpoints.dart';
import 'package:es_developer_assessment/domain/models/movie_detail/movie_detail_model.dart';
import 'package:es_developer_assessment/presentation/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

class ProductionCompanyTile extends StatelessWidget {
  const ProductionCompanyTile({super.key, required this.productionCompanies});

  final ProductionCompanies productionCompanies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 125,
      child: Column(
        children: [
          Container(
            width: 100,
            height: 75,
            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.05), borderRadius: BorderRadius.circular(8)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CustomImageView(imagePath: Endpoints.baseUrlForImage + productionCompanies.logoPath.toString(), width: 75, height: 75),
            ),
          ),
          const SizedBox(height: 4),
          Text(productionCompanies.name!,
              style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.start, maxLines: 2, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
