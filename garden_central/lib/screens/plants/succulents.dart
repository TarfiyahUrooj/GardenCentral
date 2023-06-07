/*import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:garden_central/screens/cart.dart';
import 'package:garden_central/model/plant_details.dart';

import 'package:garden_central/screens/details/details_screen.dart';
import 'package:garden_central/components/side_bar.dart';
import 'package:garden_central/components/custom_appbar.dart';

class Succulents extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: CustomAppBar(
        title: 'Garden Central',
        onSearchPressed: () {},
        onCartPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartScreen(),
            ),
          );
        },
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('Succulents').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<ProductModel> productList = snapshot.data!.docs.map(
              (doc) {
                final data = doc.data() as Map<String, dynamic>;
                return ProductModel(
                  title: data['name'],
                  image: data['image'],
                  price: data['price'],
                  category: data['category'],
                  description: data['description'],
                );
              },
            ).toList();

            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/indoor.jpg'),
                          fit: BoxFit.cover)),
                  height: 100,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'SUCCULENTS',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      final product = productList[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailsScreen(product),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: GridTile(
                            child: Image.network(
                              product.image,
                              fit: BoxFit.cover,
                            ),
                            footer: GridTileBar(
                              backgroundColor: Colors.white38,
                              title: Text(
                                product.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                              subtitle: Text(
                                product.price,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:garden_central/components/custom_appbar.dart';
import 'package:garden_central/components/side_bar.dart';
import 'package:garden_central/screens/cart.dart';
import 'package:garden_central/screens/plants/category.dart';

class Succulents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Category(category: 'Succulent'),
    );
  }
}
