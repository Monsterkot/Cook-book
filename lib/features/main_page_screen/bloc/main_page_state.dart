part of 'main_page_bloc.dart';

abstract class MainPageState {}

class MainPageInitial extends MainPageState {}

class MainPageLoading extends MainPageState {}

class MainPageLoaded extends MainPageState {
  MainPageLoaded({required this.recipies});

  final List<Recipe> recipies;
}

class MainPageLoadingFailure extends MainPageState {
  MainPageLoadingFailure({required this.exception});

  final Object? exception;
}
