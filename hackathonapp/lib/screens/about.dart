import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hackathonapp/screens/fav.dart';
import 'package:hackathonapp/screens/navappbars/appbar.dart';
import 'package:hackathonapp/screens/drawer/drawer.dart';
import 'package:hackathonapp/theme/colors.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        foregroundColor: primary,
        title: Text(
          'About Us',
          style: const TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.red,
              ))
        ],
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            // margin: EdgeInsets.only(top: 10),
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            color: Colors.lightBlueAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: primary,
                    child: Icon(
                      Icons.email_outlined,
                      color: white,
                      size: 100,
                    ),
                  ),
                ),
                Text(
                  'Drop line about us',
                  style: TextStyle(color: white, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.more_horiz,
                  color: white,
                  size: 35,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Icon(
                  Icons.location_on,
                  color: primary,
                  size: 30,
                ),
                const Text('Street 23, xyz appartments, karachi.'),
                const Text('Open Map'),
                const Icon(
                  Icons.phone_android,
                  color: Colors.red,
                  size: 30,
                ),
                const Text('0320-9339399'),
                Icon(
                  Icons.watch_later_outlined,
                  color: primary,
                  size: 30,
                ),
                const Text('Monday-Friday'),
                const Text('09:00-17:00'),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
