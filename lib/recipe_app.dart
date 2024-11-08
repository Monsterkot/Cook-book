import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/router/router.dart';
import 'package:recipe_app/theme/theme_provider.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'theme/theme.dart';


class MyRecipeApp extends StatefulWidget {
  const MyRecipeApp({super.key});

  @override
  State<MyRecipeApp> createState() => _MyRecipeAppState();
}

class _MyRecipeAppState extends State<MyRecipeApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp.router(
      title: 'Cook Book',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeProvider.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      routerConfig: _appRouter.config(
        navigatorObservers: () => [
          TalkerRouteObserver(GetIt.I<Talker>()),
        ],
      ),
    );
  }
}
