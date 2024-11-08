import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../../../repositories/abstract_recipies_repository.dart';
import '../../../repositories/models/category.dart';
part 'categories_screen_event.dart';
part 'categories_screen_state.dart';

class CategoriesScreenBloc
    extends Bloc<CategoriesScreenEvent, CategoriesScreenState> {
  CategoriesScreenBloc(this.recipiesRepository)
      : super(CategoriesScreenInitial()) {
    on<LoadCategoriesScreen>((event, emit) async {
      try {
        if (state is! CategoriesScreenLoaded) {
          emit(CategoriesScreenLoading());
        }
        final categories = await recipiesRepository.getCategories();
        emit(CategoriesScreenLoaded(categories: categories));
      } catch (e, st) {
        emit(CategoriesScreenLoadingFailure(exception: e));
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
