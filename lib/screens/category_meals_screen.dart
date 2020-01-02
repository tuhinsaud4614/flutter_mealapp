import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String pathName = "/category-meal";
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  Map<String, dynamic> _routeArgs;
  List<Meal> _categoryMeals;
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      _routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
      _categoryMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(_routeArgs["id"]);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_routeArgs["title"]),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return MealItem(
            meal: _categoryMeals[index],
          );
        },
        itemCount: _categoryMeals.length,
      ),
    );
  }
}
