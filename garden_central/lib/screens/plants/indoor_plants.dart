import 'package:flutter/material.dart';
import 'package:garden_central/components/custom_appbar.dart';
import 'package:garden_central/components/side_bar.dart';
import 'package:garden_central/screens/cart.dart';
import 'package:garden_central/screens/plants/category.dart';

class IndoorPlants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Category(category: 'Indoor'),
    );
  }
}
