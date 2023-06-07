/*import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AllPlants extends StatefulWidget {
  @override
  _AllPlantsState createState() => _AllPlantsState();
}

class _AllPlantsState extends State<AllPlants> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid View'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.collectionGroup('plants').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: documents.length,
              itemBuilder: (context, index) {
                final item = documents[index].data() as Map<String, dynamic>;

                return GridTile(
                  child: Image.network(

                    item['image'],
                    fit: BoxFit.cover,
                  ),
                  footer: GridTileBar(
                    backgroundColor: Colors.black54,
                    title: Text(
                      item['name'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
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
}*/ //1

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:garden_central/components/custom_appbar.dart';
import 'package:garden_central/components/side_bar.dart';
import 'package:garden_central/screens/cart.dart';
import 'package:garden_central/screens/details/details_screen.dart';

class AllPlants extends StatefulWidget {
  @override
  _AllPlantsState createState() => _AllPlantsState();
}

class _AllPlantsState extends State<AllPlants> {
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
                'ALL PLANTS',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: firestore.collectionGroup('plants').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final List<QueryDocumentSnapshot> documents =
                      snapshot.data!.docs;

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      final item =
                          documents[index].data() as Map<String, dynamic>;

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlantDetailsScreen(
                                      plant: item,
                                      //cartScreen: CartScreen(),
                                    )),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GridTile(
                            child: Image.network(
                              item['image'],
                              fit: BoxFit.cover,
                            ),
                            footer: GridTileBar(
                              backgroundColor: Colors.white54,
                              title: Text(
                                item['name'],
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                              subtitle: Text(
                                'PKR ${item['price']}',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}





// drawer: SideBar(),
//       appBar: CustomAppBar(
//         title: 'Garden Central',
//         onSearchPressed: () {},
//         onCartPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => CartScreen(),
//             ),
//           );
//         },
//       ),



// footer: GridTileBar(
//                         backgroundColor: Colors.white38,
//                         title: Text(
//                           item['name'],
//                           style: TextStyle(
//                               fontWeight: FontWeight.w700, color: Colors.black),
//                         ),
//                         subtitle: Text(
//                           item['price'],
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       ),



/*import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AllDocumentsScreen extends StatefulWidget {
  @override
  _AllDocumentsScreenState createState() => _AllDocumentsScreenState();
}

class _AllDocumentsScreenState extends State<AllDocumentsScreen> {
  Future<List<Map<String, dynamic>>> _documentsFuture;

  @override
  void initState() {
    super.initState();
    _documentsFuture = getAllDocuments();
  }

  Future<List<Map<String, dynamic>>> getAllDocuments() async {
    List<Map<String, dynamic>> allDocuments = [];

    QuerySnapshot<Map<String, dynamic>> collectionsSnapshot =
        await FirebaseFirestore.instance.collections();

    for (CollectionReference collectionRef in collectionsSnapshot.docs) {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await collectionRef.get();

      List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
          querySnapshot.docs;

      for (QueryDocumentSnapshot<Map<String, dynamic>> document in documents) {
        allDocuments.add(document.data());
      }
    }

    return allDocuments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Documents'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _documentsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data.isEmpty) {
            return Text('No documents found.');
          } else {
            final List<Map<String, dynamic>> documents = snapshot.data;

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: documents.length,
              itemBuilder: (context, index) {
                final item = documents[index];

                return GridTile(
                  child: Image.network(
                    item['image'],
                    fit: BoxFit.cover,
                  ),
                  footer: GridTileBar(
                    backgroundColor: Colors.black54,
                    title: Text(
                      item['name'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}*/
