import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const String pathName = "/meal-detail";
  final Function toogleFavorite;
  final Function isMealFavorite;

  MealDetailScreen(this.toogleFavorite, this.isMealFavorite);

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      // height: 220.0,
      // width: double.infinity,
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      height: 150.0,
      width: 300.0,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, Meal> mealData =
        ModalRoute.of(context).settings.arguments as Map<String, Meal>;

    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: Text(mealData['meal'].title),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 200.0,
              width: double.infinity,
              child: Image.network(
                mealData['meal'].imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle("Ingredients", context),
            buildContainer(
              ListView.builder(
                itemCount: mealData['meal'].ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 10.0,
                      ),
                      child: Text(
                        mealData['meal'].ingredients[index],
                      ),
                    ),
                  );
                },
              ),
            ),
            buildSectionTitle("Steps", context),
            buildContainer(
              ListView.builder(
                itemCount: mealData['meal'].steps.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(
                          mealData['meal'].steps[index],
                        ),
                      ),
                      if (index < mealData['meal'].steps.length - 1) Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isMealFavorite(mealData['meal'].id) ? Icons.star : Icons.star_border,
        ),
        onPressed: () {
          // Navigator.of(context).pop(mealData['meal'].id);
          toogleFavorite(mealData['meal'].id);
        },
      ),
    );
  }
}
