import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/features/main_page_screen/bloc/main_page_bloc.dart';
import 'package:recipe_app/features/main_page_screen/widgets/recipe_card.dart';
import 'package:recipe_app/repositories/abstract_recipies_repository.dart';
import 'package:recipe_app/router/router.dart';
//import 'package:talker_flutter/talker_flutter.dart';

@RoutePage()
class MainPageScreen extends StatefulWidget {
  const MainPageScreen({super.key});

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  final _mainPageBloc = MainPageBloc(GetIt.I<AbstractRecipiesRepository>());
  bool isSearching = false;
  //final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    _mainPageBloc.add(LoadMainPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cook Book',
        ),
        centerTitle: true,
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          );
        }),
        //actions: [
          // IconButton(
          //   icon: Icon(
          //     isSearching ? Icons.close : Icons.search,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {
          //     setState(() {
          //       isSearching = !isSearching;
          //       if (!isSearching) {
          //         _searchController.clear();
          //       }
          //     });
          //   },
          // ),
          // IconButton(
          //   onPressed: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (context) => TalkerScreen(
          //           talker: GetIt.I<Talker>(),
          //         ),
          //       ),
          //     );
          //   },
          //   icon: const Icon(
          //     Icons.data_object,
          //     color: Colors.white,
          //   ),
          // ),
       // ],
        // bottom: isSearching
        //     ? PreferredSize(
        //         preferredSize: const Size.fromHeight(56.0),
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: TextField(
        //             controller: _searchController,
        //             decoration: const InputDecoration(
        //               hintText: 'Search...',
        //               border: OutlineInputBorder(),
        //             ),
        //             onSubmitted: (value) {
        //               //логика поиска
        //               GetIt.I<Talker>().debug('Searching for: $value');
        //             },
        //           ),
        //         ),
        //       )
        //     : null,
      ),
      drawer: Drawer(
        width: 200,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 120,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                ),
                child: Center(
                  child: Text(
                    'Menu',
                    style: theme.textTheme.headlineMedium,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Categories'),
              onTap: () {
                AutoRouter.of(context).push(CategoriesRoute());
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                AutoRouter.of(context).push(const SettingsRoute());
              },
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _mainPageBloc.add(LoadMainPage(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<MainPageBloc, MainPageState>(
          bloc: _mainPageBloc,
          builder: (context, state) {
            if (state is MainPageLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Random Recipies',
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(8.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Две колонки
                        childAspectRatio: 0.75, // Соотношение сторон карточки
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemCount: state.recipies.length,
                      itemBuilder: (context, index) {
                        return RecipeCard(dish: state.recipies[index]);
                      },
                    ),
                  ),
                ],
              );
            }
            if (state is MainPageLoadingFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Something went wrong',
                      style: theme.textTheme.labelMedium
                          ?.copyWith(color: Colors.black),
                    ),
                    Text(
                      'Please try again later',
                      style: theme.textTheme.labelSmall?.copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                        onPressed: () {
                          _mainPageBloc.add(LoadMainPage());
                        },
                        child: const Text('Try again')),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
