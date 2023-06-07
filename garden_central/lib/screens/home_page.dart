import 'dart:math';

import 'package:flutter/material.dart';
import 'package:garden_central/screens/care.dart';
import 'package:garden_central/components/side_bar.dart';
import 'package:garden_central/screens/for_you.dart';
import 'package:garden_central/screens/cart.dart';
import 'package:garden_central/screens/plants/all_plants.dart';
import 'package:garden_central/screens/plants/new_arrival.dart';
import 'package:garden_central/screens/style.dart';
import 'package:garden_central/scroll_list.dart';
import 'package:garden_central/components/custom_appbar.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, WidgetBuilder> routes = {
    '/new_arrival': (context) => NewArrivalPage(),
    '/style_home': (context) => StyleHomePage(),
    '/care_guide': (context) => CareGuidePage(),
    '/for_you': (context) => ForYouPage(),
  };

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
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
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: [
                  Card(
                    child: Image.asset("assets/images/hp3.jpeg"),
                    elevation: 8,
                  ),
                  Positioned(
                    top: 190,
                    child: Text(
                      'Bringing Nature Home: \n Shop Plants with Ease',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      fixedSize: const Size(120, 50),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllPlants(),
                        ),
                      );
                    },
                    child: Text("SHOP ALL"),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
              ),
              ScrollList(),
            ],
          ),
        ),
      ),
    );
  }
}
