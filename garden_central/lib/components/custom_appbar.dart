import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onSearchPressed;
  final VoidCallback onCartPressed;

  const CustomAppBar({
    required this.title,
    required this.onSearchPressed,
    required this.onCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      title: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: onSearchPressed,
        ),
        IconButton(
          icon: Icon(Icons.shopping_bag_outlined),
          onPressed: onCartPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

/*class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Home',
        onSearchPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchScreen()),
          );
        },
        onCartPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartScreen()),
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Screen 1'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Screen 1
              },
            ),
            ListTile(
              title: Text('Screen 2'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Screen 2
              },
            ),
            ListTile(
              title: Text('Screen 3'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Screen 3
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}*/

/*class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Search',
        onSearchPressed: () {},
        onCartPressed: () {},
      ),
      body: Center(
        child: Text('Search Screen'),
      ),
    );
  }
}

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
*/
