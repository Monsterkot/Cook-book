import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/router/router.dart';
import '../../../repositories/models/category.dart';


class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(RecipiesByCategoryRoute(categoryName: category.name));
      },
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                category.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                category.name,
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