import 'dart:convert';
import 'dart:math';

import 'package:chopper/chopper.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../network/model_response.dart';
import '../network/recipe_model.dart';

class MockService {
  late final APIRecipeQuery _apiRecipeQuery;
  late final APIRecipeQuery _apiRecipeQuery2;

  void loadRecipes() async {
    final jsonString = await rootBundle.loadString('assets/recipes1.json');
    _apiRecipeQuery = APIRecipeQuery.fromJson(jsonDecode(jsonString));
    final jsonString2 = await rootBundle.loadString('assets/recipes2.json');
    _apiRecipeQuery2 = APIRecipeQuery.fromJson(jsonDecode(jsonString2));
  }

  Future<Response<Result<APIRecipeQuery>>> queryRecipes(
      String query, int from, int to) {
    if (Random().nextBool()) {
      return Future.value(
        Response(
          http.Response(
            'Dummy',
            200,
            request: null,
          ),
          Success<APIRecipeQuery>(_apiRecipeQuery),
        ),
      );
    } else {
      return Future.value(
        Response(
          http.Response(
            'Dummy',
            200,
            request: null,
          ),
          Success<APIRecipeQuery>(_apiRecipeQuery2),
        ),
      );
    }
  }
}
