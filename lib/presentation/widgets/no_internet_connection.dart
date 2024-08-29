import 'package:es_developer_assessment/presentation/widgets/custom_image_view.dart';
import 'package:es_developer_assessment/resources/assets_manager.dart';
import 'package:es_developer_assessment/resources/colors_manager.dart';
import 'package:flutter/material.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CustomImageView(imagePath: AssetsManager.noInternet, width: 50, height: 50, color: ColorsManager.secondaryText),
        const SizedBox(height: 12),
        Text("No Internet Connection", style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center),
      ],
    );
  }
}
