import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/features/main_page_screen/widgets/recipe_card.dart';
import 'package:recipe_app/features/recipies_by_category_screen/bloc/recipies_by_category_bloc.dart';
import 'package:recipe_app/repositories/abstract_recipies_repository.dart';


@RoutePage()
class RecipiesByCategoryScreen extends StatelessWidget {
  RecipiesByCategoryScreen({super.key, required this.categoryName});

  final String categoryName;

  final _recipiesByCategoryBloc =
      RecipiesByCategoryBloc(GetIt.I<AbstractRecipiesRepository>());

  @override
  Widget build(BuildContext context) {
    _recipiesByCategoryBloc
        .add(LoadRecipiesByCategory(categoryName: categoryName));
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryName,
        ),
        leading: IconButton(
          onPressed: () => AutoRouter.of(context).popForced(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<RecipiesByCategoryBloc, RecipiesByCategoryState>(
        bloc: _recipiesByCategoryBloc,
        builder: (context, state) {
          if (state is RecipiesByCategoryLoaded) {
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
                    itemCount: state.recipies.length,
                    itemBuilder: (context, index) {
                      return RecipeCard(dish: state.recipies[index]);
                    },
                  ),
                ),
              ],
            );
          }
          if (state is RecipiesByCategoryLoadingFailure) {
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
                        _recipiesByCategoryBloc.add(
                            LoadRecipiesByCategory(categoryName: categoryName));
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
