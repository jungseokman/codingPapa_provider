import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/memory_repository.dart';

class ShoppingList extends StatefulWidget {
  const ShoppingList({Key? key}) : super(key: key);

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final checkBoxValues = <int, bool>{};

  @override
  Widget build(BuildContext context) {
    // TODO: Add Consumer widget
    return Consumer<MemoryRepository>(
      builder: (context, memoryRepository, child) {
        final ingredients = memoryRepository.findAllIngredients();
        return ListView.builder(
          itemCount: ingredients.length,
          itemBuilder: (BuildContext context, int index) {
            final ingredient = ingredients[index];
            return CheckboxListTile(
              value:
                  checkBoxValues.containsKey(index) && checkBoxValues[index]!,
              // TODO: Update title to include name
              title: Text(ingredient.name ?? ''),
              onChanged: (newValue) {
                if (newValue != null) {
                  setState(() {
                    checkBoxValues[index] = newValue;
                  });
                }
              },
            );
          },
        );
      },
    );
    // TODO: Add closing brace and parenthesis
  }
}
