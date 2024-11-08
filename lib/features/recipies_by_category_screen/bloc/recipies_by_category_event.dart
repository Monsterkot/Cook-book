part of 'recipies_by_category_bloc.dart';

abstract class RecipiesByCategoryEvent {}

class LoadRecipiesByCategory extends RecipiesByCategoryEvent {
  LoadRecipiesByCategory({
    required this.categoryName,
  });
  
  final String categoryName;
}
