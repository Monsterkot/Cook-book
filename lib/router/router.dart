import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/features/recipe_details_screen/view/recipe_details_screen.dart';
import 'package:recipe_app/repositories/models/recipe.dart';

import '../features/categories_screen/view/categories_screen.dart';
import '../features/main_page_screen/view/view.dart';
import '../features/recipies_by_category_screen/view/recipies_by_category_screen.dart';
import '../features/settings_screen/view/settings_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRouteRoute.page, path: '/'),
        AutoRoute(page: RecipeDetailsRoute.page),
        AutoRoute(page: CategoriesRoute.page),
        AutoRoute(page: RecipiesByCategoryRoute.page),
        AutoRoute(page: SettingsRoute.page),
      ];
}