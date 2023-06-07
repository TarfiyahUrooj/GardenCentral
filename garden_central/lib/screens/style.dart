import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StyleHomePage extends StatefulWidget {
  @override
  _StyleHomePageState createState() => _StyleHomePageState();
}

class _StyleHomePageState extends State<StyleHomePage> {
  final CollectionReference _stylesCollection =
      FirebaseFirestore.instance.collection('styles');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Garden Central',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _stylesCollection.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              String imagePath = data['image'];
              String title = data['description'];

              return Container(
                //width: double.infinity,
                //height: 150,
                child: Card(
                  elevation: 4,
                  child: Column(
                    children: [
                      Image.network(
                        imagePath,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 100,
                      ),
                      SizedBox(height: 10),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
