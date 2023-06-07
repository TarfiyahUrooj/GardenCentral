/*class PlantDetails {
  String name;
  int price;
  String category;
  String description;
  String imageUrl;
  int height;
  List<String> specifications;

  PlantDetails({
    required this.name,
    required this.price,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.height,
    required this.specifications,
  });
}*/

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String title;
  String image;
  double price;
  String category;
  String description;

  ProductModel({
    required this.title,
    required this.image,
    required this.price,
    required this.category,
    required this.description,
  });
}
