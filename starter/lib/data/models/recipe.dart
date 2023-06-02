import 'package:equatable/equatable.dart';

import 'ingredient.dart';

class Recipe extends Equatable {
  int? id;
  final String? label;
  final String? url;
  final String? image;

  List<Ingredient>? ingredient;
  final double? calories;
  final double? totalWeight;
  final double? totalTime;

  Recipe({
    this.label,
    this.url,
    this.image,
    this.calories,
    this.totalWeight,
    this.totalTime,
  });

  @override
  List<Object?> get props => [
        label,
        image,
        url,
        calories,
        totalTime,
        totalWeight,
      ];
}
