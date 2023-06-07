import 'package:flutter/material.dart';
import 'package:garden_central/screens/plants/category.dart';

class NewArrivalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Category(category: 'New Arrival'),
    );
  }
}
