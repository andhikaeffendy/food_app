import 'package:flutter/material.dart';
import 'package:food_app/features/data/model/meals.dart';

class DetailDisplay extends StatelessWidget {
  Meals meals = Meals();
  DetailDisplay(this.meals);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage("${meals.strMealThumb}"),
              fit: BoxFit.contain)),
      child: Center(
        child: Container(
          child: Text(
            "${meals.strMeal}",
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
            style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                backgroundColor: Colors.black26,
                decorationStyle: TextDecorationStyle.wavy,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
