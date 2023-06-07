import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:garden_central/screens/login/login_screen.dart';
import 'package:garden_central/scroll_list_items.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class ScrollList extends StatefulWidget {
  const ScrollList({super.key});

  @override
  State<ScrollList> createState() => _ScrollListState();
}

class _ScrollListState extends State<ScrollList> {
  List<ScrollListItems> scrollList = [
    ScrollListItems('assets/images/hp1.png', 'NEW ARRIVAL', '/new_arrival'),
    ScrollListItems('assets/images/hp2.jpg', 'STYLE YOUR HOME', '/style_home'),
    ScrollListItems('assets/images/hp3.jpeg', 'CARE GUIDE', '/care_guide'),
    ScrollListItems('assets/images/hp4.jpg', 'FOR YOU', '/for_you'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ScrollSnapList(
        itemBuilder: _buildListItem,
        itemCount: scrollList.length,
        itemSize: 150,
        onItemFocus: (index) {},
        dynamicItemSize: true,
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    ScrollListItems scrollListItems = scrollList[index];
    return SizedBox(
      width: 150,
      height: 300,
      child: Card(
        color: Colors.white,
        elevation: 12,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          child: GestureDetector(
            onTap: () {
              // Retrieve the route for the tapped image
              String route = scrollListItems.route;

              // Navigate to the corresponding route
              Navigator.pushNamed(context, route);
            },
            child: Column(
              children: [
                Image.asset(
                  scrollListItems.imagePath,
                  fit: BoxFit.cover,
                  width: 150,
                  height: 180,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  scrollListItems.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
