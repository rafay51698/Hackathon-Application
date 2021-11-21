import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hackathonapp/model/all_data.dart';
import 'package:hackathonapp/screens/cart.dart';

import 'package:hackathonapp/screens/fav.dart';
import 'package:hackathonapp/screens/navappbars/appbar.dart';

import 'package:hackathonapp/screens/category/horizontal.dart';

import 'package:hackathonapp/screens/category/vertical.dart';
import 'package:hackathonapp/screens/drawer/drawer.dart';
import 'package:hackathonapp/theme/colors.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        backgroundColor: white,
        foregroundColor: primary,
        title: const Text(
          'Home',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          action(context),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [HorView(), VertView()],
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }

  Widget action(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          
          Align(
            alignment: Alignment.topRight,
            child: Text(cartlist.length.toString()),
          ),
          Align(
            // alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ),
                );
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
