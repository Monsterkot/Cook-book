part of 'categoties_screen_bloc.dart';

abstract class CategoriesScreenState {}

class CategoriesScreenInitial extends CategoriesScreenState {}

class CategoriesScreenLoading extends CategoriesScreenState {}

class CategoriesScreenLoaded extends CategoriesScreenState {
  CategoriesScreenLoaded({
    required this.categories,
  });

  final List<Category> categories;
}

class CategoriesScreenLoadingFailure extends CategoriesScreenState {
  CategoriesScreenLoadingFailure({
    required this.exception,
  });

  final Object? exception;
}
