import 'package:flutter/material.dart';
import 'package:hackathonapp/screens/fav.dart';
import 'package:hackathonapp/screens/home.dart';
import 'package:hackathonapp/screens/profile.dart';
import 'package:hackathonapp/screens/search.dart';
import 'package:hackathonapp/theme/colors.dart';


class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  void go(page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      // height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        color: white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          footerItem(Icons.home, 'Home', const LandingPage()),
          footerItem(Icons.search, 'Search', const SearchPage()),
          footerItem(Icons.person, 'Profile', const MyProfile()),
        ],
      ),
    );
  }

  Widget footerItem(icon, label, page) {
    return GestureDetector(
      onTap: () {
        go(page);
      },
      child: Column(
        children: [
          Icon(
            icon,
            size: 25,
            color: primary,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            label,
            style: TextStyle(color: secondary),
          ),
        ],
      ),
    );
  }
}
