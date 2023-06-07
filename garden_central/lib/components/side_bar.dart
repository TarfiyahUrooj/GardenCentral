import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garden_central/bloc/theme/bloc/theme_bloc.dart';
import 'package:garden_central/screens/home_page.dart';
import 'package:garden_central/screens/login/login_screen.dart';
import 'package:garden_central/screens/plants/bonsai.dart';
import 'package:garden_central/screens/plants/indoor_plants.dart';
import 'package:garden_central/screens/plants/outdoor_plants.dart';
import 'package:garden_central/screens/plants/succulents.dart';

class SideBar extends StatelessWidget {
  SideBar({Key? key});

  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: Text("Profile"),
          ),
          Theme(
            data: Theme.of(context).copyWith(
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
            ),
            child: Column(
              children: [
                ListTile(
                  title: const Text("About us"),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('About Us'),
                          content: Text(
                              "At Garden Central, we are dedicated to bringing the beauty and tranquility of nature into your home. With a passion for plants and a commitment to customer satisfaction, we strive to provide a wide variety of high-quality plants that will enrich your living spaces. Our team of experts ensures that each plant is carefully nurtured and selected to thrive in different environments. We believe in the power of greenery to uplift moods, improve air quality, and create a soothing atmosphere. With us, you'll find not just plants but also a community that shares the love for nature. Let us help you bring the refreshing essence of nature indoors."),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                ListTile(
                  title: const Text("Homepage"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                ),
                ListTile(
                  title: const Text("Indoor Plants"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => IndoorPlants()),
                    );
                  },
                ),
                ListTile(
                  title: const Text("Outdoor Plants"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OutdoorPlants()),
                    );
                  },
                ),
                ListTile(
                  title: const Text("Bonsai"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Bonsai()),
                    );
                  },
                ),
                ListTile(
                  title: const Text("Succulents"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Succulents()),
                    );
                  },
                ),
                BlocBuilder<ThemeBloc, ThemeState>(
                  builder: (context, state) {
                    return Switch(
                        value: switchValue,
                        onChanged: (newValue) {
                          newValue
                              ? context.read<ThemeBloc>().add(SwitchOnEvent())
                              : context.read<ThemeBloc>().add(SwitchOffEvent());
                        });
                  },
                ),
                ListTile(
                  title: const Text("Signout"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LogInScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
