import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:garden_central/components/custom_appbar.dart';
import 'package:garden_central/components/side_bar.dart';
import 'package:garden_central/screens/cart.dart';
import 'package:garden_central/screens/details/details_screen.dart';

class Category extends StatelessWidget {
  final String category;

  Category({required this.category});

  @override
  Widget build(BuildContext context) {
    String containerText = '';

    if (category == 'Indoor') {
      containerText = 'INDOOR PLANTS';
    } else if (category == 'Outdoor') {
      containerText = 'OUTDOOR PLANTS';
    } else if (category == 'Bonsai') {
      containerText = 'BONSAI';
    } else if (category == 'Succulent') {
      containerText = 'SUCCULENTS';
    } else if (category == 'New Arrival') {
      containerText = 'NEW ARRIVALS';
    }
    // Add more else if conditions for other categories if needed

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
      body: Column(
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
                containerText,
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('plants')
                  .where('category', isEqualTo: category)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                  final plants = snapshot.data!.docs;

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: plants.length,
                    itemBuilder: (context, index) {
                      final plant =
                          plants[index].data() as Map<String, dynamic>;

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlantDetailsScreen(
                                plant: plant,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GridTile(
                            child: Image.network(
                              plant['image'],
                              fit: BoxFit.cover,
                            ),
                            footer: GridTileBar(
                              backgroundColor: Colors.white54,
                              title: Text(
                                plant['name'],
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                              subtitle: Text(
                                'PKR ${plant['price']}',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }

                return Center(child: Text('No plants found'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
