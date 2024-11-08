import 'package:recipe_app/repositories/models/category.dart';

import 'models/recipe.dart';

abstract class AbstractRecipiesRepository {
  Future<List<Recipe>> getRandomRecipies();
  Future<List<Category>> getCategories();
  Future<List<Recipe>> getRecipiesByCategory(String categoryName);
}
