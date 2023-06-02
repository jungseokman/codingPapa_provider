import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../data/memory_repository.dart';
import '../../data/models/models.dart';

class MyRecipesList extends StatefulWidget {
  const MyRecipesList({Key? key}) : super(key: key);

  @override
  State createState() => _MyRecipesListState();
}

class _MyRecipesListState extends State<MyRecipesList> {
  // TODO: Update recipes declaration

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: _buildRecipeList(context),
    );
  }

  Widget _buildRecipeList(BuildContext context) {
    // TODO: Add Consumer
    return Consumer<MemoryRepository>(
      builder: (context, memoryRepository, child) {
        final recipeList = memoryRepository.findAllRecipes();

        return ListView.builder(
          itemCount: recipeList.length,
          itemBuilder: (BuildContext context, int index) {
            // TODO: Add recipe definition
            final recipe = recipeList[index];
            final size = MediaQuery.of(context).size;
            return SizedBox(
              height: 100,
              child: Slidable(
                startActionPane: ActionPane(
                  motion: const DrawerMotion(),
                  extentRatio: 0.25,
                  children: [
                    SlidableAction(
                      label: 'Delete',
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.black,
                      icon: Icons.delete,
                      // TODO: Update first onPressed
                      onPressed: (context) {
                        deleteRecipe(memoryRepository, recipe);
                      },
                    ),
                  ],
                ),
                endActionPane: ActionPane(
                  motion: const DrawerMotion(),
                  extentRatio: 0.25,
                  children: [
                    SlidableAction(
                      label: 'Delete',
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.black,
                      icon: Icons.delete,
                      // TODO: Update second onPressed
                      onPressed: (context) {
                        deleteRecipe(memoryRepository, recipe);
                      },
                    ),
                  ],
                ),
                child: Card(
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.white,
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        // TODO: Replace with image from recipe
                        leading: CachedNetworkImage(
                          imageUrl: recipe.image ?? '',
                          errorWidget: (_, __, ___) {
                            return Container(
                              color: Colors.red,
                            );
                          },
                          height: 60,
                          width: 60,
                        ),
                        // TODO: Replace title hardcoding
                        title: Text(recipe.label ?? ''),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
    // TODO: Add final brace and parenthesis
  }

// TODO: Add deleteRecipe() here
  void deleteRecipe(MemoryRepository memoryRepository, Recipe recipe) {
    memoryRepository.deleteRecipe(recipe);
  }
}
