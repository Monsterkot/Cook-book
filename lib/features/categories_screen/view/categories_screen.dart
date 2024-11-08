import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/features/categories_screen/bloc/categoties_screen_bloc.dart';
import 'package:recipe_app/features/categories_screen/widgets/category_card.dart';
import 'package:recipe_app/repositories/abstract_recipies_repository.dart';

@RoutePage()
class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final _categoriesScreenBloc =
      CategoriesScreenBloc(GetIt.I<AbstractRecipiesRepository>());

  @override
  Widget build(BuildContext context) {
    _categoriesScreenBloc.add(LoadCategoriesScreen());
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categories',
        ),
        leading: IconButton(
          onPressed: () => AutoRouter.of(context).popForced(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<CategoriesScreenBloc, CategoriesScreenState>(
        bloc: _categoriesScreenBloc,
        builder: (context, state) {
          if (state is CategoriesScreenLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) {
                      return CategoryCard(category: state.categories[index]);
                    },
                  ),
                ),
              ],
            );
          }
          if (state is CategoriesScreenLoadingFailure) {
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
                        _categoriesScreenBloc.add(LoadCategoriesScreen());
                      },
                      child: const Text('Try again')),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
