import 'package:flutter/material.dart';
import 'package:hackathonapp/login/login.dart';

import 'package:hackathonapp/screens/about.dart';
import 'package:hackathonapp/screens/cart.dart';
import 'package:hackathonapp/screens/fav.dart';
import 'package:hackathonapp/theme/colors.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: primary),
            padding: const EdgeInsets.all(0),
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: primary),
              accountName: const Text(
                "AbdulRafay",
              ),
              accountEmail: const Text("Rafay51698@gmail.com"),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/rafaycv.jpg'),
              ),
            ),
          ),
          drawertile(context, Login(), 'logout', Icon(Icons.logout)),
          drawertile(context, CartPage(), 'Cart', Icon(Icons.shopping_cart)),
          drawertile(context, FavPage(), 'Favourites', Icon(Icons.favorite)),
          drawertile(context, AboutUs(), 'About Us', Icon(Icons.info)),
        ],
      ),
    );
  }

  ListTile drawertile(BuildContext context, page, name, Icon abc) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      leading: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ),
          );
        },
        icon: abc,
      ),
      title: Text(name),
      trailing: Icon(Icons.arrow_forward),
    );
  }
}
