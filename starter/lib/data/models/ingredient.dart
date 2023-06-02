import 'package:equatable/equatable.dart';

class Ingredient extends Equatable {
  int? id;
  int? recipeId;
  final String? name;
  final double? weight;

  Ingredient({
    this.name,
    this.weight,
    this.id,
    this.recipeId,
  });

  @override
  List<Object?> get props => [
        recipeId,
        name,
        weight,
      ];
}
