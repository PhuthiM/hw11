
import 'package:flutter/material.dart';

class FoodListPage extends StatelessWidget {
  const FoodListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('FOOD MENU', style: Theme.of(context).textTheme.headline1),
    );
    ;
  }
}
