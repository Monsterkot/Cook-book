import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/repositories/abstract_recipies_repository.dart';
import 'package:recipe_app/repositories/recipies_repository.dart';
import 'package:recipe_app/theme/theme_provider.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'recipe_app.dart';


void main() {
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug('Talker started...');

  final dio = Dio();
  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printResponseData: false,
      ),
    ),
  );

  GetIt.I.registerLazySingleton<AbstractRecipiesRepository>(
      () => RecipiesRepository(
            dio: dio,
          ));

  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: const TalkerBlocLoggerSettings(
      printStateFullData: false,
      printEventFullData: false,
    ),
  );

  FlutterError.onError =
      (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

  runZonedGuarded(
    () {
      runApp(
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
          child: const MyRecipeApp(),
          ),
        );
    },
    (e, st) => GetIt.I<Talker>().handle(e, st),
  );
}
