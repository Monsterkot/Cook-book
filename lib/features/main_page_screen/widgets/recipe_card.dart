import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/router/router.dart';

import '../../../repositories/models/recipe.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.dish,
  });

  final Recipe dish;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(RecipeDetailsRoute(dish: dish));
      },
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                dish.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                dish.name,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
