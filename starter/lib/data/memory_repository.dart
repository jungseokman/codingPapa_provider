import 'package:flutter/cupertino.dart';

import 'models/ingredient.dart';
import 'models/recipe.dart';
import 'repository.dart';

class MemoryRepository extends Repository with ChangeNotifier {
  final List<Recipe> _currentRecipes = <Recipe>[];
  final List<Ingredient> _currentIngredients = <Ingredient>[];

  @override
  void close() {
    // TODO: implement close
  }

  @override
  Future create() {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  void deleteIngredient(Ingredient ingredient) {
    // TODO: implement deleteIngredient
    _currentIngredients.remove(ingredient);
    notifyListeners();
  }

  @override
  void deleteIngredients(List<Ingredient> ingredients) {
    _currentIngredients
        .removeWhere((ingredient) => ingredients.contains(ingredient));
    notifyListeners();
  }

  @override
  void deleteRecipe(Recipe recipe) {
    // TODO: implement deleteRecipe
    _currentRecipes.remove(recipe);
    if (recipe.id != null) {
      deleteRecipeIngredients(recipe.id!);
    } else {
      notifyListeners();
    }
  }

  @override
  void deleteRecipeIngredients(int recipeId) {
    // TODO: implement deleteRecipeIngredients
    _currentIngredients
        .removeWhere((ingredient) => ingredient.recipeId == recipeId);
    notifyListeners();
  }

  @override
  List<Ingredient> findAllIngredients() {
    return _currentIngredients;
  }

  @override
  List<Recipe> findAllRecipes() {
    return _currentRecipes;
  }

  @override
  Recipe findRecipeById(int id) {
    return _currentRecipes.firstWhere((recipe) => recipe.id == id);
  }

  @override
  List<Ingredient> findRecipeIngredients(int recipeId) {
    return _currentIngredients
        .where((ingredient) => ingredient.recipeId == recipeId)
        .toList();
  }

  @override
  List<int> insertIngredients(List<Ingredient> ingredients) {
    if (ingredients.isNotEmpty) {
      _currentIngredients.addAll(ingredients);
      notifyListeners();
    }
    return <int>[];
  }

  @override
  int insertRecipe(Recipe recipe) {
    _currentRecipes.add(recipe);
    if (recipe.ingredient != null) {
      _currentIngredients.addAll(recipe.ingredient!);
    }
    notifyListeners();
    return 0;
  }
}
