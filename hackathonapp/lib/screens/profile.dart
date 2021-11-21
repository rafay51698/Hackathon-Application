import 'package:flutter/material.dart';
import 'package:hackathonapp/model/all_data.dart';
import 'package:hackathonapp/screens/navappbars/appbar.dart';

import 'package:hackathonapp/theme/colors.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: black,
        appBar: AppBar(
          backgroundColor: white,
          foregroundColor: primary,
          title: Text(
            'Profile',
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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    color: white,
                    // margin: const EdgeInsets.only(top: 20),
                    height: MediaQuery.of(context).size.height * 0.34,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10, top: 10),
                          child: const CircleAvatar(
                            radius: 70,
                            backgroundImage: AssetImage('assets/rafaycv.jpg'),
                          ),
                        ),
                        Text(
                          username ?? "Guest User",
                          style: TextStyle(
                              color: primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 23),
                        ),
                      ],
                    ),
                  ),
                  profTile('Email', useremail ?? "guest123@gmail.com"),
                  profTile('Phone Number', '0900786601'),
                  profTile('Date Of Birth', "12-16-2000"),
                  profTile('City', "Karachi"),
                ],
              ),
            ),
          ),
        ));
  }

  Widget profTile(head, subtitle) {
    return ListTile(
      title: Text(
        head,
        style: TextStyle(color: primary, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
    );
  }
}
