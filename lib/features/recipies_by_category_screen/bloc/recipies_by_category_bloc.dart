import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/repositories/abstract_recipies_repository.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../../repositories/models/recipe.dart';

part 'recipies_by_category_event.dart';
part 'recipies_by_category_state.dart';

class RecipiesByCategoryBloc
    extends Bloc<RecipiesByCategoryEvent, RecipiesByCategoryState> {
  RecipiesByCategoryBloc(this.recipiesRepository)
      : super(RecipiesByCategoryInitial()) {
    on<LoadRecipiesByCategory>((event, emit) async {
      try {
        if (state is! RecipiesByCategoryLoaded) {
          emit(RecipiesByCategoryLoading());
        }
        final recipies =
            await recipiesRepository.getRecipiesByCategory(event.categoryName);
        emit(RecipiesByCategoryLoaded(recipies: recipies));
      } catch (e, st) {
        emit(RecipiesByCategoryLoadingFailure(exception: e));
        GetIt.I<Talker>().handle(e, st);
      }
    });
  }

  final AbstractRecipiesRepository recipiesRepository;

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
