part of 'recipies_by_category_bloc.dart';

abstract class RecipiesByCategoryState {}

class RecipiesByCategoryInitial extends RecipiesByCategoryState {}

class RecipiesByCategoryLoading extends RecipiesByCategoryState {}

class RecipiesByCategoryLoaded extends RecipiesByCategoryState {
  RecipiesByCategoryLoaded({required this.recipies});

  final List<Recipe> recipies;
}

class RecipiesByCategoryLoadingFailure extends RecipiesByCategoryState {
  RecipiesByCategoryLoadingFailure({
    required this.exception,
  });

  final Object? exception;
}
