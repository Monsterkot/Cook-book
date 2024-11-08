import 'package:dio/dio.dart';
import 'package:recipe_app/repositories/abstract_recipies_repository.dart';
import 'package:recipe_app/repositories/models/category.dart';
import 'package:recipe_app/repositories/models/recipe.dart';

class RecipiesRepository implements AbstractRecipiesRepository {
  RecipiesRepository({required this.dio});

  final Dio dio;
  @override
  Future<List<Recipe>> getRandomRecipies() async {
    List<Recipe> recipies = [];
    for (var i = 0; i < 10; i++) {
      final response =
          await dio.get('https://www.themealdb.com/api/json/v1/1/random.php');
      final data = response.data['meals'][0] as Map<String, dynamic>;

      // Извлекаем данные для создания объекта Recipe
      String name = data['strMeal'];
      String category = data['strCategory'];
      String country = data['strArea'];
      String instructions = data['strInstructions'];
      String imageUrl = data['strMealThumb'];

      // Извлекаем ингредиенты и их граммовки
      Map<String, String> ingredients = {};
      for (var j = 1; j <= 20; j++) {
        final ingredient = data['strIngredient$j'];
        final measure = data['strMeasure$j'];
        if (ingredient == null || ingredient.toString().isEmpty) {
          break;
        } else {
          ingredients[ingredient] = measure;
        }
      }
      recipies.add(
          Recipe(name, category, country, instructions, ingredients, imageUrl));
    }
    return recipies;
  }

  @override
  Future<List<Category>> getCategories() async {
    final response =
        await dio.get('https://www.themealdb.com/api/json/v1/1/categories.php');
    final List<dynamic> categoriesJson = response.data['categories'];
    List<Category> categories = [];
    for (var el in categoriesJson) {
      categories.add(
          Category(name: el['strCategory'], imageUrl: el['strCategoryThumb']));
    }
    return categories;
  }

  @override
  Future<List<Recipe>> getRecipiesByCategory(String categoryName) async {
    List<Recipe> recipies = [];
    final response = await dio.get(
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=$categoryName');
    final List<dynamic> meals = response.data['meals'];
    final List<String> idMeals =
        meals.map((meal) => meal['idMeal'].toString()).toList();
    for (String id in idMeals) {
      final response = await dio
          .get('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id');
      final data = response.data['meals'][0];

      // Извлекаем данные для создания объекта Recipe
      String name = data['strMeal'];
      String category = data['strCategory'];
      String country = data['strArea'];
      String instructions = data['strInstructions'];
      String imageUrl = data['strMealThumb'];

      // Извлекаем ингредиенты и их граммовки
      Map<String, String> ingredients = {};
      for (var j = 1; j <= 20; j++) {
        final ingredient = data['strIngredient$j'];
        final measure = data['strMeasure$j'];
        if (ingredient == null || ingredient.toString().isEmpty) {
          break;
        } else {
          ingredients[ingredient] = measure;
        }
      }
      recipies.add(
          Recipe(name, category, country, instructions, ingredients, imageUrl));
    }
    return recipies;
  }




  
}
