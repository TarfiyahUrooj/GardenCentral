import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garden_central/model/plant_details.dart';
import 'package:garden_central/screens/cart.dart';
import 'package:garden_central/screens/cart_product.dart';

class PlantDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> plant;
  //final CartScreen cartScreen;

  PlantDetailsScreen({required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plant['name']),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Image.network(
                '${plant['image']}',
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'Name: ${plant['name']}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Price: ${plant['price']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Category: ${plant['category']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '${plant['description']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text('Add to Cart'),
            )
          ],
        ),
      ),
    );
  }
}
