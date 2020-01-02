import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  static const String pathName = "/";
  @override
  Widget build(BuildContext context) {
      return GridView(
        padding: const EdgeInsets.all(15.0),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES.map((category) {
          return CategoryItem(
            title: category.title,
            color: category.color,
            id: category.id,
          );
        }).toList(),
      );
  }
}
