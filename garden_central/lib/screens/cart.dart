import 'package:flutter/material.dart';
import 'package:garden_central/components/custom_appbar.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Cart',
        onSearchPressed: () {},
        onCartPressed: () {},
      ),
      body: Center(
        child: Text('Cart Screen'),
      ),
    );
  }
}
