// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [CategoriesScreen]
class CategoriesRoute extends PageRouteInfo<CategoriesRouteArgs> {
  CategoriesRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CategoriesRoute.name,
          args: CategoriesRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CategoriesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CategoriesRouteArgs>(
          orElse: () => const CategoriesRouteArgs());
      return CategoriesScreen(key: args.key);
    },
  );
}

class CategoriesRouteArgs {
  const CategoriesRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'CategoriesRouteArgs{key: $key}';
  }
}

/// generated route for
/// [MainPageScreen]
class MainRouteRoute extends PageRouteInfo<void> {
  const MainRouteRoute({List<PageRouteInfo>? children})
      : super(
          MainRouteRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRouteRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainPageScreen();
    },
  );
}

/// generated route for
/// [RecipeDetailsScreen]
class RecipeDetailsRoute extends PageRouteInfo<RecipeDetailsRouteArgs> {
  RecipeDetailsRoute({
    Key? key,
    required Recipe dish,
    List<PageRouteInfo>? children,
  }) : super(
          RecipeDetailsRoute.name,
          args: RecipeDetailsRouteArgs(
            key: key,
            dish: dish,
          ),
          initialChildren: children,
        );

  static const String name = 'RecipeDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RecipeDetailsRouteArgs>();
      return RecipeDetailsScreen(
        key: args.key,
        dish: args.dish,
      );
    },
  );
}

class RecipeDetailsRouteArgs {
  const RecipeDetailsRouteArgs({
    this.key,
    required this.dish,
  });

  final Key? key;

  final Recipe dish;

  @override
  String toString() {
    return 'RecipeDetailsRouteArgs{key: $key, dish: $dish}';
  }
}

/// generated route for
/// [RecipiesByCategoryScreen]
class RecipiesByCategoryRoute
    extends PageRouteInfo<RecipiesByCategoryRouteArgs> {
  RecipiesByCategoryRoute({
    Key? key,
    required String categoryName,
    List<PageRouteInfo>? children,
  }) : super(
          RecipiesByCategoryRoute.name,
          args: RecipiesByCategoryRouteArgs(
            key: key,
            categoryName: categoryName,
          ),
          initialChildren: children,
        );

  static const String name = 'RecipiesByCategoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RecipiesByCategoryRouteArgs>();
      return RecipiesByCategoryScreen(
        key: args.key,
        categoryName: args.categoryName,
      );
    },
  );
}

class RecipiesByCategoryRouteArgs {
  const RecipiesByCategoryRouteArgs({
    this.key,
    required this.categoryName,
  });

  final Key? key;

  final String categoryName;

  @override
  String toString() {
    return 'RecipiesByCategoryRouteArgs{key: $key, categoryName: $categoryName}';
  }
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsScreen();
    },
  );
}
