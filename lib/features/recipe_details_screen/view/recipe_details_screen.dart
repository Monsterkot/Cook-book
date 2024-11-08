import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/repositories/models/recipe.dart';

@RoutePage()
class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen({
    super.key,
    required this.dish,
  });

  final Recipe dish;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(dish.name),
        leading: IconButton(
          onPressed: () => AutoRouter.of(context).popForced(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Instructions',
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Image.network(
                dish.imageUrl,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              Text(
                'Ingredients:',
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              ...dish.ingredients.entries.map(
                //оператор расширения ... распаковывает элементы коллекции
                (entry) => Text(
                  '• ${entry.key} - ${entry.value}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Detailed cooking instructions:',
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                dish.instructions,
                style: theme.textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
