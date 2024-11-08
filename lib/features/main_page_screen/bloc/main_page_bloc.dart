import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/repositories/abstract_recipies_repository.dart';
import 'package:recipe_app/repositories/models/recipe.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc(this.recipiesRepository) : super(MainPageInitial()) {
    on<LoadMainPage>((event, emit) async {
      try {
        if (state is! MainPageLoaded) {
          emit(MainPageLoading());
        }
        final recipies = await recipiesRepository.getRandomRecipies();
        emit(MainPageLoaded(recipies: recipies));
      } catch (e, st) {
        emit(MainPageLoadingFailure(exception: e));
        GetIt.I<Talker>().handle(e, st);
      } finally {
        event.completer?.complete();
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
